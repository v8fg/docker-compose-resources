#!/usr/bin/env bash

# image info, version may auto update
TAG=2.13-2.8.1
USER=v8fg
NAME=kafka

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
