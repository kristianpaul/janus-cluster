#!/bin/sh

#Run nginx from consul-temlate
/etc/init.d/nginx start
consul-template -consul-addr=consul:8500 -template "/janus.tpl:/etc/nginx/sites-enabled/default:/etc/init.d/nginx reload" -log-level debug
