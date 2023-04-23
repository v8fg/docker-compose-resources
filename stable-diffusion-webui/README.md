# Docker Compose Resources

## Privileged

- CURRENT_UID=$(id -u):$(id -g) `docker-compose up`
- user: 1000:1000 # chown 1000:1000 ./data
- `privileged: true`

## Images

- [x] [cuda12.1.0-ubuntu20](./cuda12.1.0-ubuntu20/Dockerfile)
- [x] [cuda11.6.0-ubuntu20](./cuda11.6.0-ubuntu20/Dockerfile)
- [x] [cuda11.4.1-ubuntu20](./cuda11.4.1-ubuntu20/Dockerfile)
- [x] [sd-cuda12.1-ubuntu20](./sd-cuda12.1-ubuntu20/Dockerfile)
- [x] [sd-cuda11.6-ubuntu20](./sd-cuda11.6-ubuntu20/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`
