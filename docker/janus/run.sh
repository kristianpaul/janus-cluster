#!/bin/bash

#Enable admin api
sed -i "s/admin_http = false/admin_http = true/g" /opt/janus/etc/janus/janus.transport.http.jcfg

myip=$(curl -4 ifconfig.co/ip)
sed -i "s/#stun_server/stun_server/g" /opt/janus/etc/janus/janus.jcfg
sed -i "s/#stun_port/stun_port/g" /opt/janus/etc/janus/janus.jcfg
sed -i "s/#rtp_port_range/rtp_port_range/g" /opt/janus/etc/janus/janus.jcfg
sed -i "s/#nat_1_1_mapping = 1.2.3.4/nat_1_1_mapping = $myip/g" /opt/janus/etc/janus/janus.jcfg

#Set RTP port
sed -i "s/20000-40000/20000/g" /opt/janus/etc/janus/janus.*

#Run with admin api enabled
screen -S janus -d -m
screen -r janus -X stuff $'/opt/janus/bin/janus  -C /opt/janus/etc/janus/janus.jcfg -A -L /tmp/janus.log\n'
# Get your self a Token
http POST localhost:7088/admin/ admin_secret=janusoverlord transaction=FromLocalhost janus=add_token token=mytoken --ignore-stdin
tail -F /tmp/janus.log
