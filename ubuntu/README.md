# Docker Compose Resources

## Images

>`ubuntu:22.04` maybe have some issues, ex: `ls`, warning use latest

- [x] [latest with upx](./latest/Dockerfile)
- [x] [23.04-tf-cpu](./23.04-tf-cpu/Dockerfile)
- [x] [23.04-go1.21.0-tf-cpu](23.04-go1.21.0-tf-cpu/Dockerfile)
- [x] [23.04-go1.21.0-upx](23.04-go1.21.0-upx/Dockerfile)
- [x] [23.04-go1.20.7-tf-cpu](23.04-go1.20.7-tf-cpu/Dockerfile)
- [x] [23.04-go1.20.7-upx](23.04-go1.20.7-upx/Dockerfile)
- [x] [23.04-tf-cpu](./23.04-tf-cpu/Dockerfile)
- [x] [22.04-go1.21.0-tf-cpu](22.04-go1.21.0-tf-cpu/Dockerfile)
- [x] [22.04-go1.21.0-upx](22.04-go1.21.0-upx/Dockerfile)
- [x] [22.04-go1.20.7-tf-cpu](22.04-go1.20.7-tf-cpu/Dockerfile)
- [x] [22.04-go1.20.7-upx](22.04-go1.20.7-upx/Dockerfile)
- [x] [20.04-jdk-11](./20.04-jdk-11/Dockerfile)
- [x] [20.04-tf-cpu](./20.04-tf-cpu/Dockerfile)
- [x] [20.04-go1.21.0-tf-cpu](20.04-go1.21.0-tf-cpu/Dockerfile)
- [x] [20.04-go1.21.0-upx](20.04-go1.21.0-upx/Dockerfile)
- [x] [20.04-go1.20.7-tf-cpu](20.04-go1.20.7-tf-cpu/Dockerfile)
- [x] [20.04-go1.20.7-upx](20.04-go1.20.7-upx/Dockerfile)
- [x] [18.04](./18.04/Dockerfile)
- [x] [18.04-tf-cpu](./18.04-tf-cpu/Dockerfile)
- [x] [18.04-tf-cpu-upx](./18.04-tf-cpu-upx/Dockerfile)
- [x] [18.04-go1.21.0-tf-cpu](18.04-go1.21.0-tf-cpu/Dockerfile)
- [x] [18.04-go1.21.0-upx](./18.04-go1.21.0-upx/Dockerfile)
- [x] [18.04-go1.20.7-tf-cpu](18.04-go1.20.7-tf-cpu/Dockerfile)
- [x] [18.04-go1.20.7-upx](18.04-go1.20.7-upx/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
