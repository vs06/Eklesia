'''
Created on 09/06/2015

@author: victor.sousa
'''
from django.contrib import admin
from eklesia0.model import Pessoa, Cidade, Estado, Escolaridade, Estadocivil, Membro, Religioes, Cargo, Culto
from django.utils.translation import ugettext_lazy

admin.site.site_title = ugettext_lazy('Eklesia')
admin.site.site_header = ugettext_lazy('Eklesia')
admin.site.index_title = ugettext_lazy('Eklesia')

class PessoaAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=['nome']
    _fields=['nome']
    #list_display = _fields
    #list_display_links = list_display
admin.site.register(Pessoa,PessoaAdmin)

class CidadeAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=[]
    #_fields=[]
    ##list_display = _fields
    ##list_display_links = list_display
admin.site.register(Cidade,CidadeAdmin)

class EstadoAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=[]
   #_fields=[]
    #list_display = _fields
    #list_display_links = list_display
admin.site.register(Estado,EstadoAdmin)

class EstadocivilAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=[]
   #_fields=[]
    #list_display = _fields
    #list_display_links = list_display
admin.site.register(Estadocivil,EstadocivilAdmin)

class EscolaridadeAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=[]
   #_fields=[]
    #list_display = _fields
    #list_display_links = list_display
admin.site.register(Escolaridade,EscolaridadeAdmin)

class MembroAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=[]
   #_fields=[]
    #list_display = _fields
    #list_display_links = list_display
admin.site.register(Membro,MembroAdmin)

class ReligioesAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=[]
   #_fields=[]
    #list_display = _fields
    #list_display_links = list_display
admin.site.register(Religioes,ReligioesAdmin)

class CargoAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=[]
   #_fields=[]
    #list_display = _fields
    #list_display_links = list_display
admin.site.register(Cargo,CargoAdmin)

class CultoAdmin(admin.ModelAdmin):
    search_fields=[]
    list_filter=[]
    #_fields=[]
    ##list_display = _fields
    ##list_display_links = list_display
admin.site.register(Culto,CultoAdmin)