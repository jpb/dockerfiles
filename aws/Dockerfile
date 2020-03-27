FROM ubuntu:16.04
MAINTAINER James Brennan <james@jamesbrennan.ca>

ENV AWS_CLI_VERSION 1.18.1

RUN apt-get -qq update \
  && apt-get -qq -y install \
    curl \
    unzip \
    groff \
    python-pip \
  && apt-get -qq clean

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" \
  && dpkg -i session-manager-plugin.deb \
  && rm session-manager-plugin.deb

RUN pip install \
    boto3 \
    # awscli==${AWS_CLI_VERSION} \
    cfn-lint \
    aws-shell
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

ENTRYPOINT ["/usr/local/bin/aws"]
