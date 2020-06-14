#!/usr/bin/env bash

# image info, version may auto update
tag_version=12.18.0-buster-slim
domain=v8fg
name=node
image_repo=${domain}/${name}
tag_name=${image_repo}:${tag_version}
