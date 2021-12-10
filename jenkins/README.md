# Docker Compose Resources For Jenkins

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [2.324-alpine](./2.324-alpine/Dockerfile)
- [x] [2.291-alpine](./2.291-alpine/Dockerfile)
- [x] [2.291-centos7](./2.291-centos7/Dockerfile)
- [x] [2.243-alpine](./2.243-alpine/Dockerfile)
- [x] [2.243-centos7](./2.243-centos7/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`

## [Doc](https://github.com/jenkinsci/docker/blob/master/README.md)
