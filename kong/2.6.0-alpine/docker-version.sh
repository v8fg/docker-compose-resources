#!/usr/bin/env bash

# image info, version may auto update
TAG=2.6.0-alpine
USER=v8fg
NAME=kong

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
