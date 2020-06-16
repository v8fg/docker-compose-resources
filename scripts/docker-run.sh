#!/usr/bin/env bash

version_dir=$1
DockerVersionfile=${version_dir}/docker-version.sh

if [[ ! -f ${DockerVersionfile} ]]; then
    echo_red "image version file ${DockerVersionfile} not exist"
    exit 1
fi

source ${DockerVersionfile}
echo -e "run image: ${LOCATION}"

# docker volume need the absolute path
docker run ${DAEMON} -it --name ${CONTAINER_NAME} ${PORT} ${ENV} --rm ${LOCATION}
