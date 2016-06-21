# VERSION 1.0
# AUTHOR: Donn Lee
# DESCRIPTION: Thin wrapper around generic collectd image. For Rancher environment.
# BUILD: docker build -t donn/collectd-docker-rancher
# SOURCE: https://github.com/donnlee/collectd-docker-rancher

FROM donn/collectd-docker
MAINTAINER donn

# Grab the host's hostname from rancher-metadata API. Substitute in .conf file.
# If this image is run without Rancher, then curl will fail and perl
# substitution will not happen.

# Append 'exit 0' to ignore 'docker build' error when attempting curl.
RUN COLLECTD_HOSTNAME=$(curl -s http://rancher-metadata/2015-12-19/self/host/hostname); exit 0
RUN if [ "$COLLECTD_HOSTNAME" ]; \
    then /usr/bin/perl -p -i -e "s/Hostname \".+\"/Hostname \"${COLLECTD_HOSTNAME}\"/g" \
      /etc/collectd/collectd.conf; \
    else echo "Failed to get host's hostname from rancher-metadata API." > /debug; \
    fi
