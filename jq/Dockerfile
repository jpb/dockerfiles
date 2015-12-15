FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

RUN apk add --update \
    bash \
    jq \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["jq"]
