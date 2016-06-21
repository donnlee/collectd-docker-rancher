# VERSION 1.0
# AUTHOR: Donn Lee
# DESCRIPTION: Thin wrapper around generic collectd image. For Rancher environment.
# BUILD: docker build -t donn/collectd-docker-rancher
# SOURCE: https://github.com/donnlee/collectd-docker-rancher

FROM donn/collectd-docker
MAINTAINER donn

# Grab the host's hostname from rancher-metadata API. Substitute in .conf file.
RUN COLLECTD_HOSTNAME=$(curl -s http://rancher-metadata/2015-12-19/self/host/hostname) \
    && /usr/bin/perl -p -i -e "s/Hostname \".+\"/Hostname \"${COLLECTD_HOSTNAME}\"/g" \
      /etc/collectd/collectd.conf
