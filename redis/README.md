# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [7.0.4](./7.0.4/Dockerfile)
- [x] [7.0.4-alpine3.16](./7.0.4-alpine3.16/Dockerfile)
- [x] [7](./7/Dockerfile)
- [x] [7-alpine3.16](./7-alpine3.16/Dockerfile)
- [x] [6.2-alpine](./6.2/Dockerfile)
- [x] [6.2-alpine3.16](./6.2-alpine3.16/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
