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

if [[ ! -f ${DockerVersionfile} ]]; then
    echo_red "image version file ${DockerVersionfile} not exist"
    exit 1
fi

if [[ ! -f ${Dockerfile} ]]; then
    echo_red "Dockerfile ${Dockerfile} not exist"
    exit 1
fi


source ${DockerVersionfile}
 
echo_green "tag: ${tag_name}"

docker build -t "${tag_name}"  -f ${Dockerfile} ${BASE_PATH}
