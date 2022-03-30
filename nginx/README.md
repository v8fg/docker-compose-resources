# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [1.21](./1.21/Dockerfile)
- [x] [1.21-alpine](./1.21-alpine/Dockerfile)
- [x] [1.21-alpine-perl](./1.21-alpine-perl/Dockerfile)
- [x] [1.21-perl](./1.21-perl/Dockerfile)
- [x] [1.21.6](./1.21.6/Dockerfile)
- [x] [1.21.6-alpine](./1.21.6-alpine/Dockerfile)
- [x] [1.21.6-alpine-perl](./1.21.6-alpine-perl/Dockerfile)
- [x] [1.21.6-perl](./1.21.6-perl/Dockerfile)
- [x] [1.20.0](./1.20.0/Dockerfile)
- [x] [1.20.0-alpine](./1.20.0-alpine/Dockerfile)
- [x] [1.20.0-alpine-perl](./1.20.0-alpine-perl/Dockerfile)
- [x] [1.20.0-perl](./1.20.0-perl/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
