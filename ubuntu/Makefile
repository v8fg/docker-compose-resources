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

.PHONY: default all latest 16.04 16.04-go1.16 16.04-go1.16-tf-cpu 16.04-go1.16-upx 16.04-tf-cpu

default: latest

all: latest 16.04 16.04-go1.16 16.04-go1.16-tf-cpu 16.04-go1.16-upx 16.04-tf-cpu

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

# version 16.04
16.04: build-16.04 push-16.04
build-16.04:
	bash ${docker_build_script} ${BASEDIR}/16.04
push-16.04:
	bash ${docker_push_script} ${BASEDIR}/16.04
run-16.04:
	bash ${docker_run_script} ${BASEDIR}/16.04

# version 16.04-go1.16
16.04-go1.16: build-16.04-go1.16 push-16.04-go1.16
build-16.04-go1.16:
	bash ${docker_build_script} ${BASEDIR}/16.04-go1.16
push-16.04-go1.16:
	bash ${docker_push_script} ${BASEDIR}/16.04-go1.16
run-16.04-go1.16:
	bash ${docker_run_script} ${BASEDIR}/16.04-go1.16


# version 16.04-go1.16-tf-cpu
16.04-go1.16-tf-cpu: build-16.04-go1.16-tf-cpu push-16.04-go1.16-tf-cpu
build-16.04-go1.16-tf-cpu:
	bash ${docker_build_script} ${BASEDIR}/16.04-go1.16-tf-cpu
push-16.04-go1.16-tf-cpu:
	bash ${docker_push_script} ${BASEDIR}/16.04-go1.16-tf-cpu
run-16.04-go1.16-tf-cpu:
	bash ${docker_run_script} ${BASEDIR}/16.04-go1.16-tf-cpu

# version 16.04-go1.16-upx
16.04-go1.16-upx: build-16.04-go1.16-upx push-16.04-go1.16-upx
build-16.04-go1.16-upx:
	bash ${docker_build_script} ${BASEDIR}/16.04-go1.16-upx
push-16.04-go1.16-upx:
	bash ${docker_push_script} ${BASEDIR}/16.04-go1.16-upx
run-16.04-go1.16-upx:
	bash ${docker_run_script} ${BASEDIR}/16.04-go1.16-upx

# version 16.04-tf-cpu
16.04-tf-cpu: build-16.04-tf-cpu push-16.04-tf-cpu
build-16.04-tf-cpu:
	bash ${docker_build_script} ${BASEDIR}/16.04-tf-cpu
push-16.04-tf-cpu:
	bash ${docker_push_script} ${BASEDIR}/16.04-tf-cpu
run-16.04-tf-cpu:
	bash ${docker_run_script} ${BASEDIR}/16.04-tf-cpu
