#!/bin/bash

#Enable admin api
sed -i "s/admin_http = no/admin_http = yes/g" /opt/janus/etc/janus/janus.transport.http.cfg
sed -i "s/8088/80/g" /opt/janus/etc/janus/janus.transport.http.cfg

myip=$(curl ifconfig.co/ip)
sed -i "s/;stun_server/stun_server/g" /opt/janus/etc/janus/janus.cfg
sed -i "s/;stun_port/stun_port/g" /opt/janus/etc/janus/janus.cfg
sed -i "s/;rtp_port_range/rtp_port_range/g" /opt/janus/etc/janus/janus.cfg
sed -i "s/;nat_1_1_mapping = 1.2.3.4/nat_1_1_mapping = $myip/g" /opt/janus/etc/janus/janus.cfg

#Set free RTP port seat
for i in $(seq 20000 20100)
do
  seat=$(curl  -s  http://consul:8500/v1/kv/rtp/$i | jq .[].Value | base64 -di)
  if [ "$seat" == "avaliable" ]
  then
    echo "It's there!"
    curl -s --request PUT --data "busy" http://consul:8500/v1/kv/rtp/$i
    echo $i
    sed -i "s/20000-40000/$i/g" /opt/janus/etc/janus/janus.*
    break
  fi
done

#Run with admin api enabled
screen -S janus -d -m
screen -r janus -X stuff $'/opt/janus/bin/janus  -C /opt/janus/etc/janus/janus.cfg -A -L /tmp/janus.log\n'
# Get your self a Token
http POST localhost:7088/admin/ admin_secret=janusoverlord transaction=FromLocalhost janus=add_token token=mytoken --ignore-stdin
tail -F /tmp/janus.log
