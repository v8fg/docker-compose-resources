#!/usr/bin/env bash

# image info, version may auto update
tag_version=1.19.0-alpine-perl
domain=v8fg
name=nginx
image_repo=${domain}/${name}
tag_name=${image_repo}:${tag_version}
