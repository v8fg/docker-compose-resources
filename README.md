# Docker Compose Resources

## Project structure

```text
┌── golang:                         golang related Dockerfile & docker-compose file
    |__ 1.14.4:                     golang version 1.14.4 image dir
    |__ 1.14.4-upx:                 golang version 1.14.4 with upx
    |__ latest:                     golang version latest image dir
        |__ docker-compose.yml:     docker compose file, use to create and start container
        |__ docker-version.sh:      version info for build and push docker image
        |__ Dockerfile:             define the docker image
    |__ latest-upx:                 golang latest version with upx
    |__ docker-run.sh:              script for run the special version docker image
    |__ Makefile:                   use command make to build, push and run docker images for golang
|__ scripts:                        common scripts
    |__ docker-build.sh:            docker image build script
    |__ docker-push.sh:             docker image push script
|__ .gitignore:                     gitignore
|__ Makefile:                       use command make to build and push latest docker image
```
