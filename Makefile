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

.PHONY: default all aerospike alpine busybox centos elasticsearch fluentd gcc gitlab gitlab-ce gitlab-runner gitlab-sameersbn \
	golang golang-upx influxdb jenkins julia kafka kibana logstash mitmproxy mysql nexus3 nginx node openjdk \
	postgres python redis ruby rust flink ubuntu

all: aerospike alpine busybox centos elasticsearch fluentd gcc gitlab gitlab-ce gitlab-runner gitlab-sameersbn \
	golang golang-upx influxdb jenkins julia kafka kibana logstash mitmproxy mysql nexus3 nginx node openjdk \
	postgres redis ruby rust flink ubuntu

default: clean

clean:
	bash ${docker_clean_script}

clean-force:
	bash ${docker_clean_script} force

aerospike: aerospike-build aerospike-push
aerospike-build:
	bash ${docker_build_script} ${BASEDIR}/aerospike/latest
aerospike-push:
	bash ${docker_push_script} ${BASEDIR}/aerospike/latest

alpine: alpine-build alpine-push
alpine-build:
	bash ${docker_build_script} ${BASEDIR}/alpine/latest
alpine-push:
	bash ${docker_push_script} ${BASEDIR}/alpine/latest

busybox: busybox-build busybox-push
busybox-build:
	bash ${docker_build_script} ${BASEDIR}/busybox/latest
busybox-push:
	bash ${docker_push_script} ${BASEDIR}/busybox/latest

centos: centos-build centos-push
centos-build:
	bash ${docker_build_script} ${BASEDIR}/centos/latest
centos-push:
	bash ${docker_push_script} ${BASEDIR}/centos/latest

elasticsearch: elasticsearch-build elasticsearch-push
elasticsearch-build:
	bash ${docker_build_script} ${BASEDIR}/elasticsearch/latest
elasticsearch-push:
	bash ${docker_push_script} ${BASEDIR}/elasticsearch/latest

flink: flink-build flink-push
flink-build:
	bash ${docker_build_script} ${BASEDIR}/flink/latest
flink-push:
	bash ${docker_push_script} ${BASEDIR}/flink/latest

fluentd: fluentd-build fluentd-push
fluentd-build:
	bash ${docker_build_script} ${BASEDIR}/fluentd/latest
fluentd-push:
	bash ${docker_push_script} ${BASEDIR}/fluentd/latest

gcc: gcc-build gcc-push
gcc-build:
	bash ${docker_build_script} ${BASEDIR}/gcc/latest
gcc-push:
	bash ${docker_push_script} ${BASEDIR}/gcc/latest

gitlab: gitlab-ce gitlab-runner gitlab-sameersbn

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

golang: golang-build golang-push
golang-build:
	bash ${docker_build_script} ${BASEDIR}/golang/latest
golang-push:
	bash ${docker_push_script} ${BASEDIR}/golang/latest

golang-upx: golang-build-upx golang-push-upx
golang-build-upx:
	bash ${docker_build_script} ${BASEDIR}/golang/latest-upx
golang-push-upx:
	bash ${docker_push_script} ${BASEDIR}/golang/latest-upx

grafana: grafana-build grafana-push
grafana-build:
	bash ${docker_build_script} ${BASEDIR}/grafana/latest
grafana-push:
	bash ${docker_push_script} ${BASEDIR}/grafana/latest

influxdb: influxdb-build influxdb-push
influxdb-build:
	bash ${docker_build_script} ${BASEDIR}/influxdb/latest
influxdb-push:
	bash ${docker_push_script} ${BASEDIR}/influxdb/latest

jenkins: jenkins-build jenkins-push
jenkins-build:
	bash ${docker_build_script} ${BASEDIR}/jenkins/latest
jenkins-push:
	bash ${docker_push_script} ${BASEDIR}/jenkins/latest

julia: julia-build julia-push
julia-build:
	bash ${docker_build_script} ${BASEDIR}/julia/latest
julia-push:
	bash ${docker_push_script} ${BASEDIR}/julia/latest

kafka: kafka-build kafka-push
kafka-build:
	bash ${docker_build_script} ${BASEDIR}/kafka/latest
kafka-push:
	bash ${docker_push_script} ${BASEDIR}/kafka/latest

kibana: kibana-build kibana-push
kibana-build:
	bash ${docker_build_script} ${BASEDIR}/kibana/latest
kibana-push:
	bash ${docker_push_script} ${BASEDIR}/kibana/latest

logstash: logstash-build logstash-push
logstash-build:
	bash ${docker_build_script} ${BASEDIR}/logstash/latest
logstash-push:
	bash ${docker_push_script} ${BASEDIR}/logstash/latest

mitmproxy: mitmproxy-build mitmproxy-push
mitmproxy-build:
	bash ${docker_build_script} ${BASEDIR}/mitmproxy/latest
mitmproxy-push:
	bash ${docker_push_script} ${BASEDIR}/mitmproxy/latest

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

python: python-build python-push
python-build:
	bash ${docker_build_script} ${BASEDIR}/python/latest
python-push:
	bash ${docker_push_script} ${BASEDIR}/python/latest

redis: redis-build redis-push
redis-build:
	bash ${docker_build_script} ${BASEDIR}/redis/latest
redis-push:
	bash ${docker_push_script} ${BASEDIR}/redis/latest

ruby: ruby-build ruby-push
ruby-build:
	bash ${docker_build_script} ${BASEDIR}/ruby/latest
ruby-push:
	bash ${docker_push_script} ${BASEDIR}/ruby/latest

rust: rust-build rust-push
rust-build:
	bash ${docker_build_script} ${BASEDIR}/rust/latest
rust-push:
	bash ${docker_push_script} ${BASEDIR}/rust/latest

ubuntu: ubuntu-build ubuntu-push
ubuntu-build:
	bash ${docker_build_script} ${BASEDIR}/ubuntu/latest
ubuntu-push:
	bash ${docker_push_script} ${BASEDIR}/ubuntu/latest
