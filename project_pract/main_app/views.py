from django.shortcuts import render
from .models import GenderEmployeeProfile
from django.db.models import Count

def gender_chart(request):
    gender_data = GenderEmployeeProfile.objects.values('sex').annotate(count=Count('sex'))
    labels = [item['sex'] for item in gender_data]
    counts = [item['count'] for item in gender_data]

    return render(request, 'main_app/gender_chart.html', {
        'labels': labels,
        'counts': counts
    })

from django.shortcuts import render
from .models import GenderEmployeeProfile
from django.db.models import Count

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

