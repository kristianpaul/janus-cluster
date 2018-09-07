This is the compute cluster for ECS/Docker, you can use it to deploy an cluster on spot instances and save upto 90% in costs or balance the spot fleet request in order to have both on-demand and spot prices.

This cluster eventually needs to acepts input from the awslabs ecs spot lambda function that tracks the spot price status.

# Looking around
aws cloudformation list-stacks

aws cloudformation list-stacks --output text

# Create stack   
aws cloudformation create-stack --stack-name janus --template-body file://janus-ecs-ec2-spot-fleet.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=keyName,ParameterValue=ecs22

# Update stack
aws cloudformation update-stack --stack-name janus --template-body file://janus-ecs-ec2-spot-fleet.yaml  --parameters ParameterKey=keyName,ParameterValue=ecs22 --capabilities CAPABILITY_NAMED_IAM

# Delete when done for testing
aws cloudformation delete-stack --stack-name janus
