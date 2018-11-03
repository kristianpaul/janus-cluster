FROM debian:stretch-slim

RUN  set -x \
    && apt-get update && apt-get install -y nginx wget python virtualenv vim curl\
    && wget https://releases.hashicorp.com/consul-template/0.19.5/consul-template_0.19.5_linux_amd64.tgz \
    && tar xfv consul-template_0.19.5_linux_amd64.tgz \
    && mv consul-template /usr/bin/ \
    && mkdir -p /etc/nginx/ssl/ \
    && mkdir -p  /etc/letsencrypt/live/cloud1.kristianpaul.org/ \
    && openssl dhparam -out /etc/nginx/ssl/dhparams.pem 2048

COPY run.sh /run.sh
COPY janus.tpl /janus.tpl
COPY fullchain.pem  /etc/letsencrypt/live/cloud1.kristianpaul.org/fullchain.pem
COPY privkey.pem  /etc/letsencrypt/live/cloud1.kristianpaul.org/privkey.pem

EXPOSE 80
EXPOSE 443

CMD  /run.sh
