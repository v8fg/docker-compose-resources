# Docker Compose Resources

>**Demo images, only for test**

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [alpine](./alpine/Dockerfile)
- [x] [ubuntu](./ubuntu/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
