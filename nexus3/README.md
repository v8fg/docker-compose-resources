# Docker Compose Resources For Golang

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [3.29.2](./3.29.2/Dockerfile)
- [x] [3.24.0](./3.24.0/Dockerfile)
- [x] [3.23.0](./3.23.0/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build image: `make build`
- push image: `make push`
- run container: `make run`

## Tips

### issue

- `admin com.sonatype.nexus.plugins.outreach.internal.outreach.SonatypeOutreach - Could not download page bundle`
  - disable `Administration -> System -> Capabilities`

## Ref

- [How to avoid Could not download page bundle messages](https://support.sonatype.com/hc/en-us/articles/213464978-How-to-avoid-Could-not-download-page-bundle-messages)
