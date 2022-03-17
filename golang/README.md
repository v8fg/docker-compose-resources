# Docker Compose Resources

## Warn

If use `alpine3.14+`, maybe occur `operation issues`, pls check your `docker`, `docker-compose` or `docker desktop` version

>**Docker Engine version shall**: `20.10.8+`

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [latest-upx](./latest-upx/Dockerfile)
- [x] [official-1.17.8-alpine3.13](./official-1.17.8-alpine3.13/Dockerfile)
- [x] [official-1.18-alpine3.13](./official-1.18-alpine3.13/Dockerfile)
- [x] [official-1.18.0-alpine3.13](./official-1.18.0-alpine3.13/Dockerfile)
- [x] [1.18](./1.18/Dockerfile)
- [x] [1.18-upx](./1.18-upx/Dockerfile)
- [x] [1.18.0](./1.18.0/Dockerfile)
- [x] [1.18.0-upx](./1.18.0-upx/Dockerfile)
- [x] [1.18-alpine3.13](./1.18-alpine3.13/Dockerfile)
- [x] [1.18-alpine3.13-upx](./1.18-alpine3.13-upx/Dockerfile)
- [x] [1.17](./1.17/Dockerfile)
- [x] [1.17-upx](./1.17-upx/Dockerfile)
- [x] [1.17.8](./1.17.8/Dockerfile)
- [x] [1.17.8-upx](./1.17.8-upx/Dockerfile)
- [x] [1.17.8-alpine3.13](./1.17.8-alpine3.13/Dockerfile)
- [x] [1.17.8-alpine3.13-upx](./1.17.8-alpine3.13-upx/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
