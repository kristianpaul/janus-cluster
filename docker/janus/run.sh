#!/bin/sh

#Enable admin api
sed -i "s/admin_http = no/admin_http = yes/g" /opt/janus/etc/janus/janus.transport.http.cfg
sed -i "s/8088/80/g" /opt/janus/etc/janus/janus.transport.http.cfg

#Run with admin api enabled
/opt/janus/bin/janus  -C /opt/janus/etc/janus/janus.cfg -A
