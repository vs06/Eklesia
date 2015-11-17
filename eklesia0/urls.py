#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from . import views
from django.views.generic import ListView

urlpatterns = [
   url(r'^$', views.index, name='index'),
]
