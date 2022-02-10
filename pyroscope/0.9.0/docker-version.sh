#!/usr/bin/env bash

# image info, version may auto update
TAG=0.9.0
USER=v8fg
NAME=pyroscope

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
PORT=" -p 4040:4040 "
PARAMS=" server "
