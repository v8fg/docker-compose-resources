FROM alpine:3.13

LABEL author="xwi88" type="go" github="https://github.com/xwi88" group="https://github.com/v8fg"

RUN rm -rf /usr/local/go 
COPY --from=golang:1.19.10-alpine /usr/local/go/ /usr/local/go/
ENV PATH=$PATH:/usr/local/go/bin

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH
