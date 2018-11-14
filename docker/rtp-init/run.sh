#!/bin/bash

#Run rtp seats initialization
for i in $(seq 20000 20100); do curl -s --request PUT     --data  "avaliable"   http://consul:8500/v1/kv/rtp/$i; done
while true; do echo "I'm done here, but cant die"; sleep 1d; done

# Do not run this or will kill consul, needs to be done as transaction
#while true
#do
#    avaliable=0
#    busy=0
#    for i in $(seq 20000 20100)
#    do
#      seat=$(curl  -s  http://consul:8500/v1/kv/rtp/$i | jq .[].Value | base64 -di)
#      if [ "$seat" == "avaliable" ]
#      then
#        avaliable=$((avaliable+1))
#      fi
#    done
#    
#    echo -n aval:$avaliable
#    echo  busy:$busy
#    sleep 5
#done
