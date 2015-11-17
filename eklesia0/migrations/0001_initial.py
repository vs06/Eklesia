# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cargo',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('descricao', models.CharField(blank=True, null=True, max_length=45)),
            ],
            options={
                'db_table': 'cargo',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Cidade',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, null=True, max_length=45)),
            ],
            options={
                'db_table': 'cidade',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Escolaridade',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('descricao', models.CharField(blank=True, null=True, max_length=55)),
            ],
            options={
                'db_table': 'escolaridade',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Estado',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, null=True, max_length=45)),
                ('sigla', models.CharField(blank=True, null=True, max_length=4)),
            ],
            options={
                'db_table': 'estado',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Estadocivil',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('descricao', models.CharField(blank=True, null=True, max_length=45)),
            ],
            options={
                'db_table': 'estadocivil',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Membro',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('pessoa', models.IntegerField(blank=True, null=True)),
                ('data_entrada', models.DateField(blank=True, null=True)),
                ('arrolado_por', models.CharField(blank=True, null=True, max_length=45)),
                ('data_batismo', models.DateField(blank=True, null=True)),
                ('igreja_batismo', models.CharField(blank=True, null=True, max_length=45)),
            ],
            options={
                'db_table': 'membro',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pessoa',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, null=True, max_length=95)),
                ('data_nascimento', models.DateField(blank=True, null=True)),
                ('sexo', models.CharField(blank=True, null=True, max_length=1)),
                ('naturalidade', models.CharField(blank=True, null=True, max_length=45)),
                ('rg', models.CharField(blank=True, null=True, max_length=45)),
                ('cpf', models.CharField(blank=True, null=True, max_length=45)),
                ('profissao', models.CharField(blank=True, null=True, max_length=50)),
                ('endereco', models.CharField(blank=True, null=True, max_length=250)),
                ('cep', models.CharField(blank=True, null=True, max_length=45)),
                ('telefone_residencial', models.CharField(blank=True, null=True, max_length=45)),
                ('telefone_celular', models.CharField(blank=True, null=True, max_length=45)),
                ('email', models.CharField(blank=True, null=True, max_length=150)),
            ],
            options={
                'db_table': 'pessoa',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Religioes',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('descricao', models.CharField(blank=True, null=True, max_length=45)),
            ],
            options={
                'db_table': 'religioes',
                'managed': False,
            },
        ),
    ]
