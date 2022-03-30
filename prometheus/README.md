# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [latest](./latest/Dockerfile)
- [x] [2.34](./2.34/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
