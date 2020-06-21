#!/usr/bin/env bash

# image info, version may auto update
TAG=latest
USER=v8fg
NAME=grafana

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# ARGS ...
# MYSQL_ROOT_PASSWORD=root
# DAEMON="-d"
# ENV="-e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}"
PORT="-p 3000:3000"