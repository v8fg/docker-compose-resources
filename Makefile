SHELL := /bin/sh

existBash = $(shell cat /etc/shells|grep -w /bin/bash|grep -v grep)
ifneq (, $(strip ${existBash}))
	SHELL = /bin/bash
endif

$(info shell will use ${SHELL})

BASEDIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

docker_build_script=${BASEDIR}/scripts/docker-build.sh
docker_push_script=${BASEDIR}/scripts/docker-push.sh

.PHONY: default all golang golang-upx kafka mysql nginx node

default: golang kafka mysql nginx node

all: golang golang-upx kafka mysql nginx node 

# golang build and push, default(latest)
golang: golang-build golang-push
# golang build and push with upx, default(latest)
golang-upx: golang-build-upx golang-push-upx

# golang build and push, latest
golang-build:
	bash ${docker_build_script} ${BASEDIR}/golang/latest
golang-push:
	bash ${docker_push_script} ${BASEDIR}/golang/latest
# golang build and push with upx, latest
golang-build-upx:
	bash ${docker_build_script} ${BASEDIR}/golang/latest-upx
golang-push-upx:
	bash ${docker_push_script} ${BASEDIR}/golang/latest-upx

kafka: kafka-build kafka-push
kafka-build:
	bash ${docker_build_script} ${BASEDIR}/kafka/latest
kafka-push:
	bash ${docker_push_script} ${BASEDIR}/kafka/latest

mysql: mysql-build mysql-push
mysql-build:
	bash ${docker_build_script} ${BASEDIR}/mysql/latest
mysql-push:
	bash ${docker_push_script} ${BASEDIR}/mysql/latest

nginx: nginx-build nginx-push
nginx-build:
	bash ${docker_build_script} ${BASEDIR}/nginx/latest
nginx-push:
	bash ${docker_push_script} ${BASEDIR}/nginx/latest

node: node-build node-push
node-build:
	bash ${docker_build_script} ${BASEDIR}/node/latest
node-push:
	bash ${docker_push_script} ${BASEDIR}/node/latest
