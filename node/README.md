# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [17-alpine3.14](./17-alpine3.14/Dockerfile)
- [x] [16-alpine3.14](./16-alpine3.14/Dockerfile)
- [x] [16-buster](./16-buster/Dockerfile)
- [x] [16-buster-slim](./16-buster-slim/Dockerfile)
- [x] [14.4-alpine3.12](./14.4-alpine3.12/Dockerfile)
- [x] [14.4.0-alpine3.12](./14.4.0-alpine3.12/Dockerfile)
- [x] [14.4.0-buster](./14.4.0-buster/Dockerfile)
- [x] [14.4.0-buster-slim](./14.4.0-buster-slim/Dockerfile)
- [x] [12.18.0-alpine3.12](./12.18.0-alpine3.12/Dockerfile)
- [x] [12.18.0-buster](./12.18.0-buster/Dockerfile)
- [x] [12.18.0-buster-slim](./12.18.0-buster-slim/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
