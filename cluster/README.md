# Create stack   
aws cloudformation create-stack --stack-name janus --template-body file://cluster/janus-ecs-ec2-spot-fleet.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=keyName,ParameterValue=ecs22
# Update stack
aws cloudformation update-stack --stack-name janus --template-body file://cluster/janus-ecs-ec2-spot-fleet.yaml  --parameters ParameterKey=keyName,ParameterValue=ecs22 --capabilities CAPABILITY_NAMED_IAM
