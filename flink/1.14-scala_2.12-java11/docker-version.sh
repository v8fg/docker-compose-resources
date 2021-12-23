#!/usr/bin/env bash

# image info, version may auto update
TAG=1.14-scala_2.12-java11
USER=v8fg
NAME=flink

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

PARAMS='jobmanager'
# PARAMS='taskmanager'
