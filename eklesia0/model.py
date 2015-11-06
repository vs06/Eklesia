# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class Cargo(models.Model):
    id = models.IntegerField(primary_key=True)
    descricao = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return self.descricao
    
    class Meta:
        managed = False
        db_table = 'cargo'


class Cidade(models.Model):
    id = models.ForeignKey('Estado', db_column='id', primary_key=True)
    estado = models.IntegerField(blank=True, null=True)
    nome = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return self.nome

    class Meta:
        managed = False
        db_table = 'cidade'


class Escolaridade(models.Model):
    id = models.IntegerField(primary_key=True)
    descricao = models.CharField(max_length=55, blank=True, null=True)

    def __str__(self):
        return self.descricao

    class Meta:
        managed = False
        db_table = 'escolaridade'


class Estado(models.Model):
    id = models.IntegerField(primary_key=True)
    nome = models.CharField(max_length=45, blank=True, null=True)
    sigla = models.CharField(max_length=4, blank=True, null=True)

    def __str__(self):
        return self.nome

    class Meta:
        managed = False
        db_table = 'estado'


class Estadocivil(models.Model):
    id = models.IntegerField(primary_key=True)
    descricao = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return self.descricao
    
    class Meta:
        managed = False
        db_table = 'estadocivil'


class Membro(models.Model):
    id = models.IntegerField(primary_key=True)
    pessoa = models.IntegerField(blank=True, null=True)
    cargo = models.ForeignKey(Cargo, db_column='cargo', blank=True, null=True)
    data_entrada = models.DateField(blank=True, null=True)
    arrolado_por = models.CharField(max_length=45, blank=True, null=True)
    data_batismo = models.DateField(blank=True, null=True)
    igreja_batismo = models.CharField(max_length=45, blank=True, null=True)
    religiao_antrerior = models.ForeignKey('Religioes', db_column='religiao_antrerior', blank=True, null=True)
    
    def __str__(self):
        return self.pessoa
    
    class Meta:
        managed = False
        db_table = 'membro'


class Pessoa(models.Model):
    id = models.IntegerField(primary_key=True)
    nome = models.CharField(max_length=95, blank=True, null=True)
    data_nascimento = models.DateField(blank=True, null=True)
    sexo = models.CharField(max_length=1, blank=True, null=True)
    estado_civil = models.ForeignKey(Estadocivil, db_column='estado_civil', blank=True, null=True)
    naturalidade = models.CharField(max_length=45, blank=True, null=True)
    rg = models.CharField(max_length=45, blank=True, null=True)
    cpf = models.CharField(max_length=45, blank=True, null=True)
    profissao = models.CharField(max_length=50, blank=True, null=True)
    escolaridade = models.ForeignKey(Escolaridade, db_column='escolaridade', blank=True, null=True)
    endereco = models.CharField(max_length=250, blank=True, null=True)
    cep = models.CharField(max_length=45, blank=True, null=True)
    cidade = models.ForeignKey(Cidade, db_column='cidade', blank=True, null=True)
    uf = models.ForeignKey(Estado, db_column='uf', blank=True, null=True)
    telefone_residencial = models.CharField(max_length=45, blank=True, null=True)
    telefone_celular = models.CharField(max_length=45, blank=True, null=True)
    email = models.CharField(max_length=150, blank=True, null=True)

    def __str__(self):
        return self.nome

    class Meta:
        managed = False
        db_table = 'pessoa'


class Religioes(models.Model):
    id = models.IntegerField(primary_key=True)
    descricao = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return self.descricao

    class Meta:
        managed = False
        db_table = 'religioes'
