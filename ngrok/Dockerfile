FROM jamesbrennan/base
MAINTAINER James Brennan <james@jamesbrennan.ca>

RUN apk add --no-cache --virtual .build-deps wget \
  && apk add --no-cache ca-certificates \
  && cd /tmp \
  && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
  && unzip ngrok-stable-linux-amd64.zip \
  && install -v -D ngrok /bin/ngrok \
  && rm -f ngrok-stable-linux-amd64.zip ngrok \
  && apk del .build-deps

ENTRYPOINT ["ngrok"]