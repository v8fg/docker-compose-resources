# Docker Compose Resources For Golang

## Images

>`docker-compose.yml will to be added`

### ce

- [x] [latest](./gitlab-ce/latest/Dockerfile)
- [x] [nightly](./gitlab-ce/nightly/Dockerfile)
- [x] [13.11.3](./gitlab-ce/13.11.3/Dockerfile)

### runner

- [x] [latest](./gitlab-runner/latest/Dockerfile)
- [x] [alpine-bleeding](./gitlab-runner/alpine-bleeding/Dockerfile)

### sameersbn

- [x] [latest](./gitlab-sameersbn/latest/Dockerfile)
- [x] [13.12.2](./gitlab-sameersbn/13.12.2/Dockerfile)
- [x] [13.0.6](./gitlab-sameersbn/13.0.6/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build image: `make build`
- push image: `make push`
- run container: `make run`
