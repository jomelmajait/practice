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

        if not all([firstname, lastname, employee_id, email, password, confirm_password]):
            return JsonResponse({"error": "All required fields must be filled."}, status=400)
        
        if password != confirm_password:
            return JsonResponse({"error": "Passwords do not match."}, status=400)
        
        # Hash the password for security
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

        with get_db_connection() as db:
            cursor = db.cursor()
            try:
                sql = "INSERT INTO users (firstname, middlename, lastname, employee_id, email, password_hash) VALUES (%s, %s, %s, %s, %s, %s)"
                cursor.execute(sql, (firstname, middlename, lastname, employee_id, email, hashed_password))
                db.commit()
                return JsonResponse({"message": "Registration successful! You can now log in."}, status=201)
            except MySQLdb.IntegrityError:
                return JsonResponse({"error": "An account with this Employee ID or email already exists."}, status=409)
    except json.JSONDecodeError:
        return JsonResponse({"error": "Invalid JSON data."}, status=400)
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

        with get_db_connection() as db:
            cursor = db.cursor(MySQLdb.cursors.DictCursor)
            
            sql = "SELECT * FROM users WHERE email = %s"
            cursor.execute(sql, (email,))
            user = cursor.fetchone()

            if user and bcrypt.checkpw(password.encode('utf-8'), user['password_hash'].encode('utf-8')):
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

