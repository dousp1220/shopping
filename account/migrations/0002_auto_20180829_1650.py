# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-29 16:50
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='user',
            new_name='myUser',
        ),
    ]
