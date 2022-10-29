from django.db import models

# Create your models here.
from client.post.models import Post
from client.user.models import User
from freelancer.worker.models import Portfolio
from helpers.models import BaseModel


class Proposal(BaseModel):
    ADMIN_STATUS = (
        ("pending", "pending"),
        ("approved", "approved"),
        ("cancelled", "cancelled"),
    )
    CLIENT_STATUS = (
        ("pending", "pending"),
        ("approved", "approved"),
        ("cancelled", "cancelled"),
        ("archived", "archived"),
    )
    POST_STATUS = (
        ("pending", "pending"),
        ("approved", "approved"),
        ("going", "going"),
        ("finished", "finished"),
        ("cancelled", "cancelled"),
        ("archived", "archived"),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    description = models.TextField()
    price = models.BigIntegerField()
    is_new = models.BooleanField(default=True)
    admin_status = models.CharField(max_length=25, choices=ADMIN_STATUS, default='pending')
    client_status = models.CharField(max_length=25, choices=CLIENT_STATUS, default='pending')
    post_status = models.CharField(max_length=25, choices=CLIENT_STATUS, default='pending')

    def __str__(self):
        return f"{self.user.get_full_name()} | {self.post.headline}"


class Review(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE, null=True, blank=True)
    rate = models.PositiveIntegerField(default=0)
    comment = models.TextField()
    is_client = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.user.get_full_name()} | {self.comment}"


class Invoice(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    card = models.BigIntegerField(null=True, blank=True)
    date = models.CharField(max_length=5, null=True, blank=True)
    is_withdraw = models.BooleanField(default=True)
    amount = models.BigIntegerField()


class StatusChanges(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE, null=True, blank=True)
    proposal = models.ForeignKey(Proposal, on_delete=models.CASCADE, null=True, blank=True)
    portfolio = models.ForeignKey(Portfolio, on_delete=models.CASCADE, null=True, blank=True)
    from_status = models.CharField(max_length=25)
    to_status = models.CharField(max_length=25)
    is_post = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.from_status}->{self.to_status} | {self.user.get_full_name()}"

class Notification(BaseModel):
    STATUS = (
        ("post", "post"),
        ("proposal", "proposal"),
        ("custom", "custom"),
        ("archived", "archived"),
    )
    user = models.ManyToManyField(User, blank=True)
    post = models.ForeignKey(Post, on_delete=models.CASCADE, null=True, blank=True)
    proposal = models.ForeignKey(Proposal, on_delete=models.CASCADE, null=True, blank=True)
    title = models.CharField(max_length=200)
    status = models.CharField(max_length=200, choices=STATUS, default="post")
    body = models.TextField()
    is_new = models.BooleanField(default=True)

    def __str__(self):
        return self.title