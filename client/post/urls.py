from django.urls import path
from rest_framework import routers
from rest_framework.routers import DefaultRouter
from .views import *
from ..notification import NotificationViewSet
from ..statistic import StatisticViewSet

router = DefaultRouter()

router.register('post', PostViewset, basename='PostViewset')
router.register('post-images', PostImageViewset, basename='PostImageViewset')
router.register('wishlist', WishlistViewSet, basename='WishlistViewSet')
router.register('notification', NotificationViewSet, basename='NotificationViewSet')
router.register('statistic', StatisticViewSet, basename='StatisticViewSet')
