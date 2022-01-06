#!/usr/bin/env bash

# image info, version may auto update
TAG=latest
USER=v8fg
NAME=etcd

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

PORT="-p 12379:2379 -p 12380:2380"
ENV="--env ALLOW_NONE_AUTHENTICATION=yes"
