# Docker Compose Resources For Golang

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [15-jdk-alpine3.11](./15-jdk-alpine3.11/Dockerfile)
- [x] [15-jdk-buster](./15-jdk-buster/Dockerfile)
- [x] [15-jdk-oracle](./15-jdk-oracle/Dockerfile)
- [x] [15-jdk-slim-buster](./15-jdk-slim-buster/Dockerfile)
- [x] [8u212-jdk-alpine3.9](./8u212-jdk-alpine3.9/Dockerfile)
- [x] [8u212-jre-alpine3.9](./8u212-jre-alpine3.9/Dockerfile)
- [x] [8u212-jdk](./8u212-jdk/Dockerfile)
- [x] [8u212-jdk-slim-buster](./8u212-jdk-slim-buster]/Dockerfile)
- [x] [8u212-jre](./8u212-jre]/Dockerfile)
- [x] [8u212-jre-slim-buster](./8u212-jre-slim-buster]/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
