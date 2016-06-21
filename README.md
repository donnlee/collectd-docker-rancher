# collectd-docker-rancher
Thin container for Rancher environments.

This adds a small bash script to the generic collectd container (donn/collectd-docker)

The script grabs the host's hostname from the Rancher Metadata service, and then executes run.sh used by donn/collectd-docker to setup and run collectd.

# Usage:

Create a Rancher service with the following environment variables:

INFLUXDB_PORT_25826_UDP_ADDR (hostname or IP address of your influxdb server)

INFLUXDB_PORT_25826_UDP_PORT (TCP port on your influxdb server that is listening to the collectd "network" plugin service, usually 25826)

See also: 

https://github.com/donnlee/collectd-docker

https://github.com/donnlee/influxdb-docker
