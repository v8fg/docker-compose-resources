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

.PHONY: default all gitlab-ce-latest gitlab-ce-nightly gitlab-ce-14.1.2 \
	gitlab-runner-alpine-bleedding gitlab-runner-latest \
	gitlab-sameersbn-14.1.1 gitlab-sameersbn-latest

default: gitlab-ce-latest gitlab-runner-latest gitlab-sameersbn-latest

all: gitlab-ce-latest gitlab-ce-nightly gitlab-ce-14.1.2 \
	gitlab-runner-alpine-bleedding gitlab-runner-latest \
	gitlab-sameersbn-14.1.1 gitlab-sameersbn-latest

# latest build and push gitlab-ce
gitlab-ce-latest: build-gitlab-ce push-gitlab-ce

# version default gitlab-ce
build-gitlab-ce: build-gitlab-ce-latest
push-gitlab-ce: push-gitlab-ce-latest
run-gitlab-ce: run-gitlab-ce-latest

# version latest gitlab-ce
build-gitlab-ce-latest:
	bash ${docker_build_script} ${BASEDIR}/gitlab-ce/latest
push-gitlab-ce-latest:
	bash ${docker_push_script} ${BASEDIR}/gitlab-ce/latest
run-gitlab-ce-latest:
	bash ${docker_run_script} ${BASEDIR}/gitlab-ce/latest


gitlab-ce-nightly: build-gitlab-ce-nightly push-gitlab-ce-nightly
# version nightly gitlab-ce
build-gitlab-ce-nightly:
	bash ${docker_build_script} ${BASEDIR}/gitlab-ce/nightly
push-gitlab-ce-nightly:
	bash ${docker_push_script} ${BASEDIR}/gitlab-ce/nightly
run-gitlab-ce-nightly:
	bash ${docker_run_script} ${BASEDIR}/gitlab-ce/nightly

gitlab-ce-14.1.2: build-gitlab-ce-14.1.2 push-gitlab-ce-14.1.2
# version latest gitlab-ce-14.1.2
build-gitlab-ce-14.1.2:
	bash ${docker_build_script} ${BASEDIR}/gitlab-ce/14.1.2
push-gitlab-ce-14.1.2:
	bash ${docker_push_script} ${BASEDIR}/gitlab-ce/14.1.2
run-gitlab-ce-14.1.2:
	bash ${docker_run_script} ${BASEDIR}/gitlab-ce/14.1.2

# latest build and push gitlab-runner
gitlab-runner-latest: build-gitlab-runner push-gitlab-runner

# version default gitlab-runner
build-gitlab-runner: build-gitlab-runner-latest
push-gitlab-runner: push-gitlab-runner-latest
run-gitlab-runner: run-gitlab-runner-latest

# version latest gitlab-runner
build-gitlab-runner-latest:
	bash ${docker_build_script} ${BASEDIR}/gitlab-runner/latest
push-gitlab-runner-latest:
	bash ${docker_push_script} ${BASEDIR}/gitlab-runner/latest
run-gitlab-runner-latest:
	bash ${docker_run_script} ${BASEDIR}/gitlab-runner/latest

gitlab-runner-alpine-bleeding: build-gitlab-runner-alpine-bleeding push-gitlab-runner-alpine-bleeding
# version alpine-bleeding gitlab-runner
build-gitlab-runner-alpine-bleeding:
	bash ${docker_build_script} ${BASEDIR}/gitlab-runner/alpine-bleeding
push-gitlab-runner-alpine-bleeding:
	bash ${docker_push_script} ${BASEDIR}/gitlab-runner/alpine-bleeding
run-gitlab-runner-alpine-bleeding:
	bash ${docker_run_script} ${BASEDIR}/gitlab-runner/alpine-bleeding


# latest build and push sameersbn gitlab
gitlab-sameersbn-latest: build-gitlab-sameersbn push-gitlab-sameersbn

# version default gitlab sameersbn
build-gitlab-sameersbn: build-gitlab-sameersbn-latest
push-gitlab-sameersbn: push-gitlab-sameersbn-latest
run-gitlab-sameersbn: run-gitlab-sameersbn-latest

# version latest gitlab-sameersbn
build-gitlab-sameersbn-latest:
	bash ${docker_build_script} ${BASEDIR}/gitlab-sameersbn/latest
push-gitlab-sameersbn-latest:
	bash ${docker_push_script} ${BASEDIR}/gitlab-sameersbn/latest
run-gitlab-sameersbn-latest:
	bash ${docker_run_script} ${BASEDIR}/gitlab-sameersbn/latest

gitlab-sameersbn-14.1.1: build-gitlab-sameersbn-14.1.1 push-gitlab-sameersbn-14.1.1
# version 14.1.1 gitlab-sameersbn
build-gitlab-sameersbn-14.1.1:
	bash ${docker_build_script} ${BASEDIR}/gitlab-sameersbn/14.1.1
push-gitlab-sameersbn-14.1.1:
	bash ${docker_push_script} ${BASEDIR}/gitlab-sameersbn/14.1.1
run-gitlab-sameersbn-14.1.1:
	bash ${docker_run_script} ${BASEDIR}/gitlab-sameersbn/14.1.1
