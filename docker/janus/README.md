# janus-cluster
## Build
```bash
docker build -t janus-gateway:v0.1 .
```
## Upload janus container to AWS container registry
# Required once
```bash
aws ecr create-repository --repository-name janus
```
# Pushing every release
```bash
docker tag janus-gateway:v0.01 207142521427.dkr.ecr.us-east-1.amazonaws.com/janus
aws ecr get-login --no-include-email
```
# Copy from previous command
```bash
docker login -u AWS -p eyJwY...
docker push 207142521427.dkr.ecr.us-east-1.amazonaws.com/janus
```
