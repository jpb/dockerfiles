FROM jamesbrennan/base
MAINTAINER James Brennan <james@jamesbrennan.ca>

RUN apk add --update \
    bash \
    nodejs \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["node"]
