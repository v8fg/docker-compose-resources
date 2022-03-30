# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [7.0-rc](./7.0-rc/Dockerfile)
- [x] [7.0-rc-alpine3.15](./7.0-rc-alpine3.15/Dockerfile)
- [x] [6.2-alpine](./6.2/Dockerfile)
- [x] [6.2-alpine3.15](./6.2-alpine3.15/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
