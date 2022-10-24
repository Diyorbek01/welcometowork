from django.db import models

# Create your models here.
from client.post.models import Post
from client.user.models import User
from helpers.models import BaseModel


class Portfolio(BaseModel):
    STATUS = (
        ("pending", "pending"),
        ("approved", "approved"),
        ("canceled", "canceled"),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    headline = models.CharField(max_length=300)
    status = models.CharField(max_length=20, choices=STATUS, default="pending")
    description = models.TextField()
    is_new = models.BooleanField(default=True)
    date = models.DateTimeField()

    def __str__(self):
        return self.headline


class PortfolioImage(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='portfolio')
    portfolio = models.ForeignKey(Portfolio, on_delete=models.CASCADE)



