from django.urls import path

from . import views

app_name = 'member'

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:review_id>/', views.detail, name='detail'),
    path('review/create/', views.review_create, name='review_create'),
]