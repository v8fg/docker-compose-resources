#!/usr/bin/env bash

# image info, version may auto update
TAG=2.291-centos7
USER=v8fg
NAME=jenkins

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

DAEMON="-d"
PORT="-p 8080:8080 -p 50000:50000"
ENV="-v $PWD/data/jenkins_home:/var/jenkins_home"
