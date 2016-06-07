FROM alpine:3.3
MAINTAINER Chris Spicer <git@cspicer.net>

ENV HUGO_VERSION 0.16
ENV HUGO_ARCHIVE_URL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tgz

RUN apk add --no-cache --virtual \
    build-deps \
    curl \
  && mkdir -p /tmp/hugo \
  && curl \
    --silent \
    --show-error \
    --output /tmp/hugo/hugo-${HUGO_VERSION}.tgz \
    --location ${HUGO_ARCHIVE_URL} \
  && tar -zxf /tmp/hugo/hugo-${HUGO_VERSION}.tgz -C /tmp/hugo \
  && cp -R /tmp/hugo/hugo /usr/local/bin/hugo \
  && rm -rf /tmp/hugo \
  && apk del build-deps

ENTRYPOINT ["hugo"]
