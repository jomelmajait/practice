

from django.shortcuts import render, redirect
from django.db.models import Count
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from django.core.mail import send_mail
from django.conf import settings
from django.contrib.auth import logout
import json
import bcrypt
import random

# Import mo ang iyong mga models
from .models import GenderEmployeeProfile, UserAccount

@csrf_exempt
@require_http_methods(["POST"])
def register_user(request):
    try:
        data = json.loads(request.body)

        # 1. Kunin ang lahat ng data mula sa request body
        firstname = data.get("firstname")
        middlename = data.get("middlename")
        lastname = data.get("lastname")
        employee_id = data.get("employee_id")
        email = data.get("email")
        password = data.get("password")  # Heto ang inayos natin
        confirm_password = data.get("confirm_password")

        # 2. Validation
        if not all([firstname, lastname, employee_id, email, password, confirm_password]):
            return JsonResponse({"error": "All required fields must be filled."}, status=400)

        if password != confirm_password:
            return JsonResponse({"error": "Passwords do not match."}, status=400)

        # 3. Hash password at OTP generation
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
        otp_code = str(random.randint(100000, 999999))

        # 4. I-save gamit ang Django ORM (SQLite/MySQL ready)
        UserAccount.objects.create(
            firstname=firstname,
            middlename=middlename,
            lastname=lastname,
            employee_id=employee_id,
            email=email,
            password_hash=hashed_password,
            otp_code=otp_code,
            is_active=False
        )

        # 5. Email Logic
        try:
            subject = "Account Verification Code"
            message = f"Hi {firstname},\n\nYour verification code is: {otp_code}\n\nPlease enter this code to activate your account."
            email_from = settings.EMAIL_HOST_USER
            recipient_list = [email]
            send_mail(subject, message, email_from, recipient_list)
        except Exception as email_err:
            # Kahit pumalya ang email, naka-save na ang user sa DB
            print(f"Email error: {str(email_err)}")

        return JsonResponse({
            "message": "Registration successful! Please check your email for the verification code."
        }, status=201)

    except Exception as e:
        return JsonResponse({"error": f"An unexpected error occurred: {str(e)}"}, status=500)

@csrf_exempt
@require_http_methods(["POST"])
def login_user(request):
    try:
        data = json.loads(request.body)
        email = data.get("email")
        password = data.get("password")

        if not all([email, password]):
            return JsonResponse({"error": "Email and password are required."}, status=400)

        # Hanapin ang user gamit ang Django ORM
        user = UserAccount.objects.filter(email=email).first()

        if user and bcrypt.checkpw(password.encode('utf-8'), user.password_hash.encode('utf-8')):
            if not user.is_active:
                return JsonResponse({"error": "Please verify your email first."}, status=403)
            return JsonResponse({"message": "Login successful!"}, status=200)
        else:
            return JsonResponse({"error": "Invalid email or password."}, status=401)

    except Exception as e:
        return JsonResponse({"error": f"An unexpected error occurred: {str(e)}"}, status=500)

@csrf_exempt
@require_http_methods(["POST"])
def verify_otp(request):
    try:
        data = json.loads(request.body)
        email = data.get("email")
        user_otp = data.get("otp")

        # Hanapin ang user gamit ang Django ORM (SQLite compatible)
        user = UserAccount.objects.filter(email=email).first()

        if user and user.otp_code == user_otp:
            # I-activate ang account
            user.is_active = True
            user.otp_code = None
            user.save() # Dito itatama ang record sa database

            return JsonResponse({"message": "Account verified! You can now login."}, status=200)
        else:
            return JsonResponse({"error": "Invalid code. Please try again."}, status=400)

    except Exception as e:
        return JsonResponse({"error": f"Server Error: {str(e)}"}, status=500)


def gender_chart(request):
    gender_data = GenderEmployeeProfile.objects.values('sex').annotate(count=Count('sex'))
    labels = [item['sex'] for item in gender_data]
    counts = [item['count'] for item in gender_data]

    return render(request, 'main_app/gender_chart.html', {
        'labels': labels,
        'counts': counts
    })



def dashboard(request):
    # Gender Pie Chart
    gender_data = GenderEmployeeProfile.objects.values('sex').annotate(count=Count('sex'))
    gender_labels = [g['sex'] for g in gender_data]
    gender_counts = [g['count'] for g in gender_data]

    # Employment Status Bar Chart
    employment_data = GenderEmployeeProfile.objects.values('employment_status').annotate(count=Count('employment_status'))
    employment_labels = [e['employment_status'] for e in employment_data]
    employment_counts = [e['count'] for e in employment_data]

    # Type of Employee Line Chart
    type_data = GenderEmployeeProfile.objects.values('type_of_employee').annotate(count=Count('type_of_employee'))
    type_labels = [t['type_of_employee'] for t in type_data]
    type_counts = [t['count'] for t in type_data]

    context = {
        'gender_labels': gender_labels,
        'gender_counts': gender_counts,
        'employment_labels': employment_labels,
        'employment_counts': employment_counts,
        'type_labels': type_labels,
        'type_counts': type_counts,
    }

     # ✅ Campus Assignment Chart
    campus_data = GenderEmployeeProfile.objects.values('campus_assignment').annotate(count=Count('id'))
    campus_labels = [item['campus_assignment'] for item in campus_data]
    campus_counts = [item['count'] for item in campus_data]

    context = {
        'gender_labels': gender_labels,
        'gender_counts': gender_counts,
        'employment_labels': employment_labels,
        'employment_counts': employment_counts,
        'type_labels': type_labels,
        'type_counts': type_counts,
        # 👇 Add this
        'campus_labels': campus_labels,
        'campus_counts': campus_counts,
    }

    return render(request, 'main_app/dashboard.html', context)


def index(request):
   return render(request, 'main_app/index.html')


def logout_view(request):
    logout(request)
    return redirect('index')