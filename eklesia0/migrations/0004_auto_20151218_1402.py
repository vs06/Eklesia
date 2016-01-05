# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('eklesia0', '0003_auto_20151124_1441'),
    ]

    operations = [
        migrations.CreateModel(
            name='FluxodeCaixa',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('tipo', models.SmallIntegerField(choices=[(1, 'entrada'), (2, 'saida')])),
                ('quantidade', models.DecimalField(max_digits=12, decimal_places=2)),
                ('data', models.DateField(blank=True, null=True)),
                ('descricao', models.TextField()),
            ],
            options={
                'managed': True,
                'db_table': 'fluxodecaixa',
            },
        ),
    ]
