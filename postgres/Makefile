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

.PHONY: default all latest 9.6.18-alpine 13-alpine

default: latest 9.6.18-alpine 13-alpine

all: latest 9.6.18-alpine 13-alpine

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

# version 9.6.18-alpine
9.6.18-alpine: build-9.6.18-alpine push-9.6.18-alpine
build-9.6.18-alpine:
	bash ${docker_build_script} ${BASEDIR}/9.6.18-alpine
push-9.6.18-alpine:
	bash ${docker_push_script} ${BASEDIR}/9.6.18-alpine
run-9.6.18-alpine:
	bash ${docker_run_script} ${BASEDIR}/9.6.18-alpine

# version 13-alpine
13-alpine: build-13-alpine push-13-alpine
build-13-alpine:
	bash ${docker_build_script} ${BASEDIR}/13-alpine
push-13-alpine:
	bash ${docker_push_script} ${BASEDIR}/13-alpine
run-13-alpine:
	bash ${docker_run_script} ${BASEDIR}/13-alpine
