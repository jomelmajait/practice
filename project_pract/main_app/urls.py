from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='index'),  # 👈 default home
    path('gender-chart/', views.gender_chart, name='gender_chart'),  # 👈 this path matters!
    path('dashboard/', views.dashboard, name='dashboard'),
  
]
