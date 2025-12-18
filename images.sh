#!/bin/bash

# --- Configuration Section ---
# Get the base directory where this script is located (Project Root)
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Color definitions for terminal output
NO_COLOR='\033[0m'
OK_COLOR='\033[32;01m'
WARN_COLOR='\033[33;01m'
ERROR_COLOR='\033[31;01m'

# --- Argument Parsing ---
# Usage: ./build.sh [action] [service_name] [image_name_or_all]
COMMAND="${1:-list}"
TARGET_SERVICE="$2"
TARGET_IMAGE="$3"

# --- Helper Functions ---

# Construct the path to the images.json for a specific service
get_json_path() {
    echo "${BASEDIR}/$1/images.json"
}

# Locate the deployment directory where the Dockerfile resides
# Logic: Service Folder -> deployments -> Container Name
locate_deploy_dir() {
    local service=$1
    local image=$2
    local json_file=$(get_json_path "$service")

    if [ ! -f "$json_file" ]; then
        echo -e "${ERROR_COLOR}Error: Service folder or config missing: $json_file${NO_COLOR}" >&2
        return 1
    fi

    # Extract the container name associated with the specific image version via jq
    local container_name=$(jq -r ".[] | select(.my_image == \"$image\") | .container // \"$service\"" "$json_file" 2>/dev/null)

    if [ -z "$container_name" ] || [ "$container_name" == "null" ]; then
        echo -e "${ERROR_COLOR}Error: Image name '$image' not found in $service/images.json${NO_COLOR}" >&2
        return 1
    fi

    local deploy_path="${BASEDIR}/${service}/deployments/${container_name}"
    echo "$deploy_path"
}

# --- Core Logic Functions ---

# List all services and their defined image versions/status
cmd_list() {
    echo -e "${OK_COLOR}--- Service Image Registry Summary ---${NO_COLOR}"
    find "$BASEDIR" -maxdepth 2 -name "images.json" | while read -r f; do
        local s_name=$(basename "$(dirname "$f")")
        echo -e "\n📂 Service: [${s_name}]"
        jq -r '.[] | ["  - \(.my_image)", "[\(.status // "pending")]", "(\(.container // "default"))"] | @tsv' "$f" | \
        awk 'BEGIN {FS="\t"} { printf "%-45s %-15s %s\n", $1, $2, $3 }'
    done
}

# Remove Docker images from local storage
cmd_rmi() {
    if [ -z "$TARGET_SERVICE" ]; then
        echo -e "${WARN_COLOR}Usage: $0 rmi [service_name] [optional_image_name]${NO_COLOR}"
        exit 1
    fi

    local json_file=$(get_json_path "$TARGET_SERVICE")
    if [ ! -f "$json_file" ]; then
        echo -e "${ERROR_COLOR}Error: Cannot find images.json for service '$TARGET_SERVICE'${NO_COLOR}"
        exit 1
    fi

    # Determine if we remove a specific version or all versions in the JSON
    local images_to_remove
    if [ -n "$TARGET_IMAGE" ] && [ "$TARGET_IMAGE" != "all" ]; then
        images_to_remove=("$TARGET_IMAGE")
    else
        echo -e "${WARN_COLOR}Targeting ALL images for service: [$TARGET_SERVICE]${NO_COLOR}"
        images_to_remove=($(jq -r '.[] | .my_image' "$json_file"))
    fi

    for img in "${images_to_remove[@]}"; do
        if [[ "$(docker images -q "$img" 2>/dev/null)" == "" ]]; then
            echo -e "${WARN_COLOR}Skipping: Image '$img' does not exist locally.${NO_COLOR}"
        else
            echo -e "${OK_COLOR}Removing Image: $img${NO_COLOR}"
            docker rmi "$img"
        fi
    done
}

# Execute Docker Build/Push/Run tasks
execute_docker() {
    local action=$1
    if [ -z "$TARGET_SERVICE" ] || [ -z "$TARGET_IMAGE" ]; then
        echo -e "${WARN_COLOR}Usage: $0 $action [service_name] [full_image_name]${NO_COLOR}"
        exit 1
    fi

    local work_dir=$(locate_deploy_dir "$TARGET_SERVICE" "$TARGET_IMAGE")
    if [ $? -ne 0 ]; then exit 1; fi

    if [ ! -d "$work_dir" ] || [ ! -f "${work_dir}/Dockerfile" ]; then
        echo -e "${ERROR_COLOR}Error: Build directory or Dockerfile missing at $work_dir${NO_COLOR}"
        exit 1
    fi

    cd "$work_dir" || exit 1
    echo -e "${OK_COLOR}Action: [$action] | Dir: $work_dir${NO_COLOR}"

    case "$action" in
        build) docker build -t "$TARGET_IMAGE" . ;;
        push)  docker push "$TARGET_IMAGE" ;;
        run)
            if [ -f "docker-compose.yaml" ]; then
                docker-compose up -d
            else
                docker run -d --name "test-$(date +%s)" "$TARGET_IMAGE"
            fi
            ;;
    esac
}

# --- Main Entry Point ---

case "$COMMAND" in
    list) cmd_list ;;
    rmi)  cmd_rmi  ;;
    build|push|run) execute_docker "$COMMAND" ;;
    all)
        execute_docker "build" && execute_docker "push"
        ;;
    *)
        echo "Usage: $0 {list|rmi|build|push|run|all} [service_name] [image_name|all]"
        exit 1
        ;;
esac
