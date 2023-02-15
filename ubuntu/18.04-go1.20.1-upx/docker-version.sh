#!/usr/bin/env bash

# image info, version may auto update
TAG=18.04-go1.20.1-upx
USER=v8fg
NAME=ubuntu

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
