# running on aws

# install ecs cli tool

sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest

sudo chmod +x /usr/local/bin/ecs-cli

# Configure cluster

ecs-cli configure --cluster janus-ecsCluster-DDDDD111111 --region us-east-1

# Deploy on the aws cloud

ecs-cli compose --verbose up --cluster janus-ecsCluster-DDDDD11111

ecs-cli compose up --cluster janus-ecsCluster-DDDDDD1111

ecs-cli ps

ecs-cli down

#deploy on local docker host acting as swarm local

sudo docker-compose -f docker-compose-core.yml up -d
sudo bash 
