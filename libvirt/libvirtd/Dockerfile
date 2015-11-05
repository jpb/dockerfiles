FROM cspicer/qemu:latest
MAINTAINER Chris Spicer <github@cspicer.ca>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \
  && apt-get install -y \
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
VOLUME [ "/var/lib/libvirt/" ]
