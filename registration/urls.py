from rest_framework import routers
from rest_framework.routers import DefaultRouter

from registration.views import CategoryViewset, SubCategoryViewset, RegionsViewset, CityViewset

router = DefaultRouter()

router.register('category', CategoryViewset, basename='CategoryViewset')
router.register('sub-category', SubCategoryViewset, basename='SubCategoryViewset')
router.register('regions', RegionsViewset, basename='RegionsViewset')
router.register('city', CityViewset, basename='CityViewset')