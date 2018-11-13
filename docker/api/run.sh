#!/bin/sh

pip install klein
cd / && PYTHONPATH=. twistd -n web --class=helloworld.resource
