# janus-cluster
This eventually will be part of code-build


aws cloudformation list-stacks

aws cloudformation list-stacks --output text

aws cloudformation create-stack --stack-name janus --template-body file://cluster/janus-ecs-ec2-spot-fleet.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=keyName,ParameterValue=ecs22

aws cloudformation update-stack --stack-name janus --template-body file://cluster/janus-ecs-ec2-spot-fleet.yaml  --parameters ParameterKey=keyName,ParameterValue=ecs22 --capabilities CAPABILITY_NAMED_IAM

aws cloudformation delete-stack --stack-name janus
