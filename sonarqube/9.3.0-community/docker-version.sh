#!/usr/bin/env bash

# image info, version may auto update
TAG=9.3.0-community
USER=v8fg
NAME=sonarqube

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

PORT=" -p 9000:9000"
ENV=" -e ALLOW_EMPTY_PASSWORD=yes \
--user=sonarqube \
-v $PWD/conf:/opt/sonarqube/conf \
-v $PWD/data/sonarqube/logs:/opt/sonarqube/logs \
-v $PWD/data/sonarqube/data:/opt/sonarqube/data \
-v $PWD/data/sonarqube/extensions:/opt/sonarqube/extensions 
"
