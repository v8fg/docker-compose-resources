# Docker Compose Resources For Golang

## Images

>`ubuntu:22.04` maybe have some issues, ex: `ls`, warning use latest

- [x] [latest with upx](./latest/Dockerfile)
- [x] [22.04-tf-cpu](./22.04-tf-cpu/Dockerfile)
- [x] [22.04-go1.17.5-tf-cpu](./22.04-go1.17.5-tf-cpu/Dockerfile)
- [x] [20.04-tf-cpu](./20.04-tf-cpu/Dockerfile)
- [x] [20.04-go1.17.5-tf-cpu](./20.04-go1.17.5-tf-cpu/Dockerfile)
- [x] [20.04-go1.17.5-upx](./20.04-go1.17.5-upx/Dockerfile)
- [x] [18.04-tf-cpu](./18.04-tf-cpu/Dockerfile)
- [x] [18.04-tf-cpu-upx](./18.04-tf-cpu-upx/Dockerfile)
- [x] [18.04-go1.17.5-tf-cpu](./18.04-go1.17.5-tf-cpu/Dockerfile)
- [x] [18.04-go1.17.5-upx](./18.04-go1.17.5-upx/Dockerfile)
- [x] [16.04-go1.17-tf-cpu](./16.04-go1.17-tf-cpu/Dockerfile)
- [x] [16.04-go1.17-upx](./16.04-go1.17-upx/Dockerfile)
- [x] [16.04-go1.17.5-tf-cpu](./16.04-go1.17.5-tf-cpu/Dockerfile)
- [x] [16.04-go1.17.5-upx](./16.04-go1.17.5-upx/Dockerfile)
- [x] [16.04](./16.04/Dockerfile)
- [x] [16.04-go1.17](./16.04-go1.17/Dockerfile)
- [x] [16.04-go1.17-tf-cpu](./16.04-go1.17-tf-cpu/Dockerfile)
- [x] [16.04-go1.17-upx](./16.04-go1.17-upx/Dockerfile)
- [x] [16.04-go1.16](./16.04-go1.16/Dockerfile)
- [x] [16.04-go1.16-tf-cpu](./16.04-go1.16-tf-cpu/Dockerfile)
- [x] [16.04-go1.16-upx](./16.04-go1.16-upx/Dockerfile)
- [x] [16.04-tf-cpu](./16.04-tf-cpu/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
