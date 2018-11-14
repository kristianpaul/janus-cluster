import requests
import json
import pprint
import random
from klein import resource, route

@route('/')
def hello(request):
    return 'I am the root page!'


@route('/v0.1/janus_url')
def janus_url(request):
    response = requests.get('http://consul:8500/v1/catalog/service/janus-gateway-80')
    input_dict = json.loads(response.text)
    endpoint_index_len = len(input_dict)
    some_endpoint_port_index = (random.randint(0, endpoint_index_len-1))
    return ("https://janus.webcall.ninjapbx.com/janus-gateway-80janus_"+json.dumps(input_dict[some_endpoint_port_index][u'ServicePort']))
