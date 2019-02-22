FROM ubuntu:16.04
MAINTAINER James Brennan <james@jamesbrennan.ca>

ENV AWS_CLI_VERSION 1.16.71

RUN apt-get -qq update \
  && apt-get -qq -y install \
    curl \
    groff \
    python-pip \
  && apt-get -qq clean

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" \
  && dpkg -i session-manager-plugin.deb \
  && rm session-manager-plugin.deb

RUN pip install \
    boto3 \
    awscli==${AWS_CLI_VERSION} \
    cfn-lint \
    aws-shell \

ENTRYPOINT ["/usr/local/bin/aws"]
