# Docker Compose Resources

## Image List

- [alpine](./alpine/README.md)
- [gitlab](./gitlab/README.md)
- [golang](./golang/README.md)
- [grafana](./grafana/README.md)
- [jenkins](./jenkins/README.md)
- [kafka](./kafka/README.md)
- [mysql](./mysql/README.md)
- [nexus3](./nexus3/README.md)
- [nginx](./nginx/README.md)
- [node](./node/README.md)
- [openjdk](./openjdk/README.md)
- [postgres](./postgres/README.md)
- [redis](./redis/README.md)
- [rust](./rust/README.md)

## Usage

>[reference](https://docs.docker.com/reference/)

`docker pull [OPTIONS] NAME[:TAG|@DIGEST]`

## Project Structure

```text
┌── golang:                         golang related Dockerfile & docker-compose file
    |__ 1.14.4:                     golang version 1.14.4 image dir
    |__ 1.14.4-upx:                 golang version 1.14.4 with upx
    |__ latest:                     golang version latest image dir
        |__ docker-compose.yml:     docker compose file, use to create and start container
        |__ docker-version.sh:      version info for build and push docker image
        |__ Dockerfile:             define the docker image
    |__ latest-upx:                 golang latest version with upx
    |__ Makefile:                   use command make to build, push and run docker images for golang
|___xxx:                            xxx  related Dockerfile & docker-compose file
|__ scripts:                        common scripts
    |__ docker-build.sh:            docker image build script
    |__ docker-clean.sh:            docker images clean, contains none for REPOSITORY or TAG
    |__ docker-push.sh:             docker image push script
    |__ docker-run.sh:              script for run the special version docker image
|__ .gitignore:                     gitignore
|__ Makefile:                       use command make to build and push latest docker image
```

## Docker and DockerCompose Set

### [Docker Engine Install](https://docs.docker.com/engine/install/)

>Recommendation

- Docker Desktop Version: **2.3.1.0**, Channel: **edge**
- Engine: 19.03.8+
- Compose: 1.26.0-rc4+

- [Install on CentOS](https://docs.docker.com/engine/install/centos/)
- [Install binaries](https://docs.docker.com/engine/install/binaries/)
  - [linux](https://download.docker.com/linux/static/stable/x86_64/)
  - [mac](https://download.docker.com/mac/static/stable/x86_64/)

#### Binaries Install

```bash
sudo cp docker/* /usr/bin/
```

### DockerCompose

`brew install docker-compose`

***docker-compose.yml*** `env priority`：

- Compose file
- Shell environment variables(use command source enable set)
- Environment file
- Dockerfile
- Variable is not defined

## mirrors site

- [tuna](https://mirrors.tuna.tsinghua.edu.cn)
- [bfsu](https://mirrors.bfsu.edu.cn/)
- [ustc](http://mirrors.ustc.edu.cn/)
- [aliyun](http://mirrors.aliyun.com/)
- [163](http://mirrors.163.com/)
- [zju](http://mirrors.zju.edu.cn/)
