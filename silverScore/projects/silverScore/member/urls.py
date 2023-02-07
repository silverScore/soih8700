from django.urls import path

from . import views

app_name = 'member'

urlpatterns = [
    path('review/list/<int:longtermadmin_id>/', views.review_index, name='review_index'),
    path('review/create/<int:longtermadmin_id>/', views.review_create, name='review_create'),
    path('review/detail/<int:review_id>/', views.review_detail, name='review_detail'),
    path('review/modify/<int:review_id>/', views.review_modify, name='review_modify'),
    path('review/delete/<int:review_id>/', views.review_delete, name='review_delete'),
]