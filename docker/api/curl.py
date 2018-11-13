import requests
import json
import pprint
import random


response = requests.get('http://localhost:8500/v1/catalog/service/janus-gateway-80')
input_dict = json.loads(response.text) #works
#print json.dumps(input_dict[0][u'ServicePort'])
#print json.dumps(input_dict[1][u'ServicePort'])
#print json.dumps(input_dict[2][u'ServicePort'])
#print json.dumps(len(input_dict))
#for i in  range(0,3):
#print(randint(0, len(input_dict))
endpoint_index_len = len(input_dict)
some_endpoint_port_index = (random.randint(0, endpoint_index_len))

#for i in  range(0, endpoint_index_len):
#    print ("https://janus.webcall.ninjapbx.com/janus-gateway-80janus_"+json.dumps(input_dict[i][u'ServicePort']))
print ("https://janus.webcall.ninjapbx.com/janus-gateway-80janus_"+json.dumps(input_dict[some_endpoint_port_index][u'ServicePort']))

#pp = pprint.PrettyPrinter(indent=4)
#pp.pprint(input_dict)
