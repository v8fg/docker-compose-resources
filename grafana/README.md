# Docker Compose Resources For Golang

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [6.7.4-ubuntu](./6.7.4-ubuntu/Dockerfile)
- [x] [6.7.4](./6.7.4/Dockerfile)
- [x] [7.0.3](./7.0.3/Dockerfile)
- [x] [7.0.3-ubuntu](./7.0.3-ubuntu/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
