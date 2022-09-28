from django.contrib import admin

# Register your models here.
from registration.models import *

admin.site.register(Category)
admin.site.register(SubCategory)
admin.site.register(Region)
admin.site.register(City)
