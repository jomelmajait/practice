from django.contrib import admin
from .models import GenderEmployeeProfile
# this will be the registered the table of my database in admin.py so that it will visible in my admin side
@admin.register(GenderEmployeeProfile)
class GenderEmployeeProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in GenderEmployeeProfile._meta.fields]
    search_fields = ('name', 'employee_id', 'designation', 'position')  # customize search
    list_filter = ('sex', 'employment_status', 'campus_assignment')     # customize filters
    list_per_page = 25
