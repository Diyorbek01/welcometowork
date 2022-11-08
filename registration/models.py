from django.db import models

# Create your models here.
from helpers.models import BaseModel


class Category(BaseModel):
    STATUS = (
        ("active", "active"),
        ("deactive", "deactive"),
    )
    name = models.CharField(max_length=200)
    name_ru = models.CharField(max_length=200)
    status = models.CharField(choices=STATUS, default="active", max_length=20)
    image = models.FileField(upload_to="category/", max_length=200, null=True)

    def __str__(self):
        return self.name


class SubCategory(BaseModel):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=150)
    name_ru = models.CharField(max_length=150)

    def __str__(self):
        return self.name


class Region(BaseModel):
    name = models.CharField(max_length=150)
    name_ru = models.CharField(max_length=150, null=True)

    def __str__(self):
        return self.name


class City(BaseModel):
    region = models.ForeignKey(Region, on_delete=models.CASCADE)
    name = models.CharField(max_length=150)
    name_ru = models.CharField(max_length=150, null=True)

    def __str__(self):
        return self.name
