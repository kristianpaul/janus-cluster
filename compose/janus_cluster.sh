export read_only capacity=$(seq 1 3)
export read_only max_capacity=$(seq 1 10)

if [ "$1" ==  "down" ]; then
	for i in $capacity; do export PROJECT=myproj_${i} && docker-compose -p $PROJECT -f docker-compose-janus.yml down; done
	docker-compose -f docker-compose-core.yml down
fi

if [ "$1" ==  "up" ]; then
	docker-compose -f docker-compose-core.yml up -d
	for i in $capacity; do export PROJECT=myproj_${i} && docker-compose -p $PROJECT -f docker-compose-janus.yml up -d ; done
fi

if [ "$1" ==  "update" ]; then
	docker-compose -f docker-compose-core.yml up -d
	for i in $max_capacity; do export PROJECT=myproj_${i} && docker-compose -p $PROJECT -f docker-compose-janus.yml down; done
	for i in $capacity; do export PROJECT=myproj_${i} && docker-compose -p $PROJECT -f docker-compose-janus.yml up -d ; done
fi
