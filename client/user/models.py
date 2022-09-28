from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.
from registration.models import SubCategory, Region, City, Category


class User(AbstractUser):
    STATUS = (
        ("client", "client"),
        ("freelancer", "freelancer")
    )
    phone_number = models.CharField(max_length=20, unique=True)
    password = models.CharField(max_length=100, null=True, blank=True)
    telegram = models.CharField(max_length=100, null=True)
    title = models.TextField(null=True, blank=True)
    experience = models.IntegerField(null=True, blank=True)
    overview = models.TextField(null=True, blank=True)
    payment_hourly = models.FloatField(null=True, blank=True)
    categories = models.ManyToManyField(Category, blank=True)
    skills = models.ManyToManyField(SubCategory, blank=True)
    region = models.ForeignKey(Region, on_delete=models.CASCADE, null=True, blank=True)
    city = models.ForeignKey(City, on_delete=models.CASCADE, null=True, blank=True)
    street = models.CharField(max_length=300, null=True, blank=True)
    role = models.CharField(max_length=10, choices=STATUS, default="freelancer", null=True, blank=True)
    avatar = models.ImageField(upload_to="profile/", null=True, blank=True)
    is_delete = models.BooleanField(default=False)
    is_online = models.BooleanField(default=False)
    balance = models.BigIntegerField(default=0)
    total_earnings = models.BigIntegerField(default=0)
    total_spent = models.BigIntegerField(default=0)
    is_new = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.username} | {self.id}"

    class Meta:
        db_table = "user"
        swappable = "AUTH_USER_MODEL"
        verbose_name = ("user")
        verbose_name_plural = ("users")


class UserToken(models.Model):
    phone_number = models.CharField(max_length=20, null=True, blank=True)
    token = models.CharField(max_length=10, null=True, blank=True)
    password = models.CharField(max_length=30, null=True, blank=True)


