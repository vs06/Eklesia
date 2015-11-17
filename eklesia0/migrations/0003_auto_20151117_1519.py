# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('eklesia0', '0002_auto_20151117_1454'),
    ]

    operations = [
        migrations.AlterField(
            model_name='culto',
            name='abertura',
            field=models.ForeignKey(related_name='+', db_column='abertura', blank=True, to='eklesia0.Pessoa', null=True),
        ),
        migrations.AlterField(
            model_name='culto',
            name='pregador',
            field=models.ForeignKey(related_name='+', db_column='pregador', blank=True, to='eklesia0.Pessoa', null=True),
        ),
    ]
