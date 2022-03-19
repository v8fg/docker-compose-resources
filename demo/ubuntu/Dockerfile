FROM ubuntu

LABEL author=xwi88 type=demo name=ubuntu github="https://github.com/xwi88" group="https://github.com/v8fg"

RUN apt-get update && apt-get install nginx -y && apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/sbin/nginx"]
