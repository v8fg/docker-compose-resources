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

.PHONY: default all latest 8u212-jdk-alpine3.9 8u212-jre-alpine3.9 8u252-jdk 8u252-jdk-slim-buster \
	8u252-jre 8u252-jre-slim-buster 15-jdk-alpine3.11 15-jdk-buster 15-jdk-oracle 15-jdk-slim-buster

default: latest

all: latest 8u212-jdk-alpine3.9 8u212-jre-alpine3.9 8u252-jdk 8u252-jdk-slim-buster \
	8u252-jre 8u252-jre-slim-buster 15-jdk-alpine3.11 15-jdk-buster 15-jdk-oracle 15-jdk-slim-buster

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

# version 8u212-jdk-alpine3.9
8u212-jdk-alpine3.9: build-8u212-jdk-alpine3.9 push-8u212-jdk-alpine3.9
build-8u212-jdk-alpine3.9:
	bash ${docker_build_script} ${BASEDIR}/8u212-jdk-alpine3.9
push-8u212-jdk-alpine3.9:
	bash ${docker_push_script} ${BASEDIR}/8u212-jdk-alpine3.9
run-8u212-jdk-alpine3.9:
	bash ${docker_run_script} ${BASEDIR}/8u212-jdk-alpine3.9

# version 8u212-jre-alpine3.9
8u212-jre-alpine3.9: build-8u212-jre-alpine3.9 push-8u212-jre-alpine3.9
build-8u212-jre-alpine3.9:
	bash ${docker_build_script} ${BASEDIR}/8u212-jre-alpine3.9
push-8u212-jre-alpine3.9:
	bash ${docker_push_script} ${BASEDIR}/8u212-jre-alpine3.9
run-8u212-jre-alpine3.9:
	bash ${docker_run_script} ${BASEDIR}/8u212-jre-alpine3.9

# version 8u252-jdk
8u252-jdk: build-8u252-jdk push-8u252-jdk
build-8u252-jdk:
	bash ${docker_build_script} ${BASEDIR}/8u252-jdk
push-8u252-jdk:
	bash ${docker_push_script} ${BASEDIR}/8u252-jdk
run-8u252-jdk:
	bash ${docker_run_script} ${BASEDIR}/8u252-jdk

# version 8u252-jdk-slim-buster
8u252-jdk-slim-buster: build-8u252-jdk-slim-buster push-8u252-jdk-slim-buster
build-8u252-jdk-slim-buster:
	bash ${docker_build_script} ${BASEDIR}/8u252-jdk-slim-buster
push-8u252-jdk-slim-buster:
	bash ${docker_push_script} ${BASEDIR}/8u252-jdk-slim-buster
run-8u252-jdk-slim-buster:
	bash ${docker_run_script} ${BASEDIR}/8u252-jdk-slim-buster

# version 8u252-jre
8u252-jre: build-8u252-jre push-8u252-jre
build-8u252-jre:
	bash ${docker_build_script} ${BASEDIR}/8u252-jre
push-8u252-jre:
	bash ${docker_push_script} ${BASEDIR}/8u252-jre
run-8u252-jre:
	bash ${docker_run_script} ${BASEDIR}/8u252-jre

# version 8u252-jre-slim-buster
8u252-jre-slim-buster: build-8u252-jre-slim-buster push-8u252-jre-slim-buster
build-8u252-jre-slim-buster:
	bash ${docker_build_script} ${BASEDIR}/8u252-jre-slim-buster
push-8u252-jre-slim-buster:
	bash ${docker_push_script} ${BASEDIR}/8u252-jre-slim-buster
run-8u252-jre-slim-buster:
	bash ${docker_run_script} ${BASEDIR}/8u252-jre-slim-buster

# version 15-jdk-alpine3.11
15-jdk-alpine3.11: build-15-jdk-alpine3.11 push-15-jdk-alpine3.11
build-15-jdk-alpine3.11:
	bash ${docker_build_script} ${BASEDIR}/15-jdk-alpine3.11
push-15-jdk-alpine3.11:
	bash ${docker_push_script} ${BASEDIR}/15-jdk-alpine3.11
run-15-jdk-alpine3.11:
	bash ${docker_run_script} ${BASEDIR}/15-jdk-alpine3.11

# version 15-jdk-buster
15-jdk-buster: build-15-jdk-buster push-15-jdk-buster
build-15-jdk-buster:
	bash ${docker_build_script} ${BASEDIR}/15-jdk-buster
push-15-jdk-buster:
	bash ${docker_push_script} ${BASEDIR}/15-jdk-buster
run-15-jdk-buster:
	bash ${docker_run_script} ${BASEDIR}/15-jdk-buster

# version 15-jdk-oracle
15-jdk-oracle: build-15-jdk-oracle push-15-jdk-oracle
build-15-jdk-oracle:
	bash ${docker_build_script} ${BASEDIR}/15-jdk-oracle
push-15-jdk-oracle:
	bash ${docker_push_script} ${BASEDIR}/15-jdk-oracle
run-15-jdk-oracle:
	bash ${docker_run_script} ${BASEDIR}/15-jdk-oracle

# version 15-jdk-slim-buster
15-jdk-slim-buster: build-15-jdk-slim-buster push-15-jdk-slim-buster
build-15-jdk-slim-buster:
	bash ${docker_build_script} ${BASEDIR}/15-jdk-slim-buster
push-15-jdk-slim-buster:
	bash ${docker_push_script} ${BASEDIR}/15-jdk-slim-buster
run-15-jdk-slim-buster:
	bash ${docker_run_script} ${BASEDIR}/15-jdk-slim-buster
