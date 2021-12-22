#!/usr/bin/env bash

# image info, version may auto update
TAG=ce-5.7.0.8
USER=v8fg
NAME=aerospike

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}
