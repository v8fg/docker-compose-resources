# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [8.3.1-ubuntu](./8.3.1-ubuntu/Dockerfile)
- [x] [8.3.1](./8.3.1/Dockerfile)
- [x] [7.0.3](./7.0.3/Dockerfile)
- [x] [7.0.3-ubuntu](./7.0.3-ubuntu/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
