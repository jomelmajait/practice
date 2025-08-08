from django.urls import path
from django.contrib.auth import views as auth_views 
from . import views


urlpatterns = [
    path('', views.index, name='index'),  
    path('gender-chart/', views.gender_chart, name='gender_chart'),  
    path('dashboard/', views.dashboard, name='dashboard'),
    path('register/', views.register_user, name='register'),
    path('login/', views.login_user, name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='index'), name='logout'),
  
]
