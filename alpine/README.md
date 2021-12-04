# Docker Compose Resources For Golang

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [3.15](./3.15/Dockerfile)
- [x] [3.14](./3.14/Dockerfile)
- [x] [3.13](./3.13/Dockerfile)
- [x] [3.12](./3.12/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
