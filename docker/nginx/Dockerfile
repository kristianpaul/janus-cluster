FROM debian:stretch-slim

RUN  set -x \
    && apt-get update && apt-get install -y nginx wget python virtualenv vim curl\
    && wget https://releases.hashicorp.com/consul-template/0.19.5/consul-template_0.19.5_linux_amd64.tgz \
    && tar xfv consul-template_0.19.5_linux_amd64.tgz \
    && mv consul-template /usr/bin/ \
    && mkdir -p /etc/nginx/ssl/ \
    && openssl dhparam -out /etc/nginx/ssl/dhparams.pem 2048

COPY run.sh /run.sh
COPY janus.tpl /janus.tpl

EXPOSE 80
EXPOSE 443

CMD  /run.sh
