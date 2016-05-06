FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV NOMAD_VERSION 0.3.2
ENV NOMAD_ARCHIVE_URL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip
ENV GLIBC_VERSION 2.23-r1
ENV GLIBC_RELEASE_URL https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}

RUN apk add --no-cache  \
    curl \
    ca-certificates \
    unzip \
    libgcc

RUN curl \
    --silent \
    --show-error \
    --location "${GLIBC_RELEASE_URL}/glibc-${GLIBC_VERSION}.apk" \
    --output /tmp/glibc-${GLIBC_VERSION}.apk \
  && curl \
    --silent \
    --show-error \
    --location "${GLIBC_RELEASE_URL}/glibc-bin-${GLIBC_VERSION}.apk" \
    --output /tmp/glibc-bin-${GLIBC_VERSION}.apk \
  && apk add --no-cache --allow-untrusted \
    /tmp/glibc-${GLIBC_VERSION}.apk \
    /tmp/glibc-bin-${GLIBC_VERSION}.apk \
  && rm -rf /tmp/glibc*

RUN curl \
    --silent \
    --show-error \
    --location "${NOMAD_ARCHIVE_URL}" \
    --output /tmp/nomad.zip \
  && unzip /tmp/nomad.zip -d /tmp/nomad \
  && cp -R /tmp/nomad/* /usr/local/bin \
  && rm -rf /tmp/nomad.zip /tmp/nomad

ENTRYPOINT ["/usr/local/bin/nomad"]
