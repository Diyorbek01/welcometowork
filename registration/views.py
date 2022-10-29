from django.db.models import Count
from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, authentication, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK

from client.user.models import User
from registration.models import Category, SubCategory, Region, City
from registration.serializers import CategorySerializer, SubCategorySerializer, RegionSerializer, CitySerializer, \
    CategoryPostSerializer, SubCategoryPostSerializer, CategoryLessSerializer


class CategoryViewset(viewsets.ModelViewSet):
    queryset = Category.objects.all().order_by('-id')
    serializer_class = CategoryPostSerializer

    @action(methods=['get'], detail=False)
    def get(self, request):
        categories = Category.objects.all().order_by('-id')
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data)

    @action(methods=['get'], detail=False)
    def get_popular(self, request):
        categories = User.objects.values("categories").annotate(count=Count('categories')).order_by("-count")
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data)

    @action(methods=['get'], detail=False)
    def get_all(self, request):
        categories = Category.objects.all().order_by('-id')
        serializer = CategoryLessSerializer(categories, many=True)
        return Response(serializer.data)

    @action(methods=['get'], detail=False)
    def get_details(self, request):
        id = request.GET.get("id")
        category = Category.objects.get(id=id)
        serializer = CategorySerializer(category)
        return Response(serializer.data)


class SubCategoryViewset(viewsets.ModelViewSet):
    queryset = SubCategory.objects.all()
    serializer_class = SubCategoryPostSerializer

    @action(methods=['get'], detail=False)
    def get(self, request):
        category_id = request.GET.get("category_id", None)
        category = category_id.split(',')

        subcategories = SubCategory.objects.filter(category_id__in=category)
        serializer = SubCategorySerializer(subcategories, many=True)
        return Response(serializer.data, status=HTTP_200_OK)


class RegionsViewset(viewsets.ModelViewSet):
    queryset = Region.objects.all()
    serializer_class = RegionSerializer


class CityViewset(viewsets.ModelViewSet):
    queryset = City.objects.all()
    serializer_class = CitySerializer

    @action(methods=['get'], detail=False)
    def get(self, request):
        region_id = request.GET.get("region_id", None)
        cities = City.objects.filter(region_id=region_id)
        serializer = CitySerializer(cities, many=True)
        return Response(serializer.data, status=HTTP_200_OK)
