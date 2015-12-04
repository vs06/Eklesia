from django.shortcuts import render
from django.shortcuts import redirect

from django.db import connection
from django.views.generic import TemplateView

# Create your views here.
def index(request):
    return redirect('/admin/')

class Log(TemplateView):
    template_name = 'admin/log.html'
        
    def get_context_data(self, **kwargs):
        def my_custom_sql(self):
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM ( SELECT usuario.username, log.action_flag, log.object_repr, modelo.model, log.action_time FROM django_admin_log log INNER JOIN auth_user usuario ON log.user_id = usuario.id INNER JOIN django_content_type modelo ON log.content_type_id = modelo.id ORDER BY action_time DESC ) TEST;")
            #row = cursor.fetchone()
            desc = cursor.description
            return [
                    dict(zip([col[0] for col in desc], row))
                    for row in cursor.fetchall()
                ]
            
        context = TemplateView.get_context_data(self, **kwargs) 
        context['logs']= my_custom_sql(self)
        return context