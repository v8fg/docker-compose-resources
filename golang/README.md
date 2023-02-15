# Docker Compose Resources

## Warn

If you use `alpine3.14+`, maybe occur `operation issues`, pls check your `docker`, `docker-compose` or `docker desktop` version

>**Docker Engine version shall**: `20.10.8+`

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [latest-upx](./latest-upx/Dockerfile)
- [x] [official-1.20.1-alpine3.13](official-1.20.1-alpine3.13/Dockerfile)
- [x] [official-1.19.6-alpine3.13](official-1.19.6-alpine3.13/Dockerfile)
- [x] [1.20](./1.20/Dockerfile)
- [x] [1.20-upx](./1.20-upx/Dockerfile)
- [x] [1.20.1](1.20.1/Dockerfile)
- [x] [1.20.1-upx](1.20.1-upx/Dockerfile)
- [x] [1.20.1-alpine3.13](1.20.1-alpine3.13/Dockerfile)
- [x] [1.20.1-alpine3.13-upx](1.20.1-alpine3.13-upx/Dockerfile)
- [x] [1.19](./1.19/Dockerfile)
- [x] [1.19-upx](./1.19-upx/Dockerfile)
- [x] [1.19.6](1.19.6/Dockerfile)
- [x] [1.19.6-upx](1.19.6-upx/Dockerfile)
- [x] [1.19.6-alpine3.13](1.19.6-alpine3.13/Dockerfile)
- [x] [1.19.6-alpine3.13-upx](1.19.6-alpine3.13-upx/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
