# Docker Compose Resources

## Prerequisites

- `nvidia-container-runtime` 
  - test with `which nvidia-container-runtime-hook`
- Restart the Docker daemon

## Images

- [x] [12.1.0-base-ubuntu22.04](./12.1.0-base-ubuntu22.04/Dockerfile)
- [x] [12.1.0-base-ubuntu20.04](./12.1.0-base-ubuntu20.04/Dockerfile)
- [x] [12.1.0-base-centos8](./12.1.0-base-centos8/Dockerfile)
- [x] [12.1.0-base-centos7](./12.1.0-base-centos7/Dockerfile)
- [x] [11.4.0-base-ubuntu20.04](./11.4.0-base-ubuntu20.04/Dockerfile)
- [x] [11.4.0-base-centos8](./11.4.0-base-centos8/Dockerfile)
- [x] [11.4.0-base-centos7](./11.4.0-base-centos7/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
