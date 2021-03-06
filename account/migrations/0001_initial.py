# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-29 16:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='user',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('openId', models.CharField(max_length=32)),
                ('nickName', models.CharField(max_length=32)),
                ('header', models.CharField(max_length=32)),
                ('address', models.TextField()),
                ('addDate', models.DateTimeField()),
                ('loginDate', models.DateTimeField()),
                ('six', models.IntegerField(choices=[(1, '\u7537'), (2, '\u5973')], verbose_name='\u6027\u522b')),
            ],
        ),
    ]
