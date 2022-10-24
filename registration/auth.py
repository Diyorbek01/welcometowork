import random
import string

from django.contrib.auth import authenticate

from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view
from rest_framework.response import Response
import requests
import json

from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST

from client.user.models import UserToken, User


def send_sms(phone_number, code):
    url = "http://91.204.239.44/broker-api/send"

    payload = json.dumps({
        "messages": [
            {
                "recipient": phone_number,
                "message-id": "abc000000001",
                "sms": {
                    "originator": "3700",
                    "content": {
                        "text": f"Sizning tasdiqlash kodingiz: {code}"
                    }
                }
            }
        ]
    })
    headers = {
        'Authorization': 'Basic d2VsY29tdG93b3JrOkg2Wmt4NWFNOEE0Yw==',
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", url, headers=headers, data=payload)

    return response.text


def random_string(digit_count):
    str1 = ''.join((random.choice(string.digits) for x in range(digit_count)))

    sam_list = list(str1)  # it converts the string to list.
    random.shuffle(sam_list)  # It uses a random.shuffle() function to shuffle the string.
    final_string = ''.join(sam_list)
    return final_string


@api_view(['POST'])
def login(request):
    username = request.data["username"]
    password = request.data["password"]

    if User.objects.filter(username=username, password=password).exists():
        user = User.objects.get(username=username)
        print(user)
        token, created = Token.objects.get_or_create(user=user)
        data = dict(
            user_id=user.id,
            token=token.key,
            role=user.role,
        )
        return Response(data, status=200)
    else:
        return Response({"message": "User doesn't exist"}, status=400)


@api_view(['POST'])
def login_admin(request):
    username = request.data["username"]
    password = request.data["password"]
    if User.objects.filter(username=username, password=password, is_superuser=True).exists():
        user = User.objects.get(username=username)
        token, created = Token.objects.get_or_create(user=user)
        data = dict(
            user={
                "id": user.id,
                "full_name": user.get_full_name(),
                "avatar": None
            },
            token=token.key,
        )
        if user.avatar:
            data['user']['avatar'] = user.avatar.url
        return Response(data, status=200)
    else:
        return Response({"message": "User doesn't exist"}, status=400)


@api_view(['POST'])
def chek_otp(request):
    code = request.data['code']
    role = request.data['role']
    token = UserToken.objects.all().last().token
    phone_number = UserToken.objects.all().last().phone_number
    if code == token:
        user, created = User.objects.get_or_create(
            phone_number=phone_number,
            username=phone_number,
            role=role,
        )
        token_, create = Token.objects.get_or_create(user=user)
        return Response({
            "message:": "Success",
            "user_id": user.id,
            "role": user.role,
            "token": token_.key,
        }, status=HTTP_200_OK)
    else:
        return Response({"message:": "Invalid sms code"}, status=HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def create_password(request):
    user_id = request.data['user_id']
    password = request.data['password']
    user = User.objects.get(id=user_id)
    user.password = password
    user.save()
    return Response({"message:": "Password created"}, status=HTTP_200_OK)


@api_view(['POST'])
def send_reset_password(request):
    phone_number = request.data['phone_number']
    if User.objects.filter(phone_number=phone_number).exists():
        user = User.objects.filter(phone_number=phone_number).last()
        code = random_string(4)
        UserToken.objects.create(token=code, phone_number=phone_number)
        token_, create = Token.objects.get_or_create(user=user)
        result = send_sms(phone_number, code)
        return Response({
            "message": result,
            "code": code,
            "user_id": user.id,
            "role": user.role,
            "token": token_.key
        }, 200)
    else:
        return Response({"message": "Phone number not found"}, 400)


@api_view(['POST'])
def reset_password(request):
    phone_number = request.data['phone_number']
    password = request.data['password']

    # User.objects.filter(phone_number=phone_number).update(new_password=password)
    try:
        user = User.objects.get(phone_number=phone_number)
        user.password = password
        user.save()
        return Response({"message": "Password changed"}, 200)
    except:
        return Response({"message": "Something went wrong!"}, 400)


@api_view(['POST'])
def send_sms_register(request):
    phone_number = request.data['phone_number']
    if User.objects.filter(phone_number=phone_number).exists():
        return Response({"message": "This phone number already exists"}, 400)
    else:
        code = random_string(4)
        result = send_sms(phone_number, code)

        data = UserToken.objects.create(
            token=code,
            phone_number=phone_number
        )
        return Response({"message": result, "code": code}, 200)
