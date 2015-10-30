FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'Dpkg::Progress-Fancy "1";' >> /etc/apt/apt.conf.d/99progressbar

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /usr/share/doc/* \
  && rm -rf /usr/share/info/* \
  && rm -rf /usr/share/lintian/* \
  && rm -rf /usr/share/locale/* \
  && rm -rf /usr/share/man/* \
  && rm -rf /var/cache/debconf/*-old \
  && rm -rf /var/lib/apt/lists/*
