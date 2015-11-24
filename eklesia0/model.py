# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = True` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

import locale
locale.setlocale(locale.LC_TIME, "ptb")
#locale.setlocale(locale.LC_TIME, "pt_BR") #Unix mode
from django.db import models

YESORNO_CHOICES = [('S', 'Sim'), ('N', 'Nao')]
GENDER_CHOICES = [('M', 'Masculino'), ('F', 'Feminino')]
ARROLADO_CHOICES = [('Profissao de fe', 'Profissao de fe'), ('Transferencia', 'Transferencia')]

class Cargo(models.Model):
    id = models.AutoField(primary_key=True)
    descricao = models.CharField(max_length=45)

    def __str__(self):
        return self.descricao
    
    class Meta:
        managed = True
        db_table = 'cargo'


class Cidade(models.Model):
    id = models.AutoField(primary_key=True)
    estado = models.ForeignKey('Estado', db_column='estado',blank=True, null=True)
    nome = models.CharField(max_length=45)

    def __str__(self):
        return self.nome

    class Meta:
        managed = True
        db_table = 'cidade'
        
class Escolaridade(models.Model):
    id = models.AutoField(primary_key=True)
    descricao = models.CharField(max_length=55)

    def __str__(self):
        return self.descricao

    class Meta:
        managed = True
        db_table = 'escolaridade'


class Estado(models.Model):
    id = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=45)
    sigla = models.CharField(max_length=4)

    def __str__(self):
        return self.nome

    class Meta:
        managed = True
        db_table = 'estado'


class Estadocivil(models.Model):
    id = models.AutoField(primary_key=True)
    descricao = models.CharField(max_length=45)

    def __str__(self):
        return self.descricao
    
    class Meta:
        managed = True
        db_table = 'estadocivil'


class Membro(models.Model):
    id = models.AutoField(primary_key=True)
    pessoa = models.ForeignKey('Pessoa', db_column='pessoa',)
    #cargo = models.ForeignKey(Cargo, db_column='cargo', blank=True, null=True)
    cargo =  models.ManyToManyField(Cargo,blank=True, null=True,related_name='+')
    data_entrada = models.DateField(blank=True, null=True)
    arrolado_por = models.CharField(max_length=45, choices=ARROLADO_CHOICES, blank=True, null=True)
    data_batismo = models.DateField(blank=True, null=True)
    igreja_batismo = models.CharField(max_length=45, blank=True, null=True)
    religiao_anterior = models.ForeignKey('Religioes', db_column='religiao_anterior', blank=True, null=True)
    
    def __str__(self):
        return self.pessoa.nome
    
    class Meta:
        managed = True
        db_table = 'membro'


class Pessoa(models.Model):
    id = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=95)
    data_nascimento = models.DateField(blank=True, null=True)
    sexo = models.CharField(max_length=1, choices=GENDER_CHOICES, blank=True, null=True)
    estado_civil = models.ForeignKey(Estadocivil, db_column='estado_civil', blank=True, null=True)
    naturalidade =  models.ForeignKey(Cidade, db_column='naturalidade', blank=True, null=True,related_name='+')
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
        managed = True
        db_table = 'pessoa'


class Religioes(models.Model):
    id = models.AutoField(primary_key=True)
    descricao = models.CharField(max_length=45)

    def __str__(self):
        return self.descricao

    class Meta:
        managed = True
        db_table = 'religioes'
        
class Culto(models.Model):
    id = models.AutoField(primary_key=True)
    data = models.DateField(blank=True, null=True)
    inicio = models.TimeField(blank=True, null=True)
    fim = models.TimeField(blank=True, null=True)
    presentes = models.IntegerField(blank=True, null=True)
    dizimos = models.FloatField(blank=True, null=True)
    ofertas = models.FloatField(blank=True, null=True)
    arrecadacao_total = models.FloatField(blank=True, null=True)
    abertura = models.ForeignKey(Pessoa, db_column='abertura', blank=True, null=True,related_name='+')
    musicos =  models.ManyToManyField(Membro,blank=True, null=True,related_name='+')
    pregador =  models.ForeignKey(Pessoa, db_column='pregador', blank=True, null=True,related_name='+')
    pastores_presentes = models.ManyToManyField(Membro,blank=True, null=True,related_name='+')
    diaconos = models.ManyToManyField(Membro,blank=True, null=True,related_name='+')
    observacoes = models.TextField(blank=True, null=True)
    
    def __str__(self):
        return self.data.strftime("%A - %d de %B de %Y")
    
    class Meta:
        managed = True
        db_table = 'culto'