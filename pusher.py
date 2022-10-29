import requests
import json

from decouple import config

url = "https://fcm.googleapis.com/fcm/send"
Key = "AAAAHNxCeSA:APA91bF3uv0RNKom-aSwEz0U_t5PCpLEdZfWdjEhLl0z7eNRhQw0sUedbzifnG5dhOc3PnRTXqFqC3rLOobQTuhfS55v3PQDG5ACiUPPJfdrLfgUxEXH4GMbu0I8EQE-DNaGYq6Qjrlb"

def send_message(users_token, title, body):
    for token in users_token:
        payload = json.dumps({
            "to": token,
            "priority": "high",
            "notification": {
                "title": title,
                "body": body
            }
        })
        headers = {
            'Authorization': f'key={Key}',
            'Content-Type': 'application/json'
        }

        response = requests.request("POST", url, headers=headers, data=payload)

        print(response.text)
