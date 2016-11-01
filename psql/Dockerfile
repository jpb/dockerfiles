FROM jamesbrennan/base
MAINTAINER James Brennan <james@jamesbrennan.ca>

RUN apk add --update \
    bash \
    postgresql \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["psql"]
