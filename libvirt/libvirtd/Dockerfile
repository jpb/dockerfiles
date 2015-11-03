FROM debian:jessie
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/jessie main/jessie main non-free/' /etc/apt/sources.list \
  && apt-get update -qq \
  && apt-get install -y \
    qemu-kvm \
    qemu-system-x86 \
    qemu-utils \
    ovmf \
    seabios \
    libvirt-daemon\ 
    libvirt-daemon-system

RUN mkdir -p /etc/libvirt/qemu/ \
  && echo "listen_tls = 0" >> /etc/libvirt/libvirtd.conf \
  && echo 'listen_tcp = 1' >> /etc/libvirt/libvirtd.conf \
  && echo 'tls_port = "16514"' >> /etc/libvirt/libvirtd.conf \ 
  && echo 'tcp_port = "16509"' >> /etc/libvirt/libvirtd.conf \
  && echo 'auth_tcp = "none"' >> /etc/libvirt/libvirtd.conf \
  && echo 'user = "root"' >> /etc/libvirt/qemu.conf

VOLUME [ "/sys/fs/cgroup" ]
