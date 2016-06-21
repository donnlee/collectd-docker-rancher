#!/bin/bash

set -x

COLLECTD_HOSTNAME=$(curl -s http://rancher-metadata/2015-12-19/self/host/hostname)

if [[ "$COLLECTD_HOSTNAME" ]]
then
  /usr/bin/perl -p -i -e "s/Hostname \".+\"/Hostname \"${COLLECTD_HOSTNAME}\"/g" /etc/collectd/collectd.conf
else
  echo "Failed to get host's hostname from rancher-metadata API." > debug
fi

# Run the container's collectd daemon
/root/run.sh
