# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('eklesia0', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Culto',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('data', models.DateField(blank=True, null=True)),
                ('inicio', models.TimeField(blank=True, null=True)),
                ('fim', models.TimeField(blank=True, null=True)),
                ('presentes', models.IntegerField(blank=True, null=True)),
                ('dizimos', models.FloatField(blank=True, null=True)),
                ('ofertas', models.FloatField(blank=True, null=True)),
                ('arrecadacao_total', models.FloatField(blank=True, null=True)),
                ('observacoes', models.TextField(blank=True, null=True)),
            ],
            options={
                'managed': True,
                'db_table': 'culto',
            },
        ),
        migrations.AlterModelOptions(
            name='cargo',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='cidade',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='escolaridade',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='estado',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='estadocivil',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='membro',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='pessoa',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='religioes',
            options={'managed': True},
        ),
        migrations.AddField(
            model_name='culto',
            name='abertura',
            field=models.ForeignKey(blank=True, to='eklesia0.Pessoa', related_name='+', null=True),
        ),
        migrations.AddField(
            model_name='culto',
            name='diaconos',
            field=models.ManyToManyField(to='eklesia0.Membro', blank=True, related_name='+', null=True),
        ),
        migrations.AddField(
            model_name='culto',
            name='musicos',
            field=models.ManyToManyField(to='eklesia0.Membro', blank=True, related_name='+', null=True),
        ),
        migrations.AddField(
            model_name='culto',
            name='pastores_presentes',
            field=models.ManyToManyField(to='eklesia0.Membro', blank=True, related_name='+', null=True),
        ),
        migrations.AddField(
            model_name='culto',
            name='pregador',
            field=models.ForeignKey(blank=True, to='eklesia0.Pessoa', related_name='+', null=True),
        ),
    ]
