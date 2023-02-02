# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [3.17](./3.17/Dockerfile)
- [x] [3.16](./3.16/Dockerfile)
- [x] [3.15](./3.15/Dockerfile)
- [x] [3.14](./3.14/Dockerfile)
- [x] [3.13](./3.13/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
