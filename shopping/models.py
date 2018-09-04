# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from account.models import myUser
import sys

reload(sys)
sys.setdefaultencoding("utf8")


class productType(models.Model):
    id = models.AutoField(primary_key=True)
    sortIndex = models.IntegerField()
    typeName = models.CharField(max_length=16)

    def __str__(self):
        return self.typeName


class productItem(models.Model):
    productName = models.CharField(max_length=32)
    price = models.DecimalField(decimal_places=2, max_digits=10)
    # productImage = models.CharField(max_length=256)
    imgHeight = models.PositiveIntegerField(default=75)
    imgWidth = models.PositiveIntegerField(default=75)
    productImage = models.ImageField(upload_to="images", height_field='imgHeight', width_field='imgWidth')
    desc = models.TextField(null=True)
    isSpecialPrice = models.BooleanField(default=False)
    newPrice = models.DecimalField(decimal_places=2, max_digits=10, default=None)
    productType = models.ForeignKey(productType)

    def __str__(self):
        return self.productName


class shoppingCartRela(models.Model):
    count = models.PositiveIntegerField(default=0)
    user = models.ForeignKey(myUser, blank=True, null=True)
    productItem = models.ForeignKey(productItem)

    # def __str__(self):
    #     return self.user.nickName + "购物车"


class address(models.Model):
    name = models.CharField(max_length=16)
    phone = models.CharField(max_length=16)
    addrDetail = models.CharField(max_length=256)
    user = models.ForeignKey(myUser, blank=True, null=True)
    isDefault = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class orderFrom(models.Model):
    # 0:关闭 1:待付款2：已付款  3：已发货  4：已收货  5：完成
    orderState_list = (
        (0, "关闭"),
        (1, "待付款"),
        (2, "已付款"),
        (3, "已发货"),
        (4, "已收货"),
        (5, "完成"),
    )
    orderState = models.IntegerField(choices=orderState_list, verbose_name="订单状态")  # 以下拉框的形式在页面展示
    # orderState = models.IntegerField()
    orderDateTime = models.DateTimeField(null=True)
    stateLog = models.TextField()
    discount = models.DecimalField(decimal_places=2, max_digits=10)
    remarks = models.TextField(null=True)
    realDiscount = models.DecimalField(decimal_places=2, max_digits=10)
    orderDetail = models.TextField()
    address = models.ForeignKey(address)
    user = models.ForeignKey(myUser, blank=True, null=True)
