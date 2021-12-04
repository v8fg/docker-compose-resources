# Docker Compose Resources For Golang

## Images

>`docker-compose.yml will to be added`

### ce

- [x] [latest](./gitlab-ce/latest/Dockerfile)
- [x] [nightly](./gitlab-ce/nightly/Dockerfile)
- [x] [14.1.2](./gitlab-ce/14.1.2/Dockerfile)
- [x] [13.11.3](./gitlab-ce/13.11.3/Dockerfile)

### runner

- [x] [latest](./gitlab-runner/latest/Dockerfile)
- [x] [alpine-bleeding](./gitlab-runner/alpine-bleeding/Dockerfile)

### sameersbn

- [x] [latest](./gitlab-sameersbn/latest/Dockerfile)
- [x] [14.1.1](./gitlab-sameersbn/14.1.1/Dockerfile)
- [x] [13.12.2](./gitlab-sameersbn/13.12.2/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
