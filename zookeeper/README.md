# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [3.7](./3.7/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`

## [Doc](https://github.com/jenkinsci/docker/blob/master/README.md)
