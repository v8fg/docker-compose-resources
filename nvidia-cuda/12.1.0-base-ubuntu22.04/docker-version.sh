#!/usr/bin/env bash

# image info, version may auto update
TAG=12.1.0-ubuntu22.04
USER=v8fg
NAME=nvidia-cuda-base

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# ENV="-e "
# PORT="-p "
