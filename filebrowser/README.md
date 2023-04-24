# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [v2](./v2/Dockerfile)
- [x] [s6](./s6/Dockerfile)
- [x] [v2-amd64](./v2-amd64/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
