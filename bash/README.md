# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [5.1-alpine3.14](./5.1-alpine3.14/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
