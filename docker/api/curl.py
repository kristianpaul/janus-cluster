import requests
import json
import pprint
import random


response = requests.get('http://localhost:8500/v1/catalog/service/janus-gateway-80')

input_dict = json.loads(response.text)

endpoint_index_len = len(input_dict)

print (endpoint_index_len-1)

some_endpoint_port_index = (random.randint(0, endpoint_index_len)-1)

print ("https://janus.webcall.ninjapbx.com/janus-gateway-80janus_"+json.dumps(input_dict[some_endpoint_port_index][u'ServicePort']))
