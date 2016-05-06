FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV APP_NAME packer
ENV APP_VERSION 0.10.0
ENV ARCHIVE_URL https://releases.hashicorp.com/${APP_NAME}/${APP_VERSION}/${APP_NAME}_${APP_VERSION}_linux_amd64.zip
    
RUN apk add --no-cache \
    curl \
    unzip \
    bash \
    make

RUN curl -sSL ${ARCHIVE_URL} -o /tmp/${APP_NAME}_${APP_VERSION}.zip \
  && unzip /tmp/${APP_NAME}_${APP_VERSION}.zip -d /tmp \
  && cp -R /tmp/${APP_NAME} /usr/local/bin/${APP_NAME} \
  && rm /tmp/${APP_NAME}_${APP_VERSION}.zip /tmp/${APP_NAME}

ENTRYPOINT ["/usr/local/bin/packer"]
