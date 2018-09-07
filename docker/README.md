# janus-cluster
## Build

docker build -t janus-gateway:$(git describe --tags) .

## Upload janus container to AWS container registry
#Required once
aws ecr create-repository --repository-name janus
#Pushing every release
docker tag janus-gateway:v0.01 207142521427.dkr.ecr.us-east-1.amazonaws.com/janus
aws ecr get-login --no-include-email
# Copy from previous command
docker login -u AWS -p eyJwY...
docker push 207142521427.dkr.ecr.us-east-1.amazonaws.com/janus


# running on aws

sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest

sudo chmod +x /usr/local/bin/ecs-cli

ecs-cli configure --cluster janus-ecsCluster-DK9LRLO1RFXR --region us-east-1

ecs-cli compose --verbose up --cluster janus-ecsCluster-MAHIZDFIY18X

ecs-cli compose up --cluster janus-ecsCluster-MAHIZDFIY18X

ecs-cli ps

ecs-cli down
