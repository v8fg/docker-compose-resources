# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [latest-upx](./latest-upx/Dockerfile)
- [x] [1.17](./1.17/Dockerfile)
- [x] [1.17-upx]((./1.17-upx/Dockerfile))
- [x] [1.17.5](./1.17.5/Dockerfile)
- [x] [1.17.5-upx]((./1.17.5-upx/Dockerfile))
- [x] [1.16](./1.16/Dockerfile)
- [x] [1.16-upx]((./1.16-upx/Dockerfile))
- [x] [1.16.12](./1.16.12/Dockerfile)
- [x] [1.16.12-upx]((./1.16.12-upx/Dockerfile))

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
