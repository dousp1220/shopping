# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import json

from datetime import datetime
from django.core import serializers
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from dss.Serializer import serializer

from account.annotation import my_login_required, get, response_failure
from models import *

import sys

reload(sys)
sys.setdefaultencoding("utf-8")


# Create your views here.
@my_login_required
@get
def getType(request):
    types = productType.objects.all().order_by('sortIndex')
    data = serializer(types, datetime_format="string", foreign=True)
    json_string = json.dumps(data, ensure_ascii=False)

    return HttpResponse(json_string, content_type='application/json; charset=utf-8')


@my_login_required
@get
def getProductItem(request):
    if request.GET.has_key('productType'):
        items = productItem.objects.filter(productType=request.GET['productType']).values('id', 'productName', 'productImage', 'price')
        data = serializer(items, datetime_format="string", foreign=False)
        json_string = json.dumps(data, ensure_ascii=False)
    else:
        types = productType.objects.all().order_by('sortIndex')
        strTemp = {}
        for dType in types:
            items = productItem.objects.filter(productType=dType.id).values('id', 'productName', 'productImage', 'price')
            data = serializer(items, datetime_format="string", foreign=False)
            key = 'key_' + str(dType.id)
            strTemp[key] = data
        json_string = json.dumps(strTemp, ensure_ascii=False)

    return HttpResponse(json_string, content_type='application/json; charset=utf-8')


@my_login_required
@get
def getProductItemDetail(request):
    if request.GET.has_key('productItemId'):
        items = productItem.objects.filter(id=request.GET['productItemId'])
        data = serializer(items, datetime_format="string", foreign=False)
        json_string = json.dumps(data, ensure_ascii=False)
        return HttpResponse(json_string, content_type='application/json; charset=utf-8')
    else:
        return response_failure("参数不匹配！")


@my_login_required
@get
def getAddress(request):
    addrs = address.objects.filter(user=request.jwt_user)
    data = serializer(addrs, datetime_format="string", foreign=False)
    json_string = json.dumps(data, ensure_ascii=False)
    return HttpResponse(json_string, content_type='application/json; charset=utf-8')


@my_login_required
@get
def getDefaultAddress(request):
    addrs = address.objects.filter(user=request.jwt_user, idDefault=True)
    data = serializer(addrs, datetime_format="string", foreign=False)
    json_string = json.dumps(data, ensure_ascii=False)
    return HttpResponse(json_string, content_type='application/json; charset=utf-8')

