from django.contrib import admin

# Register your models here.
from client.user.models import User

admin.site.register(User)