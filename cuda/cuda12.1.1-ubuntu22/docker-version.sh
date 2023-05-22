#!/usr/bin/env bash

# image info, version may auto update
TAG=12.1.1-ubuntu22
USER=v8fg
NAME=cuda

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

ENV="-e JITTOR_HOME:/data -v /data/jittor_data:/data"
PORT="-p 51234:51234"
