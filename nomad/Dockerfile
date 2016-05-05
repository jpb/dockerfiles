FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV NOMAD_VERSION 0.2.2
ENV NOMAD_ARCHIVE_URL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    unzip

RUN curl -sSL ${NOMAD_ARCHIVE_URL} -o /tmp/nomad.zip \
  && unzip /tmp/nomad.zip -d /tmp/nomad \
  && cp -R /tmp/nomad/* /usr/local/bin \
  && rm -rf /tmp/nomad.zip /tmp/nomad

ENTRYPOINT ["/usr/local/bin/nomad"]
