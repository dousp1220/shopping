# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import json

from datetime import datetime
from django.core import serializers
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from dss.Serializer import serializer

from account.annotation import my_login_required, get, response_failure, post, response_success
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
    if 'productType' in request.GET:
        items = productItem.objects.filter(productType=request.GET['productType'])
        data = serializer(items, datetime_format="string", include_attr=['id', 'productName', 'productImage', 'price'],
                          foreign=False)
        json_string = json.dumps(data, ensure_ascii=False)
    else:
        types = productType.objects.all().order_by('sortIndex')
        strTemp = {}
        for dType in types:
            items = productItem.objects.filter(productType=dType.id)
            data = serializer(items, datetime_format="string",
                              include_attr=['id', 'productName', 'productImage', 'price'], foreign=False)
            key = 'key_' + str(dType.id)
            strTemp[key] = data
        json_string = json.dumps(strTemp, ensure_ascii=False)

    return HttpResponse(json_string, content_type='application/json; charset=utf-8')


@my_login_required
@get
def getProductItemDetail(request):
    if 'productItemId' in request.GET:
        items = productItem.objects.get(id=request.GET['productItemId'])
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


@my_login_required
@post
def addAddress(request):
    addr = address()
    addr.user = request.jwt_user
    addr.name = request.POST['name']
    addr.phone = request.POST['phone']
    addr.addrDetail = request.POST['addrDetail']
    if list(address.object.filter(user=request.jwt_user)).count() == 0:
        addr.isDefault = True
    else:
        addr.isDefault = False
    addr.save()
    return response_success("地址添加成功！")


@my_login_required
@post
def updateAddress(request):
    addr = address.objects.get(id=request.POST['addrId'])
    if 'name' in request.POST:
        addr.name = request.POST['name']
    if 'phone' in request.POST:
        addr.phone = request.POST['phone']
    if 'addrDetail' in request.POST:
        addr.phone = request.POST['addrDetail']

    addr.save()
    return response_success("地址修改成功！")


@my_login_required
@get
def getShoppingCart(request):
    relas = shoppingCartRela.objects.filter(user=request.jwt_user)
    data = serializer(relas, datetime_format="string", foreign=True,
                      exclude_attr=['user', 'user_id', 'productType', 'imgWidth', 'imgHeight', 'productItem_id'])
    json_string = json.dumps(data, ensure_ascii=False)
    return HttpResponse(json_string, content_type='application/json; charset=utf-8')


@my_login_required
@post
def addShoppingCart(request):
    productItemId = request.POST['productItemId']
    count = request.POST['count']
    (rela, created) = shoppingCartRela.objects.get_or_create(user=request.jwt_user,
                                                             productItem=productItem.objects.get(id=productItemId))
    if created:
        rela.count = int(count)
    else:
        rela.count = rela.count + int(count)
    rela.save()
    return response_success('加入购物车成功！')


# 修改购物车
@my_login_required
@post
def updateShoppingCart(request):
    productItemId = request.POST['productItemId']
    count = request.POST['count']
    rela = shoppingCartRela.objects.get(user=request.jwt_user, productItem=productItem.objects.get(id=productItemId))
    if count == 0:
        rela.delete()
        return response_success('商品从购物车删除成功！')
    else:
        rela.count = count
        return response_success('商品数量更改成功！')


# 下单
@my_login_required
@post
def makeOrder(request):
    order = orderFrom()
    order.user = request.jwt_user
    isCart = request.POST['isCart']
    order.orderDetail = request.POST['orderDetail']
    order.address = request.POST['address']
    order.discount = request.POST['discount']
    order.realDiscount = request.POST['realDiscount']
    order.remarks = request.POST['remarks']
    order.orderDateTime = datetime.now()
    order.orderState = 1  # 待付款
    stateLog = {}
    stateLog.state_1 = order.orderDateTime
    order.stateLog = json.dumps(stateLog, ensure_ascii=False)
    order.save()

    if isCart:
        detailItem = json.loads(order.orderDetail, encoding='utf-8')
        for item in detailItem:
            shoppingCartRela.objects.filter(user=request.jwt_user,
                                            productItem=productItem.objects.get(id=item.productItemId)).delete()

    return response_success('下单成功！')


@my_login_required
@post
def payment(request):
    orderId = request.POST['orderId']
    order = orderFrom.objects.get(id=orderId)
    order.orderState = 2  # 已付款
    stateLog = json.loads(order.stateLog)
    stateLog.state_2 = datetime.now()
    order.stateLog = json.dumps(stateLog, ensure_ascii=False)
    order.save()
    return response_success('支付成功！')
