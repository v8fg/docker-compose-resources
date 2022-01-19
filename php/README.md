# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [8.1](./8.1/Dockerfile)
- [x] [8.1-alpine](./8.1-alpine/Dockerfile)
- [x] [8.1-apache](./8.1-apache/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
