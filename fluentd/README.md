# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [v1.14-debian-1](./v1.14-debian-1/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
