#!/usr/bin/env bash

# image info, version may auto update
TAG=1.34-musl
USER=v8fg
NAME=busybox

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
