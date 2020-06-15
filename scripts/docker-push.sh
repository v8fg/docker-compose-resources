#!/usr/bin/env bash

# absolute path
current_path=$(
    # shellcheck disable=SC2046
    cd $(dirname "${BASH_SOURCE[0]}") || exit
    pwd
)

BASE_PATH=$1

DockerVersionfile=${BASE_PATH}/docker-version.sh
Dockerfile=${BASE_PATH}/Dockerfile

source ${current_path}/echo_color.sh
source ${DockerVersionfile}

if [[ ! -f ${DockerVersionfile} ]]; then
    echo_red "image version file ${DockerVersionfile} not exist"
    exit 1
fi

echo_green "push image with tag: ${tag_name}"

docker push "${tag_name}"
