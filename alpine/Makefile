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

.PHONY: default all latest 3.14 3.13 3.12

default: latest

all: latest 3.14 3.13 3.12

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

# version 3.14
3.14: build-3.14 push-3.14
build-3.14:
	bash ${docker_build_script} ${BASEDIR}/3.14
push-3.14:
	bash ${docker_push_script} ${BASEDIR}/3.14
run-3.14:
	bash ${docker_run_script} ${BASEDIR}/3.14

# version 3.13
3.13: build-3.13 push-3.13
build-3.13:
	bash ${docker_build_script} ${BASEDIR}/3.13
push-3.13:
	bash ${docker_push_script} ${BASEDIR}/3.13
run-3.13:
	bash ${docker_run_script} ${BASEDIR}/3.13

# version 3.12
3.12: build-3.12 push-3.12
build-3.12:
	bash ${docker_build_script} ${BASEDIR}/3.12
push-3.12:
	bash ${docker_push_script} ${BASEDIR}/3.12
run-3.12:
	bash ${docker_run_script} ${BASEDIR}/3.12
