#!/usr/bin/env bash

# image info, version may auto update
TAG=11.4.0-centos8
USER=v8fg
NAME=nvidia-cuda-base

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# ENV="-e "
# PORT="-p "
