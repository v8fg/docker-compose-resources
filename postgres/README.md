# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [14-alpine](./14-alpine/Dockerfile)
- [x] [13-alpine](./13-alpine/Dockerfile)
- [x] [13.6-alpine](./13.6-alpine/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
