import requests
import json

def handler(event, context):
    print("welcome to the terraform -razzkumar ")
    print("event--\n", event)
    print("context--\n", context)

    response = requests.get('https://api.github.com')

    return json.loads(response.text)
