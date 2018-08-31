# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from account.models import myUser


class userAdmin(admin.ModelAdmin):
    # fieldsets = [
    #     (None,               {'fields': ['name']}),
    #     (None,               {'fields': ['ip']}),
    # ]
    list_display = ('openId', 'nickName', 'header', 'city', 'addDate', 'loginDate', 'six') #add more columns.
    # list_filter = ['ip'] #add filter function.
    search_fields = ['nickName']


admin.site.register(myUser, userAdmin)