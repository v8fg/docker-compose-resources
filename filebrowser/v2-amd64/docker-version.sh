#!/usr/bin/env bash

# image info, version may auto update
TAG=v2-amd64
USER=v8fg
NAME=filebrowser

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

PORT="-p 18888:80"
