from django.urls import path
from . import views

app_name = 'care'

urlpatterns = [
    path('', views.index, name='index'),
]

