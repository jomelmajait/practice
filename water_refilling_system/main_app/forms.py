# main_app/forms.py
from django import forms
from .models import CustomerProfile, DeliveryAddress # Import models mula sa parehong app

class CustomerProfileForm(forms.ModelForm):
    class Meta:
        model = CustomerProfile
        fields = ['phone_number']
        widgets = {
            'phone_number': forms.TextInput(attrs={'class': 'w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500', 'placeholder': 'Numero ng Telepono'}),
        }

class DeliveryAddressForm(forms.ModelForm):
    class Meta:
        model = DeliveryAddress
        fields = ['street_address', 'city', 'province', 'zip_code', 'is_default']
        widgets = {
            'street_address': forms.TextInput(attrs={'class': 'w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500', 'placeholder': 'Numero at Pangalan ng Kalye'}),
            'city': forms.TextInput(attrs={'class': 'w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500', 'placeholder': 'Lungsod'}),
            'province': forms.TextInput(attrs={'class': 'w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500', 'placeholder': 'Probinsya'}),
            'zip_code': forms.TextInput(attrs={'class': 'w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500', 'placeholder': 'Zip Code (Opsyonal)'}),
            'is_default': forms.CheckboxInput(attrs={'class': 'mr-2'}),
        }

