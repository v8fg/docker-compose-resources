#!/usr/bin/env bash

# image info, version may auto update
TAG=3.9
USER=v8fg
NAME=python-self

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
