SHELL := /bin/sh

existBash = $(shell cat /etc/shells|grep -w /bin/bash|grep -v grep)
ifneq (, $(strip ${existBash}))
	SHELL = /bin/bash
endif

$(info shell will use ${SHELL})

BASEDIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

docker_build_script=${BASEDIR}/../scripts/docker-build.sh
docker_push_script=${BASEDIR}/../scripts/docker-push.sh
docker_run_script=${BASEDIR}/../scripts/docker-run.sh

.PHONY: default all latest 1-alpine 1.52-alpine

default: latest

all: latest 1-alpine 1.52-alpine

# latest build and push
latest: build push

# version default
build: build-latest
push: push-latest
run: run-latest

# version latest
build-latest:
	bash ${docker_build_script} ${BASEDIR}/latest
push-latest:
	bash ${docker_push_script} ${BASEDIR}/latest
run-latest:
	bash ${docker_run_script} ${BASEDIR}/latest

# version 1.52-alpine
1.52-alpine: build-1.52-alpine push-1.52-alpine
build-1.52-alpine:
	bash ${docker_build_script} ${BASEDIR}/1.52-alpine
push-1.52-alpine:
	bash ${docker_push_script} ${BASEDIR}/1.52-alpine
run-1.52-alpine:
	bash ${docker_run_script} ${BASEDIR}/1.52-alpine

# version 1-alpine
1-alpine: build-1-alpine push-1-alpine
build-1-alpine:
	bash ${docker_build_script} ${BASEDIR}/1-alpine
push-1-alpine:
	bash ${docker_push_script} ${BASEDIR}/1-alpine
run-1-alpine:
	bash ${docker_run_script} ${BASEDIR}/1-alpine

