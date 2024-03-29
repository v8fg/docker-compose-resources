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

.PHONY: default all aerospike alpine bash busybox centos elasticsearch erlang etcd filebrowser flink fluentd gcc gitlab gitlab-ce gitlab-runner gitlab-sameersbn \
	golang golang-upx influxdb jenkins julia kafka kibana logstash mitmproxy mysql nats nexus3 nginx node openjdk php \
	postgres pulsar pyroscope python redis registry ruby rust sonarqube swift ubuntu zookeeper

all: aerospike alpine bash busybox centos elasticsearch erlang etcd filebrowser flink fluentd gcc gitlab gitlab-ce gitlab-runner gitlab-sameersbn \
	golang golang-upx influxdb jenkins julia kafka kibana logstash mitmproxy mysql nats nexus3 nginx node openjdk php \
	postgres pulsar pyroscope python redis registry ruby rust sonarqube swift ubuntu zookeeper

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

bash: bash-build bash-push
bash-build:
	bash ${docker_build_script} ${BASEDIR}/bash/latest
bash-push:
	bash ${docker_push_script} ${BASEDIR}/bash/latest

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

erlang: erlang-build erlang-push
erlang-build:
	bash ${docker_build_script} ${BASEDIR}/erlang/latest
erlang-push:
	bash ${docker_push_script} ${BASEDIR}/erlang/latest

etcd: etcd-build etcd-push
etcd-build:
	bash ${docker_build_script} ${BASEDIR}/etcd/latest
etcd-push:
	bash ${docker_push_script} ${BASEDIR}/etcd/latest

filebrowser: filebrowser-build filebrowser-push
filebrowser-build:
	bash ${docker_build_script} ${BASEDIR}/filebrowser/latest
filebrowser-push:
	bash ${docker_push_script} ${BASEDIR}/filebrowser/latest

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

nats: nats-build nats-push
nats-build:
	bash ${docker_build_script} ${BASEDIR}/nats/latest
nats-push:
	bash ${docker_push_script} ${BASEDIR}/nats/latest

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

php: php-build php-push
php-build:
	bash ${docker_build_script} ${BASEDIR}/php/latest
php-push:
	bash ${docker_push_script} ${BASEDIR}/php/latest

postgres: postgres-build postgres-push
postgres-build:
	bash ${docker_build_script} ${BASEDIR}/postgres/latest
postgres-push:
	bash ${docker_push_script} ${BASEDIR}/postgres/latest

pulsar: pulsar-build pulsar-push
pulsar-build:
	bash ${docker_build_script} ${BASEDIR}/pulsar/latest
pulsar-push:
	bash ${docker_push_script} ${BASEDIR}/pulsar/latest

pyroscope: pyroscope-build pyroscope-push
pyroscope-build:
	bash ${docker_build_script} ${BASEDIR}/pyroscope/latest
pyroscope-push:
	bash ${docker_push_script} ${BASEDIR}/pyroscope/latest

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

registry: registry-build registry-push
registry-build:
	bash ${docker_build_script} ${BASEDIR}/registry/latest
registry-push:
	bash ${docker_push_script} ${BASEDIR}/registry/latest

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

sonarqube: sonarqube-build sonarqube-push
sonarqube-build:
	bash ${docker_build_script} ${BASEDIR}/sonarqube/latest
sonarqube-push:
	bash ${docker_push_script} ${BASEDIR}/sonarqube/latest

swift: swift-build swift-push
swift-build:
	bash ${docker_build_script} ${BASEDIR}/swift/latest
swift-push:
	bash ${docker_push_script} ${BASEDIR}/swift/latest

ubuntu: ubuntu-build ubuntu-push
ubuntu-build:
	bash ${docker_build_script} ${BASEDIR}/ubuntu/latest
ubuntu-push:
	bash ${docker_push_script} ${BASEDIR}/ubuntu/latest

zookeeper: zookeeper-build zookeeper-push
zookeeper-build:
	bash ${docker_build_script} ${BASEDIR}/zookeeper/latest
zookeeper-push:
	bash ${docker_push_script} ${BASEDIR}/zookeeper/latest
