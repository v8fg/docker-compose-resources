# Docker Compose Resources

## Images

>`ubuntu:22.04` maybe have some issues, ex: `ls`, warning use latest

- [x] [latest with upx](./latest/Dockerfile)
- [x] [22.04-tf-cpu](./22.04-tf-cpu/Dockerfile)
- [x] [22.04-go1.20.5-tf-cpu](22.04-go1.20.5-tf-cpu/Dockerfile)
- [x] [22.04-go1.20.5-upx](22.04-go1.20.5-upx/Dockerfile)
- [x] [22.04-go1.19.10-tf-cpu](22.04-go1.19.10-tf-cpu/Dockerfile)
- [x] [22.04-go1.19.10-upx](22.04-go1.19.10-upx/Dockerfile)
- [x] [20.04-jdk-11](./20.04-jdk-11/Dockerfile)
- [x] [20.04-tf-cpu](./20.04-tf-cpu/Dockerfile)
- [x] [20.04-go1.20.5-tf-cpu](20.04-go1.20.5-tf-cpu/Dockerfile)
- [x] [20.04-go1.20.5-upx](20.04-go1.20.5-upx/Dockerfile)
- [x] [20.04-go1.19.10-tf-cpu](20.04-go1.19.10-tf-cpu/Dockerfile)
- [x] [20.04-go1.19.10-upx](20.04-go1.19.10-upx/Dockerfile)
- [x] [18.04](./18.04/Dockerfile)
- [x] [18.04-tf-cpu](./18.04-tf-cpu/Dockerfile)
- [x] [18.04-tf-cpu-upx](./18.04-tf-cpu-upx/Dockerfile)
- [x] [18.04-go1.20.5-tf-cpu](18.04-go1.20.5-tf-cpu/Dockerfile)
- [x] [18.04-go1.20.5-upx](18.04-go1.20.5-upx/Dockerfile)
- [x] [18.04-go1.19.10-tf-cpu](18.04-go1.19.10-tf-cpu/Dockerfile)
- [x] [18.04-go1.19.10-upx](./18.04-go1.19.10-upx/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
