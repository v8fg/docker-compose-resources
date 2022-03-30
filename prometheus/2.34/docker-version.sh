#!/usr/bin/env bash

# image info, version may auto update
TAG=2.34.0
USER=v8fg
NAME=prometheus

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# ARGS ...
# DAEMON="-d"
PORT="-p 3000:3000"
