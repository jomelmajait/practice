import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project_pract.settings')
django.setup()

from main_app.models import GenderEmployeeProfile

# Ito yung listahan ng data mo (dinagdag ko yung mga sample mo)
records = [
    (1, 'Main Campus', 'Auxiliary & Business Office', 'Permanent', 'Teaching', 'Male', 36, 'Married', 9, 'Director', 'Associate Professor II', 167.64, 73.00, 1, 1, 0, 0, 0, 0, 0, None, 2, '40000-74999', '', '', ''),
    (2, 'Main Campus', 'Auxiliary & Business Office', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 46, 'Married', 5, '', 'Utility', 167.64, 89.00, 1, 0, 0, 0, 0, 0, 0, None, 6, '<=10000', 'San Ildefonso', '', ''),
    (3, 'Main Campus', 'Auxiliary & Business Office', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 61, 'Widowed', 12, '', 'Support Staff', 177.80, 73.00, 1, 1, 1, 0, 0, 0, 0, None, 5, '10001-19999', 'San Ildefonso', '', ''),
    # ... IPAGPATULOY MO DITO ANG PAG-PASTE NG IBA PANG RECORDS MULA SA SQL MO ...
]

print("Importing records...")
for r in records:
    GenderEmployeeProfile.objects.get_or_create(
        id=r[0],
        defaults={
            'campus_assignment': r[1], 'office_affiliation': r[2], 'employment_status': r[3],
            'type_of_employee': r[4], 'sex': r[5], 'age': r[6], 'marital_status': r[7],
            'years_in_service': r[8], 'designation': r[9], 'position': r[10],
            'height_cm': r[11], 'weight_kg': r[12], 'is_head_of_family': r[13],
            'is_primary_caregiver': r[14], 'is_solo_parent': r[15], 'has_children_below_7': r[16],
            'has_children_with_disabilities': r[17], 'is_ip_member': r[18], 'is_pwd': r[19],
            'pwd_types': r[20], 'household_size': r[21], 'household_income_range': r[22],
            'address': r[23], 'name': r[24], 'employee_id': r[25]
        }
    )
print(f"Successfully imported {len(records)} records!")