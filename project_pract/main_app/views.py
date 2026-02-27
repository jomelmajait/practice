from django.shortcuts import render
from .models import GenderEmployeeProfile
from django.db.models import Count
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
import json
import MySQLdb
import bcrypt
from django.contrib.auth import logout

import json
import bcrypt
import MySQLdb
import random
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from django.core.mail import send_mail
from django.conf import settings


DB_SETTINGS = {
    "host": "127.0.0.1",
    "user": "root",
    "password": "", 
    "database": "datascience",
}


def get_db_connection():
    return MySQLdb.connect(**DB_SETTINGS)



@csrf_exempt
@require_http_methods(["POST"])
def register_user(request):
    try:
        data = json.loads(request.body)
        firstname = data.get("firstname")
        middlename = data.get("middlename")
        lastname = data.get("lastname")
        employee_id = data.get("employee_id")
        email = data.get("email")
        password = data.get("password")
        confirm_password = data.get("confirm_password")

        # 1. Validation
        if not all([firstname, lastname, employee_id, email, password, confirm_password]):
            return JsonResponse({"error": "All required fields must be filled."}, status=400)
        
        if password != confirm_password:
            return JsonResponse({"error": "Passwords do not match."}, status=400)
        
        # 2. Hash password at gumawa ng 6-digit OTP
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
        otp_code = str(random.randint(100000, 999999))

        with get_db_connection() as db:
            cursor = db.cursor()
            try:
                # 3. I-save sa database (naka-set ang is_active sa 0 o False muna)
                sql = """INSERT INTO users 
                         (firstname, middlename, lastname, employee_id, email, password_hash, otp_code, is_active) 
                         VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
                cursor.execute(sql, (firstname, middlename, lastname, employee_id, email, hashed_password, otp_code, 0))
                db.commit()

                # 4. I-send ang OTP sa email ng user
                subject = "Account Verification Code"
                message = f"Hi {firstname},\n\nYour verification code is: {otp_code}\n\nPlease enter this code to activate your account."
                email_from = settings.EMAIL_HOST_USER
                recipient_list = [email]
                
                send_mail(subject, message, email_from, recipient_list)

                return JsonResponse({
                    "message": "Registration successful! Please check your email for the verification code."
                }, status=201)

            except MySQLdb.IntegrityError:
                return JsonResponse({"error": "An account with this Employee ID or email already exists."}, status=409)
                
    except json.JSONDecodeError:
        return JsonResponse({"error": "Invalid JSON data."}, status=400)
    except Exception as e:
        # Error handling kung sakaling pumalya ang SMTP
        return JsonResponse({"error": f"An unexpected error occurred: {str(e)}"}, status=500)
    
@csrf_exempt
@require_http_methods(["POST"])
def verify_otp(request):
    data = json.loads(request.body)
    email = data.get("email")
    user_otp = data.get("otp")

    with get_db_connection() as db:
        cursor = db.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute("SELECT otp_code FROM users WHERE email = %s", (email,))
        user = cursor.fetchone()

        if user and user['otp_code'] == user_otp:
            # I-activate ang user at burahin ang OTP
            cursor.execute("UPDATE users SET is_active = 1, otp_code = NULL WHERE email = %s", (email,))
            db.commit()
            return JsonResponse({"message": "Account verified! You can now login."}, status=200)
        else:
            return JsonResponse({"error": "Invalid code."}, status=400)
        

@csrf_exempt
@require_http_methods(["POST"])
def login_user(request):
    try:
        data = json.loads(request.body)
        email = data.get("email")
        password = data.get("password")

        if not all([email, password]):
            return JsonResponse({"error": "Email and password are required."}, status=400)

        with get_db_connection() as db:
            cursor = db.cursor(MySQLdb.cursors.DictCursor)
            
            sql = "SELECT * FROM users WHERE email = %s"
            cursor.execute(sql, (email,))
            user = cursor.fetchone()

            # 1. Check muna kung may nahanap na user at kung tama ang password
            if user and bcrypt.checkpw(password.encode('utf-8'), user['password_hash'].encode('utf-8')):
                
                # 2. DITO MO ILALAGAY: Check kung active na ang account
                if user['is_active'] == 0:
                    return JsonResponse({"error": "Please verify your email first."}, status=403)

                # 3. Kung tama ang password AT is_active=1, tsaka lang mag-success
                return JsonResponse({"message": "Login successful!"}, status=200)
            
            else:
                return JsonResponse({"error": "Invalid email or password."}, status=401)
                
    except json.JSONDecodeError:
        return JsonResponse({"error": "Invalid JSON data."}, status=400)
    except Exception as e:
        return JsonResponse({"error": f"An unexpected error occurred: {str(e)}"}, status=500)
    
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