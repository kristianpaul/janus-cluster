FROM debian:stretch-slim

RUN  set -x \
    && apt-get update && apt-get install -y curl jq 

COPY run.sh /run.sh

CMD  /run.sh
