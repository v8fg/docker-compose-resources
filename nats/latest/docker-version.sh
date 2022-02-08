#!/usr/bin/env bash

# image info, version may auto update
TAG=latest
USER=v8fg
NAME=nats

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

ENV="-v $PWD/conf/:/etc/nats/"
PORT=" -p 4222:4222 -p 6222:6222 -p 8222:8222 "
