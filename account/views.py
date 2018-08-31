# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import json

import datetime
from django.http import HttpResponse

# Create your views here.
from django.views.decorators.csrf import csrf_exempt
from weixin import WXAPPAPI
from weixin.lib.wxcrypt import WXBizDataCrypt

from account.django_jwt_session_auth import jwt_login
from account.models import myUser

# WEIXIN_APPID = "wxb71fe6e43de3cbf2"
# WEIXIN_APPSECRET = "092a1f3423f5f97af3aa330ccf00b262"
WEIXIN_APPID = "wx7e3812b2e25ec2b5"
WEIXIN_APPSECRET = "6a7c0bb5ec59d219a50b34c4fa2c5445"


@csrf_exempt
def onAppLogin(request):
    if request.method == "POST":
        code = request.POST.get("code")
        encrypted_data = request.POST.get("encryptedData")
        iv = request.POST.get("iv")

        api = WXAPPAPI(appid=WEIXIN_APPID, app_secret=WEIXIN_APPSECRET)
        session_info = api.exchange_code_for_session_key(code=code)

    # 获取session_info 后

    session_key = session_info.get('session_key')
    crypt = WXBizDataCrypt(WEIXIN_APPID, session_key)

    # encrypted_data 包括敏感数据在内的完整用户信息的加密数据
    # iv 加密算法的初始向量
    # 这两个参数需要js获取

    user_info = crypt.decrypt(encrypted_data, iv)
    openId = user_info.get("openId")

    try:
        user1 = myUser.objects.get(openId=openId)
        user1.loginDate = datetime.datetime.strftime(datetime.datetime.now(), '%Y-%m-%d %H:%M:%S')
        user1.nickName = user_info.get('nickName')  # 保存昵称
        user1.header = user_info.get("avatarUrl")  # 保存头像
        user1.city = user_info.get("country") + ":::" + user_info.get("province") + ":::" + user_info.get(
            "city")  # 保存地区
        user1.save()
    except:
        user = myUser()
        user.openId = openId
        user.nickName = user_info.get('nickName')  # 保存昵称
        user.header = user_info.get("avatarUrl")  # 保存头像
        user.city = user_info.get("country") + ":::" + user_info.get("province") + ":::" + user_info.get(
            "city")  # 保存地区
        user.addDate = datetime.datetime.strftime(datetime.datetime.now(), '%Y-%m-%d %H:%M:%S')
        user.six = user_info.get("gender")
        user.loginDate = datetime.datetime.strftime(datetime.datetime.now(), '%Y-%m-%d %H:%M:%S')
        user.save()
        user1 = user

    token = jwt_login(user1, request, expire=60 * 60 * 24 * 7)
    user_info['token'] = token
    json_string = json.dumps(user_info)

    return HttpResponse(json_string)


def hello(request):
    json_string = json.dumps({"data": "你好"})
    return HttpResponse(json_string)
