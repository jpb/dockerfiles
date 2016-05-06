FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV APP_NAME packer
ENV APP_VERSION 0.10.0
ENV APP_ARCHIVE_URL https://releases.hashicorp.com/${APP_NAME}/${APP_VERSION}/${APP_NAME}_${APP_VERSION}_linux_amd64.zip
    
RUN apk add --no-cache \
    curl \
    unzip

RUN curl \
  --silent \
  --show-error \
  --location ${APP_ARCHIVE_URL} \
  --output /tmp/${APP_NAME}_${APP_VERSION}.zip \
  && unzip /tmp/${APP_NAME}_${APP_VERSION}.zip -d /tmp/${APP_NAME} \
  && cp -R /tmp/${APP_NAME}/* /usr/local/bin/ \
  && rm -rf /tmp/${APP_NAME}_${APP_VERSION}.zip /tmp/${APP_NAME}

ENTRYPOINT ["/usr/local/bin/packer"]
