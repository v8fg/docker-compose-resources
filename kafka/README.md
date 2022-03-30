# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [3-debian-10](./3-debian-10/Dockerfile)
- [x] [2.13-2.8.1](./2.13-2.8.1/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
