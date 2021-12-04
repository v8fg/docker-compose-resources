# Docker Compose Resources For Golang

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [latest-upx](./latest-upx/Dockerfile)
- [x] [1.17](./1.17/Dockerfile)
- [x] [1.17-upx]((./1.17-upx/Dockerfile))
- [x] [1.17.4](./1.17.4/Dockerfile)
- [x] [1.17.4-upx]((./1.17.4-upx/Dockerfile))
- [x] [1.17.3](./1.17.3/Dockerfile)
- [x] [1.17.3-upx]((./1.17.3-upx/Dockerfile))
- [x] [1.16.7](./1.16.7/Dockerfile)
- [x] [1.16.7-upx]((./1.16.7-upx/Dockerfile))
- [x] [1.16](./1.16/Dockerfile)
- [x] [1.16-upx]((./1.16-upx/Dockerfile))
- [x] [1.16.5](./1.16.5/Dockerfile)
- [x] [1.16.5-upx]((./1.16.5-upx/Dockerfile))
- [x] [1.16.4](./1.16.4/Dockerfile)
- [x] [1.16.4-upx]((./1.16.4-upx/Dockerfile))
- [x] [1.16.4-librdkafka](./1.16.4-librdkafka/Dockerfile)
- [x] [1.15.5](./1.15.5/Dockerfile)
- [x] [1.15.5-upx]((./1.15.5-upx/Dockerfile))
- [x] [1.15.6-librdkafka](./1.15.6-librdkafka/Dockerfile)
- [x] [1.14.4](./1.14.4/Dockerfile)
- [x] [1.14.4-librdkafka](./1.14.4-librdkafka/Dockerfile)
- [x] [1.14.4-upx]((./1.14.4-upx/Dockerfile))
- [x] [1.14.12](./1.14.12/Dockerfile)
- [x] [1.14.12-upx]((./1.14.12-upx/Dockerfile))

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
