#!/usr/bin/env bash

# image info, version may auto update
TAG=latest
USER=v8fg
NAME=nginx

REPOSITORY=${USER}/${NAME}
# image with tag, use to push image
LOCATION=${REPOSITORY}:${TAG}

# use to build container
CONTAINER_NAME=${USER}-${NAME}-${TAG}

# ARGS ...
NGINX_PORT=8080
# DAEMON="-d"
# VOLUMS="-v /some/content:/usr/share/nginx/html:ro"
# VOLUMS="-v /host/path/nginx.conf:/etc/nginx/nginx.conf:ro"
ENV="-e NGINX_PORT=${MYSQL_ROOT_PASSWORD}"
PORT="-p 8080:80"
