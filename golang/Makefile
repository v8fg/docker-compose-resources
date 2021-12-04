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

.PHONY: default all latest latest-upx 1.17 1.17-upx 1.17.3 1.17.3-upx 1.16.7 1.16.7-upx 1.16.5 1.16.5-upx 1.16.4 1.16.4-upx 1.16.4-librdkafka 1.16 1.16-upx \
	1.15.5 1.15.5-upx 1.15.6-librdkafka 1.14.12 1.14.12-upx 1.14.4 1.14.4-upx
	

default: latest latest-upx

all: latest latest-upx 1.17 1.17-upx 1.17.3 1.17.3-upx 1.16.7 1.16.7-upx 1.16.5 1.16.5-upx 1.16.4 1.16.4-upx 1.16.4-librdkafka 1.16 1.16-upx 1.15.5 1.15.5-upx 1.15.6-librdkafka 1.14.12 1.14.12-upx 1.14.4 1.14.4-upx

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

# version 1.17
1.17: build-1.17 push-1.17
build-1.17:
	bash ${docker_build_script} ${BASEDIR}/1.17
push-1.17:
	bash ${docker_push_script} ${BASEDIR}/1.17
run-1.17:
	bash ${docker_run_script} ${BASEDIR}/1.17

# version 1.17 with upx
1.17-upx: build-1.17-upx push-1.17-upx
build-1.17-upx:
	bash ${docker_build_script} ${BASEDIR}/1.17-upx
push-1.17-upx:
	bash ${docker_push_script} ${BASEDIR}/1.17-upx
run-1.17-upx:
	bash ${docker_run_script} ${BASEDIR}/1.17-upx

# version 1.17.3
1.17.3: build-1.17.3 push-1.17.3
build-1.17.3:
	bash ${docker_build_script} ${BASEDIR}/1.17.3
push-1.17.3:
	bash ${docker_push_script} ${BASEDIR}/1.17.3
run-1.17.3:
	bash ${docker_run_script} ${BASEDIR}/1.17.3

# version 1.17.3 with upx
1.17.3-upx: build-1.17.3-upx push-1.17.3-upx
build-1.17.3-upx:
	bash ${docker_build_script} ${BASEDIR}/1.17.3-upx
push-1.17.3-upx:
	bash ${docker_push_script} ${BASEDIR}/1.17.3-upx
run-1.17.3-upx:
	bash ${docker_run_script} ${BASEDIR}/1.17.3-upx

# version 1.16
1.16: build-1.16 push-1.16
build-1.16:
	bash ${docker_build_script} ${BASEDIR}/1.16
push-1.16:
	bash ${docker_push_script} ${BASEDIR}/1.16
run-1.16:
	bash ${docker_run_script} ${BASEDIR}/1.16

# version 1.16 with upx
1.16-upx: build-1.16-upx push-1.16-upx
build-1.16-upx:
	bash ${docker_build_script} ${BASEDIR}/1.16-upx
push-1.16-upx:
	bash ${docker_push_script} ${BASEDIR}/1.16-upx
run-1.16-upx:
	bash ${docker_run_script} ${BASEDIR}/1.16-upx

# version 1.16.7
1.16.7: build-1.16.7 push-1.16.7
build-1.16.7:
	bash ${docker_build_script} ${BASEDIR}/1.16.7
push-1.16.7:
	bash ${docker_push_script} ${BASEDIR}/1.16.7
run-1.16.7:
	bash ${docker_run_script} ${BASEDIR}/1.16.7

# version 1.16.7 with upx
1.16.7-upx: build-1.16.7-upx push-1.16.7-upx
build-1.16.7-upx:
	bash ${docker_build_script} ${BASEDIR}/1.16.7-upx
push-1.16.7-upx:
	bash ${docker_push_script} ${BASEDIR}/1.16.7-upx
run-1.16.7-upx:
	bash ${docker_run_script} ${BASEDIR}/1.16.7-upx

# version 1.16.5
1.16.5: build-1.16.5 push-1.16.5
build-1.16.5:
	bash ${docker_build_script} ${BASEDIR}/1.16.5
push-1.16.5:
	bash ${docker_push_script} ${BASEDIR}/1.16.5
run-1.16.5:
	bash ${docker_run_script} ${BASEDIR}/1.16.5

# version 1.16.5 with upx
1.16.5-upx: build-1.16.5-upx push-1.16.5-upx
build-1.16.5-upx:
	bash ${docker_build_script} ${BASEDIR}/1.16.5-upx
push-1.16.5-upx:
	bash ${docker_push_script} ${BASEDIR}/1.16.5-upx
run-1.16.5-upx:
	bash ${docker_run_script} ${BASEDIR}/1.16.5-upx

# version 1.16.4
1.16.4: build-1.16.4 push-1.16.4
build-1.16.4:
	bash ${docker_build_script} ${BASEDIR}/1.16.4
push-1.16.4:
	bash ${docker_push_script} ${BASEDIR}/1.16.4
run-1.16.4:
	bash ${docker_run_script} ${BASEDIR}/1.16.4

# version 1.16.4 with upx
1.16.4-upx: build-1.16.4-upx push-1.16.4-upx
build-1.16.4-upx:
	bash ${docker_build_script} ${BASEDIR}/1.16.4-upx
push-1.16.4-upx:
	bash ${docker_push_script} ${BASEDIR}/1.16.4-upx
run-1.16.4-upx:
	bash ${docker_run_script} ${BASEDIR}/1.16.4-upx

# version 1.16.4-librdkafka
1.16.4-librdkafka: build-1.16.4-librdkafka push-1.16.4-librdkafka
build-1.16.4-librdkafka:
	bash ${docker_build_script} ${BASEDIR}/1.16.4-librdkafka
push-1.16.4-librdkafka:
	bash ${docker_push_script} ${BASEDIR}/1.16.4-librdkafka
run-1.16.4-librdkafka:
	bash ${docker_run_script} ${BASEDIR}/1.16.4-librdkafka

# version 1.15.5
1.15.5: build-1.15.5 push-1.15.5
build-1.15.5:
	bash ${docker_build_script} ${BASEDIR}/1.15.5
push-1.15.5:
	bash ${docker_push_script} ${BASEDIR}/1.15.5
run-1.15.5:
	bash ${docker_run_script} ${BASEDIR}/1.15.5

# version 1.15.5 with upx
1.15.5-upx: build-1.15.5-upx push-1.15.5-upx
build-1.15.5-upx:
	bash ${docker_build_script} ${BASEDIR}/1.15.5-upx
push-1.15.5-upx:
	bash ${docker_push_script} ${BASEDIR}/1.15.5-upx
run-1.15.5-upx:
	bash ${docker_run_script} ${BASEDIR}/1.15.5-upx

# version 1.15.6-librdkafka
1.15.6-librdkafka: build-1.15.6-librdkafka push-1.15.6-librdkafka
build-1.15.6-librdkafka:
	bash ${docker_build_script} ${BASEDIR}/1.15.6-librdkafka
push-1.15.6-librdkafka:
	bash ${docker_push_script} ${BASEDIR}/1.15.6-librdkafka
run-1.15.6-librdkafka:
	bash ${docker_run_script} ${BASEDIR}/1.15.6-librdkafka

# version 1.14.12
1.14.12: build-1.14.12 push-1.14.12
build-1.14.12:
	bash ${docker_build_script} ${BASEDIR}/1.14.12
push-1.14.12:
	bash ${docker_push_script} ${BASEDIR}/1.14.12
run-1.14.12:
	bash ${docker_run_script} ${BASEDIR}/1.14.12

# version 1.14.12 with upx
1.14.12-upx: build-1.14.12-upx push-1.14.12-upx
build-1.14.12-upx:
	bash ${docker_build_script} ${BASEDIR}/1.14.12-upx
push-1.14.12-upx:
	bash ${docker_push_script} ${BASEDIR}/1.14.12-upx
run-1.14.12-upx:
	bash ${docker_run_script} ${BASEDIR}/1.14.12-upx

# version 1.14.4
1.14.4: build-1.14.4 push-1.14.4
build-1.14.4:
	bash ${docker_build_script} ${BASEDIR}/1.14.4
push-1.14.4:
	bash ${docker_push_script} ${BASEDIR}/1.14.4
run-1.14.4:
	bash ${docker_run_script} ${BASEDIR}/1.14.4

# version 1.14.4-librdkafka
1.14.4-librdkafka: build-1.14.4-librdkafka push-1.14.4-librdkafka
build-1.14.4-librdkafka:
	bash ${docker_build_script} ${BASEDIR}/1.14.4-librdkafka
push-1.14.4-librdkafka:
	bash ${docker_push_script} ${BASEDIR}/1.14.4-librdkafka
run-1.14.4-librdkafka:
	bash ${docker_run_script} ${BASEDIR}/1.14.4-librdkafka

# version 1.14.4 with upx
1.14.4-upx: build-1.14.4-upx push-1.14.4-upx
build-1.14.4-upx:
	bash ${docker_build_script} ${BASEDIR}/1.14.4-upx
push-1.14.4-upx:
	bash ${docker_push_script} ${BASEDIR}/1.14.4-upx
run-1.14.4-upx:
	bash ${docker_run_script} ${BASEDIR}/1.14.4-upx
