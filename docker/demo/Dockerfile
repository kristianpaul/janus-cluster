FROM debian:stretch-slim

RUN  set -x \
    && apt-get update && apt-get install -y nginx wget python vim git\
    && cd /var/www/html/ \
    && git clone https://github.com/meetecho/janus-gateway.git \
    && mkdir -p /etc/nginx/ssl/ \
    && mkdir -p  /etc/letsencrypt/live/webcall.ninjapbx.com/ \
    && openssl dhparam -out /etc/nginx/ssl/dhparams.pem 2048

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# Basic https site
COPY janustlsdemo  /etc/nginx/sites-enabled/janustlsdemo

COPY fullchain.pem  /etc/letsencrypt/live/webcall.ninjapbx.com/fullchain.pem
COPY privkey.pem   /etc/letsencrypt/live/webcall.ninjapbx.com/privkey.pem
COPY apitlspatch  /var/www/html/janus-gateway/html/apitlspatch

RUN  set -x \
    && cd /var/www/html/janus-gateway/html \
    && git apply apitlspatch

EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
