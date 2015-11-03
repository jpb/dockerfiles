FROM debian:jessie
MAINTAINER Chris Spicer <github@cspicer.ca>

# based on: http://www.projectatomic.io/blog/2014/10/libvirtd_in_containers/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y \
  libvirt-clients \
  virtinst \
  virt-top

VOLUME [ "/var/lib/libvirt/" ]

CMD ["/usr/bin/virsh"]
