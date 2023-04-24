#!/usr/bin/env bash

# image info, version may auto update
TAG=latest
USER=v8fg
NAME=chatgpt-web

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

ENV="-e OPENAI_API_KEY= -e AUTH_SECRET_KEY="
PORT="-p 3630:3002"
