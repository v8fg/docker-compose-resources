# Docker Compose Resources For Golang

## Images

- [x] [latest with upx](./latest/Dockerfile)
- [x] [16.04](./16.04/Dockerfile)
- [x] [16.04-go1.16](./16.04-go1.16/Dockerfile)
- [x] [16.04-go1.16-tf-cpu](./16.04-go1.16-tf-cpu/Dockerfile)
- [x] [16.04-go1.16-upx](./16.04-go1.16-upx/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build image: `make build`
- push image: `make push`
- run container: `make run`
