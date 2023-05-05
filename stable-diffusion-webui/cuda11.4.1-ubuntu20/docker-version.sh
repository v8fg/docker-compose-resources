#!/usr/bin/env bash

# image info, version may auto update
TAG=sd-cuda11.4.1-ubuntu20
USER=v8fg
NAME=stable-diffusion-webui

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# ENV="-e "
# PORT="-p "
