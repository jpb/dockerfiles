FROM jamesbrennan/base

RUN curl -L https://github.com/kubernetes-incubator/kube-aws/releases/download/v0.9.9/kube-aws-linux-amd64.tar.gz -o /tmp/kube-aws.tar.gz

RUN mkdir /tmp/kube-aws \
  && tar -zxvf /tmp/kube-aws.tar.gz -C /tmp/kube-aws \
  && mv /tmp/kube-aws/linux-amd64/kube-aws /usr/local/bin \
  && rm -r /tmp/kube-aws*

ENTRYPOINT ["kube-aws"]
