#!/usr/bin/env bash

# image info, version may auto update
TAG=1.9.9
USER=v8fg
NAME=chatgpt-next-web

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# ENV="-e OPENAI_API_KEY= -e CODE="
PORT="-p 3690:3000"
