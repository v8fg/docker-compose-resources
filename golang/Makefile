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

.PHONY: default all latest latest-upx 1.14.4 1.14.4-upx 

default: latest latest-upx

all: latest latest-upx 1.14.4 1.14.4-upx

# latest build and push
latest: build push

# latest build and push with upx
latest-upx: build-upx push-upx

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

# version default with upx
build-upx: build-latest-upx
push-upx: push-latest-upx
run-upx: run-latest-upx

# version latest with upx
build-latest-upx:
	bash ${docker_build_script} ${BASEDIR}/latest-upx
push-latest-upx:
	bash ${docker_push_script} ${BASEDIR}/latest-upx
run-latest-upx:
	bash ${docker_run_script} ${BASEDIR}/latest-upx

# version 1.14.4
1.14.4: build-1.14.4 push-1.14.4
build-1.14.4:
	bash ${docker_build_script} ${BASEDIR}/1.14.4
push-1.14.4:
	bash ${docker_push_script} ${BASEDIR}/1.14.4
run-1.14.4:
	bash ${docker_run_script} ${BASEDIR}/1.14.4

# version 1.14.4 with upx
1.14.4-upx: build-1.14.4-upx push-1.14.4-upx
build-1.14.4-upx:
	bash ${docker_build_script} ${BASEDIR}/1.14.4-upx
push-1.14.4-upx:
	bash ${docker_push_script} ${BASEDIR}/1.14.4-upx
run-1.14.4-upx:
	bash ${docker_run_script} ${BASEDIR}/1.14.4-upx
