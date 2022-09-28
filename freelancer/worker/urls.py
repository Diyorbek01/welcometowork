from django.urls import path
from rest_framework import routers
from rest_framework.routers import DefaultRouter
from .views import *


router = DefaultRouter()

router.register('worker', WorkerViewset, basename='WorkerViewset')
router.register('portfolio', PortfolioViewset, basename='PortfolioViewset')
router.register('portfolio-images', PortfolioImageViewset, basename='PortfolioImageViewset')
