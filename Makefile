SHELL := /bin/sh

existBash = $(shell cat /etc/shells|grep -w /bin/bash|grep -v grep)
ifneq (, $(strip ${existBash}))
	SHELL = /bin/bash
endif

$(info shell will use ${SHELL})

BASEDIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

docker_build_script=${BASEDIR}/scripts/docker-build.sh
docker_push_script=${BASEDIR}/scripts/docker-push.sh

.PHONY: default all golang golang-upx node

default: golang node

all: golang golang-upx node

# golang build and push, default(latest)
golang: golang-build golang-push
# golang build and push with upx, default(latest)
golang-upx: golang-build-upx golang-push-upx

# golang build and push, latest
golang-build:
	bash ${docker_build_script} ${BASEDIR}/golang/latest
golang-push:
	bash ${docker_push_script} ${BASEDIR}/golang/latest
# golang build and push with upx, latest
golang-build-upx:
	bash ${docker_build_script} ${BASEDIR}/golang/latest-upx
golang-push-upx:
	bash ${docker_push_script} ${BASEDIR}/golang/latest-upx

node: node-build node-push
node-build:
	bash ${docker_build_script} ${BASEDIR}/node/latest
node-push:
	bash ${docker_push_script} ${BASEDIR}/node/latest
