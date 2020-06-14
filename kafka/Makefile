SHELL := /bin/sh

existBash = $(shell cat /etc/shells|grep -w /bin/bash|grep -v grep)
ifneq (, $(strip ${existBash}))
	SHELL = /bin/bash
endif

$(info shell will use ${SHELL})

BASEDIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

docker_build_script=${BASEDIR}/../scripts/docker-build.sh
docker_push_script=${BASEDIR}/../scripts/docker-push.sh
docker_run_script=${BASEDIR}/docker-run.sh

.PHONY: default all latest 2.12-2.5.0

default: latest

all: latest 2.12-2.5.0

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

# version 2.12-2.5.0
2.12-2.5.0: build-2.12-2.5.0 push-2.12-2.5.0
build-2.12-2.5.0:
	bash ${docker_build_script} ${BASEDIR}/2.12-2.5.0
push-2.12-2.5.0:
	bash ${docker_push_script} ${BASEDIR}/2.12-2.5.0
run-2.12-2.5.0:
	bash ${docker_run_script} ${BASEDIR}/2.12-2.5.0
