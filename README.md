# Docker Compose Resources

> If you have any public images want to build , also can send email or issues, will deal it at my convenience, thks.

## Image List

- [aerospike](./aerospike/README.md)
- [alpine](./alpine/README.md)
- [bash](./bash/README.md)
- [busybox](./busybox/README.md)
- [centos](./centos/README.md)
- [elasticsearch](./elasticsearch/README.md)
- [erlang](./erlang/README.md)
- [etcd](./etcd/README.md)
- [filebrowser](./filebrowser/README.md)
- [flink](./flink/README.md)
- [fluentd](./fluentd/README.md)
- [gcc](./gcc/README.md)
- [gitlab](./gitlab/README.md)
- [golang](./golang/README.md)
- [grafana](./grafana/README.md)
- [influxdb](./influxdb/README.md)
- [jenkins](./jenkins/README.md)
- [julia](./julia/README.md)
- [kafka](./kafka/README.md)
- [kibana](./kibana/README.md)
- [logstash](./logstash/README.md)
- [mysql](./mysql/README.md)
- [nats](./nats/README.md)
- [nexus3](./nexus3/README.md)
- [nginx](./nginx/README.md)
- [node](./node/README.md)
- [openjdk](./openjdk/README.md)
- [php](./php/README.md)
- [postgres](./postgres/README.md)
- [pulsar](./pulsar/README.md)
- [pyroscope](./pyroscope/README.md)
- [python](./python/README.md)
- [redis](./redis/README.md)
- [registry](./registry/README.md)
- [ruby](./ruby/README.md)
- [rust](./rust/README.md)
- [sonarqube](./sonarqube/README.md)
- [swift](./swift/README.md)
- [ubuntu](./ubuntu/README.md)
- [zookeeper](./zookeeper/README.md)

## Usage

>[reference](https://docs.docker.com/reference/)

`docker pull [OPTIONS] NAME[:TAG|@DIGEST]`

### copy file to multi dirs

`find . -type d -d 1|grep -v '^\./\.\|scripts'|xargs -n 1 cp -v alpine/Makefile`

## Project Structure

```text
┌── golang:                         golang related Dockerfile & docker-compose file
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
