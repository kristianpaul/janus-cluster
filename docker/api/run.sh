#!/bin/sh

pip install klein requests
cd / && PYTHONPATH=. twistd -n web --class=janus_url_generator.resource
