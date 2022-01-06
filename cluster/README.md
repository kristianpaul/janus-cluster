This is the compute cluster for ECS/Docker, you can use it to deploy an cluster on spot instances and save upto 90% in costs or balance the spot fleet request in order to have both on-demand and spot prices.

This cluster eventually needs to acepts input from the awslabs ecs spot lambda function that tracks the spot price status.

# Looking around
```bash
aws cloudformation list-stacks

aws cloudformation list-stacks --output text
```

# Create stack   
```bash
aws cloudformation create-stack --stack-name janus --template-body file://janus-ecs-ec2-spot-fleet.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=keyName,ParameterValue=ecs22
```
# Update stack
```bash
aws cloudformation update-stack --stack-name janus --template-body file://janus-ecs-ec2-spot-fleet.yaml  --parameters ParameterKey=keyName,ParameterValue=ecs22 --capabilities CAPABILITY_NAMED_IAM
```

# Delete when done for testing
```bash
aws cloudformation delete-stack --stack-name janus
```
# Deploy locally with docker + swarm local

```bash
docker-compose  up -d  --scale janus=3

docker-compose ps
```

Take it down:

```bash
docker-compose down
```

# Deploy remotelly with ecs-cli

Required once and or if your ecs cluster name changes
```bash
ecs-cli configure -c janus-ecsCluster-XXXXXXXXXX -r us-east-1

ecs-cli compose --verbose up --cluster janus-ecsCluster-XXXXXXXXX

ecs-cli compose down --cluster janus-ecsCluster-XXXXXXXX
```
# Service discovery
Janus micro service gets register on consul automatically, it can be visited via UI port 8500 
```bash
curl -s  http://localhost:8500/v1/catalog/service/janus-gateway-8088
curl -s http://localhost:8500/v1/catalog/service/janus-gateway-8088 | grep port -i
```
# Load balancer 

UI It is avalaible on port 8080

Traefik automatically discovers and registers backends to load balancer
