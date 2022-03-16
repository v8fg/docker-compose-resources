# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [latest-upx](./latest-upx/Dockerfile)
- [x] [1.18](./1.18/Dockerfile)
- [x] [1.18-upx]((./1.18-upx/Dockerfile))
- [x] [1.17](./1.17/Dockerfile)
- [x] [1.17-upx]((./1.17-upx/Dockerfile))
- [x] [1.17.8](./1.17.8/Dockerfile)
- [x] [1.17.8-upx]((./1.17.8-upx/Dockerfile))
- [x] [1.17.7](./1.17.7/Dockerfile)
- [x] [1.17.7-upx]((./1.17.7-upx/Dockerfile))
- [x] [1.16](./1.16/Dockerfile)
- [x] [1.16-upx]((./1.16-upx/Dockerfile))
- [x] [1.16.14](./1.16.14/Dockerfile)
- [x] [1.16.14-upx]((./1.16.14-upx/Dockerfile))

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
