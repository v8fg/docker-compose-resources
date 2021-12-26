#!/usr/bin/env bash

# image info, version may auto update
TAG=2.9.1
USER=v8fg
NAME=pulsar

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

PARAMS="bin/pulsar standalone"
