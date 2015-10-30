FROM alpine:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV APP_NAME packer
ENV APP_VERSION 0.8.6
ENV ARCHIVE_URL https://releases.hashicorp.com/${APP_NAME}/${APP_VERSION}/${APP_NAME}_${APP_VERSION}_linux_amd64.zip
    
RUN apk add --update \
    curl unzip \
  && rm -rf /var/cache/apk/*

RUN curl -sSL ${ARCHIVE_URL} -o /tmp/${APP_NAME}_${APP_VERSION}.zip \
  && unzip /tmp/${APP_NAME}_${APP_VERSION}.zip -d /tmp/${APP_NAME} \
  && cp -R /tmp/${APP_NAME}/* /usr/local/bin \
  && rm -rf /tmp/${APP_NAME}_${APP_VERSION}.zip /tmp/${APP_NAME}

ENTRYPOINT ["/usr/local/bin/packer"]
