# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-29 17:29
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('account', '0004_auto_20180829_1729'),
    ]

    operations = [
        migrations.CreateModel(
            name='address',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=16)),
                ('phone', models.CharField(max_length=16)),
                ('addrDetail', models.CharField(max_length=256)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.myUser')),
            ],
        ),
        migrations.CreateModel(
            name='orderFrom',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('orderState', models.IntegerField()),
                ('stateLog', models.TextField()),
                ('discount', models.DecimalField(decimal_places=2, max_digits=10)),
                ('remarks', models.TextField()),
                ('realDiscount', models.DecimalField(decimal_places=2, max_digits=10)),
                ('orderDetail', models.TextField()),
                ('address', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopping.address')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.myUser')),
            ],
        ),
        migrations.CreateModel(
            name='productItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productName', models.CharField(max_length=32)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('product_image', models.CharField(max_length=256)),
                ('desc', models.TextField()),
                ('isSpecialPrice', models.BooleanField(default=False)),
                ('newPrice', models.DecimalField(decimal_places=2, max_digits=10)),
            ],
        ),
        migrations.CreateModel(
            name='productType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sortIndex', models.IntegerField()),
                ('typeName', models.CharField(max_length=16)),
            ],
        ),
        migrations.CreateModel(
            name='shoppingCart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='account.myUser')),
            ],
        ),
        migrations.CreateModel(
            name='shoppingCartRela',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('count', models.PositiveIntegerField()),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopping.shoppingCart')),
                ('productItem', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopping.productItem')),
            ],
        ),
        migrations.AddField(
            model_name='productitem',
            name='productType',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopping.productType'),
        ),
    ]
