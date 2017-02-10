FROM jamesbrennan/dev
MAINTAINER James Brennan <james@jamesbrennan.ca>

RUN rm /root/bin/emacs /root/bin/emacsclient

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk add --no-cache emacs@testing

RUN rm -r ~/.emacs.d
RUN git clone https://github.com/syl20bnr/spacemacs.git /root/.emacs.d \
    && git --git-dir /root/.emacs.d/.git checkout 7bdde17

RUN emacs -nw -batch -u root -q -kill && \
    sed -i "s/dotspacemacs-install-packages 'all/dotspacemacs-install-packages 'used-but-keep-unused/g" \
      ${HOME}/.spacemacs && \
    emacs -nw -batch -u root -q -kill

ENV TERM screen-256color
ENV LANG en_US.UTF-8
ENV PATH /root/bin:$PATH
ENV SHELL /bin/bash
ENV EMACS_SERVER_FILE /tmp/emacs-docker/server.sock
ENV ALTERNATE_EDITOR emacs
ENV EDITOR emacsclient

ENTRYPOINT ["emacs"]