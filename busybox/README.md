# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [1.34-glibc](./1.34-glibc/Dockerfile)
- [x] [1.34-musl](./1.34-musl/Dockerfile)
- [x] [1.34-uclibc](./1.34-uclibc/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
