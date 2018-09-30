export read_only capacity=$(seq 1 3)

if [ "$1" ==  "down" ]; then
	for i in $capacity; do export PROJECT=myproj_${i} && docker-compose -p $PROJECT -f docker-compose-janus.yml down; done
	docker-compose -f docker-compose-core.yml down
fi

if [ "$1" ==  "up" ]; then
	docker-compose -f docker-compose-core.yml up -d
	for i in $capacity; do export PROJECT=myproj_${i} && docker-compose -p $PROJECT -f docker-compose-janus.yml up -d ; done
fi
