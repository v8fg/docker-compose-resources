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

.PHONY: default all latest 2.243-alpine 2.243-centos7 2.291-alpine 2.291-centos7

default: latest

all: latest 2.243-alpine 2.243-centos7 2.291-alpine 2.291-centos7

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

# version 2.291-alpine
2.291-alpine: build-2.291-alpine push-2.291-alpine
build-2.291-alpine:
	bash ${docker_build_script} ${BASEDIR}/2.291-alpine
push-2.291-alpine:
	bash ${docker_push_script} ${BASEDIR}/2.291-alpine
run-2.291-alpine:
	bash ${docker_run_script} ${BASEDIR}/2.291-alpine

# version 2.291-centos7
2.291-centos7: build-2.291-centos7 push-2.291-centos7
build-2.291-centos7:
	bash ${docker_build_script} ${BASEDIR}/2.291-centos7
push-2.291-centos7:
	bash ${docker_push_script} ${BASEDIR}/2.291-centos7
run-2.291-centos7:
	bash ${docker_run_script} ${BASEDIR}/2.291-centos7

# version 2.243-alpine
2.243-alpine: build-2.243-alpine push-2.243-alpine
build-2.243-alpine:
	bash ${docker_build_script} ${BASEDIR}/2.243-alpine
push-2.243-alpine:
	bash ${docker_push_script} ${BASEDIR}/2.243-alpine
run-2.243-alpine:
	bash ${docker_run_script} ${BASEDIR}/2.243-alpine

# version 2.243-centos7
2.243-centos7: build-2.243-centos7 push-2.243-centos7
build-2.243-centos7:
	bash ${docker_build_script} ${BASEDIR}/2.243-centos7
push-2.243-centos7:
	bash ${docker_push_script} ${BASEDIR}/2.243-centos7
run-2.243-centos7:
	bash ${docker_run_script} ${BASEDIR}/2.243-centos7
