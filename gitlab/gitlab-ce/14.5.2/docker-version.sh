#!/usr/bin/env bash

# image info, version may auto update
TAG=14.5.2
USER=v8fg
NAME=gitlab-ce

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# ARGS ...

# DAEMON="-d"
# ENV=""
PORT="-p 6622:22 -P 6680:80 6643:43"

