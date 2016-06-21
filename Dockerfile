# VERSION 1.0
# AUTHOR: Donn Lee
# DESCRIPTION: Thin wrapper around generic collectd image. For Rancher environment.
# BUILD: docker build -t donn/collectd-docker-rancher
# SOURCE: https://github.com/donnlee/collectd-docker-rancher

FROM donn/collectd-docker
MAINTAINER Donn Lee <docker@pluza.com>

ADD get_hostname_and_run.sh /root/get_hostname_and_run.sh
RUN chmod +x /root/get_hostname_and_run.sh

CMD ["/root/get_hostname_and_run.sh"]

