#!/usr/bin/env bash

# image info, version may auto update
TAG=9.6.24-alpine
USER=v8fg
NAME=postgres

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# DAEMON="-d"
PORT="-p 5432:5432"
