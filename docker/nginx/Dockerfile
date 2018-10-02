FROM debian:stretch-slim

RUN  set -x \
    && apt-get update && apt-get install -y nginx wget \
    && wget https://releases.hashicorp.com/consul-template/0.19.5/consul-template_0.19.5_linux_amd64.tgz \
    && tar xfv consul-template_0.19.5_linux_amd64.tgz \
    && mv consul-template /usr/bin/

COPY run.sh /run.sh
COPY janus.tpl /janus.tpl

EXPOSE 80

CMD  /run.sh
