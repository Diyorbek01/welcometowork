from django.db import models
# Create your models here.
from client.user.models import User
from helpers.models import BaseModel
from registration.models import SubCategory, Category


class Post(BaseModel):
    STATUS = (
        ("sent", "sent"),
        ("approved", "approved"),
        ("going", "going"),
        ("finished", "finished"),
        ("archived", "archived"),
        ("canceled", "canceled"),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    headline = models.CharField(max_length=300)
    status = models.CharField(max_length=20, choices=STATUS, default="sent")
    extra_skills = models.CharField(max_length=300, null=True, blank=True)
    categories = models.ManyToManyField(Category, blank=True)
    skills = models.ManyToManyField(SubCategory, blank=True)
    is_hourly = models.BooleanField()
    is_new = models.BooleanField(default=True)
    is_delete = models.BooleanField(default=False)
    is_active = models.BooleanField(default=False)
    hourly_from_budget = models.BigIntegerField(null=True, blank=True)
    hourly_to_budget = models.BigIntegerField(null=True, blank=True)
    maximum_project_budget = models.BigIntegerField(null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    address = models.CharField(max_length=350, null=True, blank=True)
    duration = models.FloatField(null=True, blank=True)
    latitude = models.FloatField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)

    def __str__(self):
        return self.headline



class PostImage(BaseModel):
    image = models.ImageField(upload_to='posts/', null=True)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.post.headline} | {self.image.name}"


class Wishlist(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE, null=True, blank=True)
    is_like = models.BooleanField(default=True)


class Timer(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    start = models.DateTimeField(null=True)
    pause = models.DateTimeField(null=True)
    finish = models.DateTimeField(null=True)
    price = models.BigIntegerField(null=True)
    total_price = models.BigIntegerField(null=True)
