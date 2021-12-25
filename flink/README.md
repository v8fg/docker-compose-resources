# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [1.14](./1.14/Dockerfile)
- [x] [1.14-scala_2.12-java8](./1.14-scala_2.12-java8/Dockerfile)
- [x] [1.14-scala_2.12-java11](./1.14-scala_2.12-java11/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
