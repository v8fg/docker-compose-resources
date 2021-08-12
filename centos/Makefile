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

.PHONY: default all latest 8 7

default: latest

all: latest 8 7

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

# version 8
8: build-8 push-8
build-8:
	bash ${docker_build_script} ${BASEDIR}/8
push-8:
	bash ${docker_push_script} ${BASEDIR}/8
run-8:
	bash ${docker_run_script} ${BASEDIR}/8

# version 7
7: build-7 push-7
build-7:
	bash ${docker_build_script} ${BASEDIR}/7
push-7:
	bash ${docker_push_script} ${BASEDIR}/7
run-7:
	bash ${docker_run_script} ${BASEDIR}/7
