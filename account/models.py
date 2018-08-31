# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

import sys
reload(sys)
sys.setdefaultencoding("utf8")


# Create your models here.
class myUser(models.Model):
    openId = models.CharField(max_length=32)
    nickName = models.CharField(max_length=32)
    header = models.CharField(max_length=256)
    city = models.TextField()
    addDate = models.DateTimeField()
    loginDate = models.DateTimeField(null=True)
    six_list = (
        (1, "男"),
        (2, "女"),
    )
    six = models.IntegerField(choices=six_list, verbose_name="性别")  # 以下拉框的形式在页面展示

    def __str__(self):
        return self.nickName
