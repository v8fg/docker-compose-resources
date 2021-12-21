#!/usr/bin/env bash

# image info, version may auto update
TAG=v1.14-debian-1
USER=v8fg
NAME=fluentd

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
