# main_app/models.py
from django.db import models
from django.contrib.auth.models import User

# --- Product Models ---
class Category(models.Model):
    """
    Kinakatawan ang isang kategorya ng mga produktong tubig (hal. Purified, Mineral, Alkaline).
    """
    name = models.CharField(max_length=100, unique=True)
    description = models.TextField(blank=True, null=True)

    class Meta:
        verbose_name_plural = "Categories" # Tamang pangmaramihan na pangalan sa admin

    def __str__(self):
        return self.name

class Product(models.Model):
    """
    Kinakatawan ang isang produktong tubig na available para sa order.
    """
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products')
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2) # Presyo kada unit (hal. kada 5-gallon bottle)
    image = models.ImageField(upload_to='product_images/', blank=True, null=True)
    is_available = models.BooleanField(default=True)
    stock = models.IntegerField(default=0) # Kasalukuyang stock na available

    def __str__(self):
        return self.name

# --- Account Models ---
class CustomerProfile(models.Model):
    """
    Nagpapalawak sa default na Django User model para sa impormasyon ng customer.
    """
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=15, blank=True, null=True)

    def __str__(self):
        return self.user.username

class DeliveryAddress(models.Model):
    """
    Nagtatabi ng mga delivery address para sa mga customer.
    """
    customer_profile = models.ForeignKey(CustomerProfile, on_delete=models.CASCADE, related_name='addresses')
    street_address = models.CharField(max_length=255)
    city = models.CharField(max_length=100)
    province = models.CharField(max_length=100)
    zip_code = models.CharField(max_length=10, blank=True, null=True)
    is_default = models.BooleanField(default=False) # Maaaring may default address ang isang customer

    class Meta:
        verbose_name_plural = "Delivery Addresses"

    def __str__(self):
        return f"{self.street_address}, {self.city}"

# --- Order Models ---
class Order(models.Model):
    """
    Kinakatawan ang order ng isang customer.
    """
    STATUS_CHOICES = [
        ('Pending', 'Pending'),
        ('Processing', 'Processing'),
        ('Out for Delivery', 'Out for Delivery'),
        ('Delivered', 'Delivered'),
        ('Cancelled', 'Cancelled'),
    ]

    customer = models.ForeignKey(User, on_delete=models.CASCADE, related_name='orders')
    delivery_address = models.ForeignKey(DeliveryAddress, on_delete=models.SET_NULL, null=True) # Kung burahin ang address, mananatili ang order
    order_date = models.DateTimeField(auto_now_add=True)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Pending')
    delivery_notes = models.TextField(blank=True, null=True)
    is_paid = models.BooleanField(default=False) # Para sa future payment gateway integration

    def __str__(self):
        return f"Order #{self.id} by {self.customer.username}"

class OrderItem(models.Model):
    """
    Kinakatawan ang isang produkto sa loob ng isang order.
    """
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    price = models.DecimalField(max_digits=10, decimal_places=2) # Presyo sa oras ng order

    def get_total_price(self):
        return self.quantity * self.price

    def __str__(self):
        return f"{self.quantity} x {self.product.name} in Order #{self.order.id}"

