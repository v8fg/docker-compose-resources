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

.PHONY: default all latest 3.23.0 3.24.0 3.29.2

default: latest

all: latest 3.23.0 3.24.0 3.29.2

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

# version 3.23.0
3.23.0: build-3.23.0 push-3.23.0
build-3.23.0:
	bash ${docker_build_script} ${BASEDIR}/3.23.0
push-3.23.0:
	bash ${docker_push_script} ${BASEDIR}/3.23.0
run-3.23.0:
	bash ${docker_run_script} ${BASEDIR}/3.23.0

# version 3.24.0
3.24.0: build-3.24.0 push-3.24.0
build-3.24.0:
	bash ${docker_build_script} ${BASEDIR}/3.24.0
push-3.24.0:
	bash ${docker_push_script} ${BASEDIR}/3.24.0
run-3.24.0:
	bash ${docker_run_script} ${BASEDIR}/3.24.0

# version 3.29.2
3.29.2: build-3.29.2 push-3.29.2
build-3.29.2:
	bash ${docker_build_script} ${BASEDIR}/3.29.2
push-3.29.2:
	bash ${docker_push_script} ${BASEDIR}/3.29.2
run-3.29.2:
	bash ${docker_run_script} ${BASEDIR}/3.29.2
