#!/usr/bin/env bash

# image info, version may auto update
TAG=1-alpine
USER=v8fg
NAME=rust

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

ENV="-v $PWD/data:/data"
