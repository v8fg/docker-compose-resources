# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [19-jdk-alpine3.15](./19-jdk-alpine3.15/Dockerfile)
- [x] [19-jdk-buster](./19-jdk-buster/Dockerfile)
- [x] [19-jdk-oracle](./19-jdk-oracle/Dockerfile)
- [x] [19-jdk-slim-buster](./19-jdk-slim-buster/Dockerfile)
- [x] [11-jdk-buster](./11-jdk-buster/Dockerfile)
- [x] [11-jdk-oracle](./11-jdk-oracle/Dockerfile)
- [x] [11-jdk-slim-buster](./11-jdk-slim-buster/Dockerfile)
- [x] [11-jre](./11-jre/Dockerfile)
- [x] [11-jre-buster](./11-jre-buster/Dockerfile)
- [x] [11-jre-slim](./11-jre-slim/Dockerfile)
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
