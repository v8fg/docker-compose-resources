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

.PHONY: default all latest 1.20.0 1.20.0-alpine 1.20.0-alpine-perl 1.20.0-perl 1.19.10 1.19.10-alpine 1.19.10-alpine-perl 1.19.10-perl

default: latest

all: latest 1.20.0 1.20.0-alpine 1.20.0-alpine-perl 1.20.0-perl 1.19.10 1.19.10-alpine 1.19.10-alpine-perl 1.19.10-perl

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

# version 1.20.0
1.20.0: build-1.20.0 push-1.20.0
build-1.20.0:
	bash ${docker_build_script} ${BASEDIR}/1.20.0
push-1.20.0:
	bash ${docker_push_script} ${BASEDIR}/1.20.0
run-1.20.0:
	bash ${docker_run_script} ${BASEDIR}/1.20.0

# version 1.20.0-alpine
1.20.0-alpine: build-1.20.0-alpine push-1.20.0-alpine
build-1.20.0-alpine:
	bash ${docker_build_script} ${BASEDIR}/1.20.0-alpine
push-1.20.0-alpine:
	bash ${docker_push_script} ${BASEDIR}/1.20.0-alpine
run-1.20.0-alpine:
	bash ${docker_run_script} ${BASEDIR}/1.20.0-alpine

# version 1.20.0-alpine-perl
1.20.0-alpine-perl: build-1.20.0-alpine-perl push-1.20.0-alpine-perl
build-1.20.0-alpine-perl:
	bash ${docker_build_script} ${BASEDIR}/1.20.0-alpine-perl
push-1.20.0-alpine-perl:
	bash ${docker_push_script} ${BASEDIR}/1.20.0-alpine-perl
run-1.20.0-alpine-perl:
	bash ${docker_run_script} ${BASEDIR}/1.20.0-alpine-perl

# version 1.20.0-perl
1.20.0-perl: build-1.20.0-perl push-1.20.0-perl
build-1.20.0-perl:
	bash ${docker_build_script} ${BASEDIR}/1.20.0-perl
push-1.20.0-perl:
	bash ${docker_push_script} ${BASEDIR}/1.20.0-perl
run-1.20.0-perl:
	bash ${docker_run_script} ${BASEDIR}/1.20.0-perl

# version 1.19.10
1.19.10: build-1.19.10 push-1.19.10
build-1.19.10:
	bash ${docker_build_script} ${BASEDIR}/1.19.10
push-1.19.10:
	bash ${docker_push_script} ${BASEDIR}/1.19.10
run-1.19.10:
	bash ${docker_run_script} ${BASEDIR}/1.19.10

# version 1.19.10-alpine
1.19.10-alpine: build-1.19.10-alpine push-1.19.10-alpine
build-1.19.10-alpine:
	bash ${docker_build_script} ${BASEDIR}/1.19.10-alpine
push-1.19.10-alpine:
	bash ${docker_push_script} ${BASEDIR}/1.19.10-alpine
run-1.19.10-alpine:
	bash ${docker_run_script} ${BASEDIR}/1.19.10-alpine

# version 1.19.10-alpine-perl
1.19.10-alpine-perl: build-1.19.10-alpine-perl push-1.19.10-alpine-perl
build-1.19.10-alpine-perl:
	bash ${docker_build_script} ${BASEDIR}/1.19.10-alpine-perl
push-1.19.10-alpine-perl:
	bash ${docker_push_script} ${BASEDIR}/1.19.10-alpine-perl
run-1.19.10-alpine-perl:
	bash ${docker_run_script} ${BASEDIR}/1.19.10-alpine-perl

# version 1.19.10-perl
1.19.10-perl: build-1.19.10-perl push-1.19.10-perl
build-1.19.10-perl:
	bash ${docker_build_script} ${BASEDIR}/1.19.10-perl
push-1.19.10-perl:
	bash ${docker_push_script} ${BASEDIR}/1.19.10-perl
run-1.19.10-perl:
	bash ${docker_run_script} ${BASEDIR}/1.19.10-perl
