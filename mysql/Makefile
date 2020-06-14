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

.PHONY: default all latest 5.7.30 8.0.20

default: latest

all: latest 5.7.30 8.0.20

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

# version 5.7.30
5.7.30: build-5.7.30 push-5.7.30
build-5.7.30:
	bash ${docker_build_script} ${BASEDIR}/5.7.30
push-5.7.30:
	bash ${docker_push_script} ${BASEDIR}/5.7.30
run-5.7.30:
	bash ${docker_run_script} ${BASEDIR}/5.7.30

# version 8.0.20
8.0.20: build-8.0.20 push-8.0.20
build-8.0.20:
	bash ${docker_build_script} ${BASEDIR}/8.0.20
push-8.0.20:
	bash ${docker_push_script} ${BASEDIR}/8.0.20
run-8.0.20:
	bash ${docker_run_script} ${BASEDIR}/8.0.20
