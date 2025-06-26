# main_app/views.py
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.db import transaction
import json

# Import all models and forms from the same app
from .models import Category, Product, CustomerProfile, DeliveryAddress, Order, OrderItem
from .forms import CustomerProfileForm, DeliveryAddressForm

# --- General Views ---
def home(request):
    """
    Nagre-render sa home page ng water refilling system.
    """
    return render(request, 'main_app/home.html')

# --- Product Views ---
def product_list(request):
    """
    Nagpapakita ng listahan ng lahat ng available na produktong tubig.
    """
    products = Product.objects.filter(is_available=True, stock__gt=0).order_by('name')
    categories = Category.objects.all().order_by('name')
    return render(request, 'main_app/product_list.html', {'products': products, 'categories': categories})

def add_to_cart_api(request):
    """
    API endpoint para magdagdag ng produkto sa cart (client-side localStorage).
    """
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            product_id = data.get('product_id')
            quantity = int(data.get('quantity', 1))

            product = get_object_or_404(Product, id=product_id)

            if quantity <= 0:
                return JsonResponse({'success': False, 'message': 'Dami ay dapat positibo.'}, status=400)
            if quantity > product.stock:
                return JsonResponse({'success': False, 'message': f'Hindi sapat ang stock. {product.stock} lang ang available.'}, status=400)

            return JsonResponse({'success': True, 'message': f'{quantity} x {product.name} idinagdag sa cart.'})
        except json.JSONDecodeError:
            return JsonResponse({'success': False, 'message': 'Hindi valid na JSON.'}, status=400)
        except Exception as e:
            return JsonResponse({'success': False, 'message': str(e)}, status=500)
    return JsonResponse({'success': False, 'message': 'Invalid request method.'}, status=405)


# --- Account Views ---
def register_view(request):
    """
    Humahawak sa pagpaparehistro ng user.
    """
    if request.method == 'POST':
        user_form = UserCreationForm(request.POST)
        profile_form = CustomerProfileForm(request.POST)
        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save()
            profile = profile_form.save(commit=False)
            profile.user = user
            profile.save()
            messages.success(request, 'Matagumpay ang pagpaparehistro! Maaari ka nang mag-log in.')
            return redirect('login')
        else:
            for field, errors in user_form.errors.items():
                for error in errors:
                    messages.error(request, f"{field.replace('_', ' ').title()}: {error}")
            for field, errors in profile_form.errors.items():
                for error in errors:
                    messages.error(request, f"{field.replace('_', ' ').title()}: {error}")
    else:
        user_form = UserCreationForm()
        profile_form = CustomerProfileForm()
    return render(request, 'main_app/register.html', {'user_form': user_form, 'profile_form': profile_form})

def login_view(request):
    """
    Humahawak sa pag-log in ng user.
    """
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                messages.success(request, f"Welcome back, {username}!")
                return redirect('home') # Redirect sa home o products page
            else:
                messages.error(request, 'Invalid username o password.')
        else:
            messages.error(request, 'Invalid username o password.')
    else:
        form = AuthenticationForm()
    return render(request, 'main_app/login.html', {'form': form})

def logout_view(request):
    """
    Humahawak sa pag-log out ng user.
    """
    logout(request)
    messages.info(request, 'Ikaw ay naka-logout na.')
    return redirect('home')

# --- Order Views ---
@login_required
def cart_view(request):
    """
    Nagpapakita ng nilalaman ng shopping cart.
    Ang Cart ay pinamamahalaan pangunahin sa client-side gamit ang localStorage.
    """
    return render(request, 'main_app/cart.html')

@login_required
def checkout_view(request):
    """
    Humahawak sa proseso ng checkout: nagpapakita ng mga address, nagpapahintulot sa pagdagdag ng bago, kinukumpirma ang order.
    """
    customer_profile, created = CustomerProfile.objects.get_or_create(user=request.user)
    addresses = DeliveryAddress.objects.filter(customer_profile=customer_profile).order_by('-is_default', 'city')

    if request.method == 'POST':
        action = request.POST.get('action')

        if action == 'add_address':
            address_form = DeliveryAddressForm(request.POST)
            if address_form.is_valid():
                new_address = address_form.save(commit=False)
                new_address.customer_profile = customer_profile
                if new_address.is_default:
                    DeliveryAddress.objects.filter(customer_profile=customer_profile).update(is_default=False)
                new_address.save()
                messages.success(request, 'Matagumpay na naidagdag ang bagong delivery address!')
                return redirect('checkout')
            else:
                messages.error(request, 'Error sa pagdagdag ng address. Pakitingnan ang iyong input.')
        elif action == 'place_order':
            selected_address_id = request.POST.get('selected_address')
            delivery_notes = request.POST.get('delivery_notes', '')
            cart_data_json = request.POST.get('cart_data', '[]')

            if not selected_address_id:
                messages.error(request, 'Pumili muna ng delivery address.')
                return redirect('checkout')

            try:
                selected_address = get_object_or_404(DeliveryAddress, id=selected_address_id, customer_profile=customer_profile)
                cart_items = json.loads(cart_data_json)

                if not cart_items:
                    messages.error(request, 'Walang laman ang iyong cart. Pakidagdag ng mga produkto bago mag-checkout.')
                    return redirect('cart')

                with transaction.atomic():
                    order = Order.objects.create(
                        customer=request.user,
                        delivery_address=selected_address,
                        delivery_notes=delivery_notes,
                        total_amount=0
                    )
                    total_amount = 0
                    for item_data in cart_items:
                        product_id = item_data.get('id')
                        quantity = item_data.get('quantity')
                        product = get_object_or_404(Product, id=product_id, is_available=True)

                        if product.stock < quantity:
                            raise ValueError(f"Hindi sapat ang stock para sa {product.name}. Available: {product.stock}, Inorder: {quantity}")

                        OrderItem.objects.create(
                            order=order,
                            product=product,
                            quantity=quantity,
                            price=product.price
                        )
                        product.stock -= quantity
                        product.save()
                        total_amount += product.price * quantity

                    order.total_amount = total_amount
                    order.save()

                messages.success(request, f'Matagumpay na na-order ang #{order.id}! Total: ${total_amount:.2f}')
                return redirect('order_confirmation', order_id=order.id)

            except ValueError as e:
                messages.error(request, f'Nabigo ang order: {e}')
                return redirect('checkout')
            except json.JSONDecodeError:
                messages.error(request, 'Hindi valid ang data ng cart.')
                return redirect('checkout')
            except Exception as e:
                messages.error(request, f'May hindi inaasahang error na naganap: {e}')
                return redirect('checkout')
        else:
            messages.error(request, 'Hindi valid na aksyon.')

    address_form = DeliveryAddressForm()
    return render(request, 'main_app/checkout.html', {
        'addresses': addresses,
        'address_form': address_form,
    })

@login_required
def order_confirmation_view(request, order_id):
    """
    Nagpapakita ng confirmation page pagkatapos mailagay ang order.
    """
    order = get_object_or_404(Order, id=order_id, customer=request.user)
    order_items = order.items.all()
    return render(request, 'main_app/order_confirmation.html', {'order': order, 'order_items': order_items})

@login_required
def order_history_view(request):
    """
    Nagpapakita ng listahan ng lahat ng nakaraang order para sa logged-in na user.
    """
    orders = Order.objects.filter(customer=request.user).order_by('-order_date')
    return render(request, 'main_app/order_history.html', {'orders': orders})

@login_required
def update_address_default(request):
    """
    API endpoint para itakda ang isang delivery address bilang default.
    """
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        try:
            data = json.loads(request.body)
            address_id = data.get('address_id')
            customer_profile, created = CustomerProfile.objects.get_or_create(user=request.user)

            with transaction.atomic():
                DeliveryAddress.objects.filter(customer_profile=customer_profile).update(is_default=False)
                address = get_object_or_404(DeliveryAddress, id=address_id, customer_profile=customer_profile)
                address.is_default = True
                address.save()
            return JsonResponse({'success': True, 'message': 'Na-update ang default address.'})
        except Exception as e:
            return JsonResponse({'success': False, 'message': str(e)}, status=400)
    return JsonResponse({'success': False, 'message': 'Hindi valid na kahilingan.'}, status=400)
