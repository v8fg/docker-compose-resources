#!/usr/bin/env bash

# image info, version may auto update
TAG=13.12.4
USER=v8fg
NAME=gitlab

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
