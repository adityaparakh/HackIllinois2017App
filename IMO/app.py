from flask import Flask
from flask import jsonify
import requests
from flask import abort
from flask import request
import base64
import os

api_key = "51e36c855403469fbc999e1e8e15f196"
api_secret = "FCD2487563F203149608E29BDA2E047972BF3104B68B79FA9E5CA0B7C62E7888"
base_url = "https://ipl-nonproduction-customer_validation.e-imo.com/api/v3/actions/categorize"
auth = api_key + ":" + api_secret
headers = {'Authorization': "Basic " + base64.b64encode(auth).decode('utf-8'), 'Content-Type' : 'application/json'}

app = Flask(__name__)

@app.route('/empdb/employee',methods=['POST'])
def allEmp():
    body = { "Problems": [{"FreeText": x} for x in request.json["query"]]}
    r = requests.post(base_url, json=body, headers=headers)
    x = r.json()
    code = x['Categories'][0]['Code']
    name =  x['Categories'][0]['Name']
    title = x['Categories'][0]['Problems'][0]['Details']['IMOTitle']
    return jsonify({
        'code':code,
        'name':name,
        'title':title
    })

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
