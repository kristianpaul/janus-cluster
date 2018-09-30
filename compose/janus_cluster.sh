if [ "$1" ==  "down" ]; then
	for i in $(seq 1 3); do export PROJECT=myproj_${i} && docker-compose -p $PROJECT -f docker-compose-janus.yml down; done
fi

if [ "$1" ==  "up" ]; then
	for i in $(seq 1 3); do export PROJECT=myproj_${i} && docker-compose -p $PROJECT -f docker-compose-janus.yml up -d ; done
fi
