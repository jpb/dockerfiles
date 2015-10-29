FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV TERRAFORM_VERSION 0.6.6

RUN apk add --update \
  ca-certificates curl unzip \
  && curl -sSL https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk -o /tmp/glibc-2.21-r2.apk \
  && apk add --allow-untrusted /tmp/glibc-2.21-r2.apk \
  && curl -sSL https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk -o /tmp/glibc-bin-2.21-r2.apk \
  && apk add --allow-untrusted /tmp/glibc-bin-2.21-r2.apk \
  && rm -rf /tmp/glibc* \
  && rm -rf /var/cache/apk/*

RUN curl -sSL https://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform_${TERRAFORM_VERSION}.zip \
  && unzip /tmp/terraform_${TERRAFORM_VERSION}.zip -d /tmp/terraform \
  && cp -R /tmp/terraform/* /usr/local/bin \
  && rm -rf /tmp/terraform_${TERRAFORM_VERSION}.zip /tmp/terraform

ENTRYPOINT ["/usr/local/bin/terraform"]
