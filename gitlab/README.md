# Docker Compose Resources For Golang

## Images

>`docker-compose.yml will to be added`

### ce

- [x] [latest](./gitlab-ce/latest/Dockerfile)
- [x] [nightly](./gitlab-ce/nightly/Dockerfile)
- [x] [14.5.2](./gitlab-ce/14.5.2/Dockerfile)

### runner

- [x] [latest](./gitlab-runner/latest/Dockerfile)
- [x] [alpine-bleeding](./gitlab-runner/alpine-bleeding/Dockerfile)

### sameersbn

- [x] [latest](./gitlab-sameersbn/latest/Dockerfile)
- [x] [14.4.3](./gitlab-sameersbn/14.4.3/Dockerfile)
- [x] [13.12.4](./gitlab-sameersbn/13.12.4/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
