#!/usr/bin/env bash

# image info, version may auto update
TAG=6.0.5-alpine3.12
USER=v8fg
NAME=redis

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
