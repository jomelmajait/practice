from django.urls import path
from . import views

urlpatterns = [
    path('', views.dashboard, name='dashboard'),  # 👈 default home
    path('gender-chart/', views.gender_chart, name='gender_chart'),  # 👈 this path matters!
]
