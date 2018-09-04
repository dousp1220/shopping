# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin


# Register your models here.
from shopping.models import *


class productTypeAdmin(admin.ModelAdmin):
    list_display = ('typeName', 'sortIndex')
    search_fields = ['typeName']


class productItemAdmin(admin.ModelAdmin):
    list_display = ('productName', 'price', 'productImage', 'desc', 'isSpecialPrice', 'newPrice', 'productType')
    search_fields = ['productName']


class shoppingCartRelaAdmin(admin.ModelAdmin):
    list_display = ('count', 'productItem')
    search_fields = ['productItem']


class addressAdmin(admin.ModelAdmin):
    list_display = ('name', 'phone', 'addrDetail', 'user')
    search_fields = ['name', 'phone']


class orderFromAdmin(admin.ModelAdmin):
    list_display = ('orderState', 'stateLog', 'discount', 'realDiscount', 'remarks', 'orderDetail', 'address', 'user')
    search_fields = ['orderState', 'user']


admin.site.register(productType, productTypeAdmin)
admin.site.register(productItem, productItemAdmin)
# admin.site.register(shoppingCart)
admin.site.register(shoppingCartRela, shoppingCartRelaAdmin)
admin.site.register(address, addressAdmin)
admin.site.register(orderFrom, orderFromAdmin)
