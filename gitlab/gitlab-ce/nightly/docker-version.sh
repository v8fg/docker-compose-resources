#!/usr/bin/env bash

# image info, version may auto update
TAG=nighty
USER=v8fg
NAME=gitlab-ce

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
