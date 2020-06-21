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

.PHONY: default all latest latest 7.0.3 7.0.3-ubuntu 6.7.4 6.7.4-ubuntu

default: latest 7.0.3 6.7.4

all: latest 7.0.3 7.0.3-ubuntu 6.7.4 6.7.4-ubuntu

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

# version 7.0.3
7.0.3: build-7.0.3 push-7.0.3
build-7.0.3:
	bash ${docker_build_script} ${BASEDIR}/7.0.3
push-7.0.3:
	bash ${docker_push_script} ${BASEDIR}/7.0.3
run-7.0.3:
	bash ${docker_run_script} ${BASEDIR}/7.0.3

# version 7.0.3-ubuntu
7.0.3-ubuntu: build-7.0.3-ubuntu push-7.0.3-ubuntu
build-7.0.3-ubuntu:
	bash ${docker_build_script} ${BASEDIR}/7.0.3-ubuntu
push-7.0.3-ubuntu:
	bash ${docker_push_script} ${BASEDIR}/7.0.3-ubuntu
run-7.0.3-ubuntu:
	bash ${docker_run_script} ${BASEDIR}/7.0.3-ubuntu

# version 6.7.4
6.7.4: build-6.7.4 push-6.7.4
build-6.7.4:
	bash ${docker_build_script} ${BASEDIR}/6.7.4
push-6.7.4:
	bash ${docker_push_script} ${BASEDIR}/6.7.4
run-6.7.4:
	bash ${docker_run_script} ${BASEDIR}/6.7.4

# version 6.7.4-ubuntu
6.7.4-ubuntu: build-6.7.4-ubuntu push-6.7.4-ubuntu
build-6.7.4-ubuntu:
	bash ${docker_build_script} ${BASEDIR}/6.7.4-ubuntu
push-6.7.4-ubuntu:
	bash ${docker_push_script} ${BASEDIR}/6.7.4-ubuntu
run-6.7.4-ubuntu:
	bash ${docker_run_script} ${BASEDIR}/6.7.4-ubuntu
