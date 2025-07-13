# water_refilling_system/urls.py
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from main_app import views # Import all views from your consolidated main_app

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),

    # Product URLs
    path('products/', views.product_list, name='product_list'),
    path('products/add-to-cart/', views.add_to_cart_api, name='add_to_cart_api'),

    # Account URLs
    path('accounts/register/', views.register_view, name='register'),
    path('accounts/login/', views.login_view, name='login'),
    path('accounts/logout/', views.logout_view, name='logout'),

    # Order URLs
    path('orders/cart/', views.cart_view, name='cart'),
    path('orders/checkout/', views.checkout_view, name='checkout'),
    path('orders/order-confirmation/<int:order_id>/', views.order_confirmation_view, name='order_confirmation'),
    path('orders/history/', views.order_history_view, name='order_history'),
    path('orders/update-address-default/', views.update_address_default, name='update_address_default'),
]

# Serve media files in development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
