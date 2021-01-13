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

.PHONY: default all latest 6.0.5-alpine 6.0.5-alpine3.12 6.0.5-buster 6.0.10-alpine3.12

default: latest

all: latest 6.0.5-alpine 6.0.5-alpine3.12 6.0.5-buster 6.0.10-alpine3.12

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

# version 6.0.5-alpine
6.0.5-alpine: build-6.0.5-alpine push-6.0.5-alpine
build-6.0.5-alpine:
	bash ${docker_build_script} ${BASEDIR}/6.0.5-alpine
push-6.0.5-alpine:
	bash ${docker_push_script} ${BASEDIR}/6.0.5-alpine
run-6.0.5-alpine:
	bash ${docker_run_script} ${BASEDIR}/6.0.5-alpine

# version 6.0.5-alpine3.12
6.0.5-alpine3.12: build-6.0.5-alpine3.12 push-6.0.5-alpine3.12
build-6.0.5-alpine3.12:
	bash ${docker_build_script} ${BASEDIR}/6.0.5-alpine3.12
push-6.0.5-alpine3.12:
	bash ${docker_push_script} ${BASEDIR}/6.0.5-alpine3.12
run-6.0.5-alpine3.12:
	bash ${docker_run_script} ${BASEDIR}/6.0.5-alpine3.12

# version 6.0.5-buster
6.0.5-buster: build-6.0.5-buster push-6.0.5-buster
build-6.0.5-buster:
	bash ${docker_build_script} ${BASEDIR}/6.0.5-buster
push-6.0.5-buster:
	bash ${docker_push_script} ${BASEDIR}/6.0.5-buster
run-6.0.5-buster:
	bash ${docker_run_script} ${BASEDIR}/6.0.5-buster

# version 6.0.10-alpine3.12
6.0.10-alpine3.12: build-6.0.10-alpine3.12 push-6.0.10-alpine3.12
build-6.0.10-alpine3.12:
	bash ${docker_build_script} ${BASEDIR}/6.0.10-alpine3.12
push-6.0.10-alpine3.12:
	bash ${docker_push_script} ${BASEDIR}/6.0.10-alpine3.12
run-6.0.10-alpine3.12:
	bash ${docker_run_script} ${BASEDIR}/6.0.10-alpine3.12
