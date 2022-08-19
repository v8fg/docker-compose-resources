# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [1-alpine](./1-alpine/Dockerfile)
- [x] [1.63-alpine](./1.63-alpine/Dockerfile)
- [x] [1.59-alpine](./1.59-alpine/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
