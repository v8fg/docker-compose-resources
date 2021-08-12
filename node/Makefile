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

.PHONY: default all latest 16-buster 16-buster-slim 16-alpine3.14 \
	14.4.0-buster 14.4.0-buster-slim 14.4.0-alpine3.12 14.4-alpine3.12

default: latest

all: latest 16-buster 16-buster-slim 16-alpine3.14 14.4.0-buster 14.4.0-buster-slim 14.4.0-alpine3.12 14.4-alpine3.12

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


# version 16-buster
16-buster: build-16-buster push-16-buster
build-16-buster:
	bash ${docker_build_script} ${BASEDIR}/16-buster
push-16-buster:
	bash ${docker_push_script} ${BASEDIR}/16-buster
run-16-buster:
	bash ${docker_run_script} ${BASEDIR}/16-buster

# version 16-buster-slim
16-buster-slim: build-16-buster-slim push-16-buster-slim
build-16-buster-slim:
	bash ${docker_build_script} ${BASEDIR}/16-buster-slim
push-16-buster-slim:
	bash ${docker_push_script} ${BASEDIR}/16-buster-slim
run-16-buster-slim:
	bash ${docker_run_script} ${BASEDIR}/16-buster-slim

# version 16-alpine3.14
16-alpine3.14: build-16-alpine3.14 push-16-alpine3.14
build-16-alpine3.14:
	bash ${docker_build_script} ${BASEDIR}/16-alpine3.14
push-16-alpine3.14:
	bash ${docker_push_script} ${BASEDIR}/16-alpine3.14
run-16-alpine3.14:
	bash ${docker_run_script} ${BASEDIR}/16-alpine3.14

# version 14.4.0-buster
14.4.0-buster: build-14.4.0-buster push-14.4.0-buster
build-14.4.0-buster:
	bash ${docker_build_script} ${BASEDIR}/14.4.0-buster
push-14.4.0-buster:
	bash ${docker_push_script} ${BASEDIR}/14.4.0-buster
run-14.4.0-buster:
	bash ${docker_run_script} ${BASEDIR}/14.4.0-buster

# version 14.4.0-buster-slim
14.4.0-buster-slim: build-14.4.0-buster-slim push-14.4.0-buster-slim
build-14.4.0-buster-slim:
	bash ${docker_build_script} ${BASEDIR}/14.4.0-buster-slim
push-14.4.0-buster-slim:
	bash ${docker_push_script} ${BASEDIR}/14.4.0-buster-slim
run-14.4.0-buster-slim:
	bash ${docker_run_script} ${BASEDIR}/14.4.0-buster-slim

# version 14.4.0-alpine3.12
14.4.0-alpine3.12: build-14.4.0-alpine3.12 push-14.4.0-alpine3.12
build-14.4.0-alpine3.12:
	bash ${docker_build_script} ${BASEDIR}/14.4.0-alpine3.12
push-14.4.0-alpine3.12:
	bash ${docker_push_script} ${BASEDIR}/14.4.0-alpine3.12
run-14.4.0-alpine3.12:
	bash ${docker_run_script} ${BASEDIR}/14.4.0-alpine3.12

# version 14.4-alpine3.12
14.4-alpine3.12: build-14.4-alpine3.12 push-14.4-alpine3.12
build-14.4-alpine3.12:
	bash ${docker_build_script} ${BASEDIR}/14.4-alpine3.12
push-14.4-alpine3.12:
	bash ${docker_push_script} ${BASEDIR}/14.4-alpine3.12
run-14.4-alpine3.12:
	bash ${docker_run_script} ${BASEDIR}/14.4-alpine3.12
