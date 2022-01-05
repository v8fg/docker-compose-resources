#!/usr/bin/env bash

# image info, version may auto update
TAG=5.1-alpine3.14
USER=v8fg
NAME=bash

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
