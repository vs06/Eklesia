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
                ('descricao', models.CharField(max_length=45)),
            ],
            options={
                'managed': True,
                'db_table': 'cargo',
            },
        ),
        migrations.CreateModel(
            name='Cidade',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('nome', models.CharField(max_length=45)),
            ],
            options={
                'managed': True,
                'db_table': 'cidade',
            },
        ),
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
        migrations.CreateModel(
            name='Escolaridade',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('descricao', models.CharField(max_length=55)),
            ],
            options={
                'managed': True,
                'db_table': 'escolaridade',
            },
        ),
        migrations.CreateModel(
            name='Estado',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('nome', models.CharField(max_length=45)),
                ('sigla', models.CharField(max_length=4)),
            ],
            options={
                'managed': True,
                'db_table': 'estado',
            },
        ),
        migrations.CreateModel(
            name='Estadocivil',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('descricao', models.CharField(max_length=45)),
            ],
            options={
                'managed': True,
                'db_table': 'estadocivil',
            },
        ),
        migrations.CreateModel(
            name='Membro',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('data_entrada', models.DateField(blank=True, null=True)),
                ('arrolado_por', models.CharField(choices=[('Profissao de fe', 'Profissao de fe'), ('Transferencia', 'Transferencia')], blank=True, max_length=45, null=True)),
                ('data_batismo', models.DateField(blank=True, null=True)),
                ('igreja_batismo', models.CharField(blank=True, max_length=45, null=True)),
                ('cargo', models.ForeignKey(to='eklesia0.Cargo', db_column='cargo', null=True, blank=True)),
            ],
            options={
                'managed': True,
                'db_table': 'membro',
            },
        ),
        migrations.CreateModel(
            name='Pessoa',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('nome', models.CharField(max_length=95)),
                ('data_nascimento', models.DateField(blank=True, null=True)),
                ('sexo', models.CharField(choices=[('M', 'Masculino'), ('F', 'Feminino')], blank=True, max_length=1, null=True)),
                ('naturalidade', models.CharField(blank=True, max_length=45, null=True)),
                ('rg', models.CharField(blank=True, max_length=45, null=True)),
                ('cpf', models.CharField(blank=True, max_length=45, null=True)),
                ('profissao', models.CharField(blank=True, max_length=50, null=True)),
                ('endereco', models.CharField(blank=True, max_length=250, null=True)),
                ('cep', models.CharField(blank=True, max_length=45, null=True)),
                ('telefone_residencial', models.CharField(blank=True, max_length=45, null=True)),
                ('telefone_celular', models.CharField(blank=True, max_length=45, null=True)),
                ('email', models.CharField(blank=True, max_length=150, null=True)),
                ('cidade', models.ForeignKey(to='eklesia0.Cidade', db_column='cidade', null=True, blank=True)),
                ('escolaridade', models.ForeignKey(to='eklesia0.Escolaridade', db_column='escolaridade', null=True, blank=True)),
                ('estado_civil', models.ForeignKey(to='eklesia0.Estadocivil', db_column='estado_civil', null=True, blank=True)),
                ('uf', models.ForeignKey(to='eklesia0.Estado', db_column='uf', null=True, blank=True)),
            ],
            options={
                'managed': True,
                'db_table': 'pessoa',
            },
        ),
        migrations.CreateModel(
            name='Religioes',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('descricao', models.CharField(max_length=45)),
            ],
            options={
                'managed': True,
                'db_table': 'religioes',
            },
        ),
        migrations.AddField(
            model_name='membro',
            name='pessoa',
            field=models.ForeignKey(db_column='pessoa', to='eklesia0.Pessoa'),
        ),
        migrations.AddField(
            model_name='membro',
            name='religiao_anterior',
            field=models.ForeignKey(to='eklesia0.Religioes', db_column='religiao_anterior', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='culto',
            name='abertura',
            field=models.ForeignKey(to='eklesia0.Pessoa', null=True, blank=True, related_name='+'),
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
            field=models.ForeignKey(to='eklesia0.Pessoa', null=True, blank=True, related_name='+'),
        ),
        migrations.AddField(
            model_name='cidade',
            name='estado',
            field=models.ForeignKey(to='eklesia0.Estado', db_column='estado', null=True, blank=True),
        ),
    ]
