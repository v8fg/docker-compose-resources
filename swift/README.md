# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [5.5](./5.5/Dockerfile)
- [x] [5.5-bionic](./5.5-bionic/Dockerfile)
- [x] [5.5-centos8](./5.5-centos8/Dockerfile)
- [x] [5.5-xenial](./5.5-xenial/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`

## [Doc](https://github.com/jenkinsci/docker/blob/master/README.md)
