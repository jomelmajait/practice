# main_app/admin.py
from django.contrib import admin
from .models import Category, Product, CustomerProfile, DeliveryAddress, Order, OrderItem

admin.site.register(Category)
admin.site.register(Product)
admin.site.register(CustomerProfile)
admin.site.register(DeliveryAddress)
admin.site.register(Order)
admin.site.register(OrderItem)
