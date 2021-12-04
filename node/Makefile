SHELL := /bin/sh

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m

existBash = $(shell cat /etc/shells|grep -w /bin/bash|grep -v grep)
ifneq (, $(strip ${existBash}))
	SHELL = /bin/bash
endif

$(info shell will use ${SHELL})

BASEDIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

docker_build_script=${BASEDIR}/../scripts/docker-build.sh
docker_push_script=${BASEDIR}/../scripts/docker-push.sh
docker_run_script=${BASEDIR}/../scripts/docker-run.sh


tag = latest
# $(info input tag: ${tag})

.PHONY: default list all build push run 

default: list

list:
	@printf "$(ERROR_COLOR) all tags: $(shell find . -type d -d 1|awk -F '/' '{print $2}'|sort -r|xargs) $(NO_COLOR)\n"

all: build push
	@echo "done, ops(build, push), tag: ${tag}"

# version default latest
build: 
	@#echo build with tag: ${tag}
	@printf "$(OK_COLOR)build with tag: ${tag}$(NO_COLOR)\n"
	bash ${docker_build_script} ${BASEDIR}/${tag}
push:
	@#echo push with tag: ${tag}
	@printf "$(OK_COLOR)push with tag: ${tag}$(NO_COLOR)\n"
	bash ${docker_push_script} ${BASEDIR}/${tag}
run:
	@#echo run with tag: ${tag}
	@printf "$(OK_COLOR)run with tag: ${tag}$(NO_COLOR)\n"
	bash ${docker_run_script} ${BASEDIR}/${tag}
