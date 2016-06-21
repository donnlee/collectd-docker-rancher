#!/bin/bash

set -x

# Set hostname env var for collectd container using Rancher's metadata service.
HOST_NAME=$(curl -s http://rancher-metadata/2015-12-19/self/host/hostname)

if [[ -z $HOST_NAME ]]
then
  echo "Failed to get host's hostname from rancher-metadata API." > debug
fi

# Run the container's collectd daemon
/root/run.sh
