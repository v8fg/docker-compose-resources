SHELL := /bin/sh

existBash = $(shell cat /etc/shells|grep -w /bin/bash|grep -v grep)
ifneq (, $(strip ${existBash}))
	SHELL = /bin/bash
endif

$(info shell will use ${SHELL})

BASEDIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

docker_build_script=${BASEDIR}/scripts/docker-build.sh
docker_push_script=${BASEDIR}/scripts/docker-push.sh
docker_clean_script=${BASEDIR}/scripts/docker-clean.sh

.PHONY: default all alpine gitlab-ce gitlab-runner gitlab-sameersbn golang golang-upx kafka mysql nexus3 \
	nginx node openjdk postgres redis

.PHONY: default all alpine gitlab-ce gitlab-runner gitlab-sameersbn golang golang-upx kafka mysql nexus3 \
	nginx node openjdk postgres redis
	
default: clean alpine gitlab-ce gitlab-runner gitlab-sameersbn golang kafka mysql nexus3 nginx node openjdk postgres redis

all: clean alpine golang golang-upx gitlab-ce gitlab-runner gitlab-sameersbn kafka mysql nexus3 nginx node openjdk postgres redis

clean:
	bash ${docker_clean_script}

clean-force:
	bash ${docker_clean_script} force

alpine: alpine-build alpine-push
alpine-build:
	bash ${docker_build_script} ${BASEDIR}/alpine/latest
alpine-push:
	bash ${docker_push_script} ${BASEDIR}/alpine/latest

gitlab-ce: gitlab-ce-build gitlab-ce-push
gitlab-ce-build:
	bash ${docker_build_script} ${BASEDIR}/gitlab/gitlab-ce/latest
gitlab-ce-push:
	bash ${docker_push_script} ${BASEDIR}/gitlab/gitlab-ce/latest

gitlab-runner: gitlab-runner-build gitlab-runner-push
gitlab-runner-build:
	bash ${docker_build_script} ${BASEDIR}/gitlab/gitlab-runner/latest
gitlab-runner-push:
	bash ${docker_push_script} ${BASEDIR}/gitlab/gitlab-runner/latest

gitlab-sameersbn: gitlab-sameersbn-build gitlab-sameersbn-push
gitlab-sameersbn-build:
	bash ${docker_build_script} ${BASEDIR}/gitlab/gitlab-sameersbn/latest
gitlab-sameersbn-push:
	bash ${docker_push_script} ${BASEDIR}/gitlab/gitlab-sameersbn/latest

# golang build and push, default(latest)
golang: golang-build golang-push
# golang build and push, latest
golang-build:
	bash ${docker_build_script} ${BASEDIR}/golang/latest
golang-push:
	bash ${docker_push_script} ${BASEDIR}/golang/latest

# golang build and push with upx, default(latest)
golang-upx: golang-build-upx golang-push-upx
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

nexus3: nexus3-build nexus3-push
nexus3-build:
	bash ${docker_build_script} ${BASEDIR}/nexus3/latest
nexus3-push:
	bash ${docker_push_script} ${BASEDIR}/nexus3/latest

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

openjdk: openjdk-build openjdk-push
openjdk-build:
	bash ${docker_build_script} ${BASEDIR}/openjdk/latest
openjdk-push:
	bash ${docker_push_script} ${BASEDIR}/openjdk/latest

postgres: postgres-build postgres-push
postgres-build:
	bash ${docker_build_script} ${BASEDIR}/postgres/latest
postgres-push:
	bash ${docker_push_script} ${BASEDIR}/postgres/latest

redis: redis-build redis-push
redis-build:
	bash ${docker_build_script} ${BASEDIR}/redis/latest
redis-push:
	bash ${docker_push_script} ${BASEDIR}/redis/latest
