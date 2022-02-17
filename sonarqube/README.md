# Docker Compose Resources

## Images

- [x] [latest](./latest/Dockerfile)
- [x] [community](./community/Dockerfile)
- [x] [9-community](./9-community/Dockerfile)
- [x] [9.3.0-community](./9.3.0-community/Dockerfile)

## Scripts

>ref: [Makefile](./Makefile)

- build and push image: `make all [tag=latest]`
- build image: `make build [tag=latest]`
- push image: `make push [tag=latest]`
- run container: `make run [tag=latest]`
- list all tags: `make | make list`

## Tips

### issue

- `admin com.sonatype.nexus.plugins.outreach.internal.outreach.SonatypeOutreach - Could not download page bundle`
  - disable `Administration -> System -> Capabilities`

## Ref

- [How to avoid Could not download page bundle messages](https://support.sonatype.com/hc/en-us/articles/213464978-How-to-avoid-Could-not-download-page-bundle-messages)
