# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

# this will be the retieval of data in my database 
class GenderEmployeeProfile(models.Model):
    campus_assignment = models.CharField(max_length=22, blank=True, null=True)
    office_affiliation = models.CharField(max_length=100, blank=True, null=True)
    employment_status = models.CharField(max_length=31, blank=True, null=True)
    type_of_employee = models.CharField(max_length=12, blank=True, null=True)
    sex = models.CharField(max_length=6, blank=True, null=True)
    age = models.IntegerField(blank=True, null=True)
    marital_status = models.CharField(max_length=9, blank=True, null=True)
    years_in_service = models.IntegerField(blank=True, null=True)
    designation = models.CharField(max_length=100, blank=True, null=True)
    position = models.CharField(max_length=100, blank=True, null=True)
    height_cm = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    weight_kg = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    is_head_of_family = models.IntegerField(blank=True, null=True)
    is_primary_caregiver = models.IntegerField(blank=True, null=True)
    is_solo_parent = models.IntegerField(blank=True, null=True)
    has_children_below_7 = models.IntegerField(blank=True, null=True)
    has_children_with_disabilities = models.IntegerField(blank=True, null=True)
    is_ip_member = models.IntegerField(blank=True, null=True)
    is_pwd = models.IntegerField(blank=True, null=True)
    pwd_types = models.CharField(max_length=255, blank=True, null=True)
    household_size = models.IntegerField(blank=True, null=True)
    household_income_range = models.CharField(max_length=11, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=100, blank=True, null=True)
    employee_id = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gender_employee_profile'
