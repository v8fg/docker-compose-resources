# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [11.2](./11.2/Dockerfile)
- [x] [10.3](./10.3/Dockerfile)
- [x] [9.4](./9.4/Dockerfile)
- [x] [8.5](./8.5/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
