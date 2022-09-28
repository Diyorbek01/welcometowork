from rest_framework import serializers
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import User

from registration.models import Category, SubCategory, Region, City


class CategoryLessSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', "name"]


class CategorySerializer(serializers.ModelSerializer):
    image = serializers.SerializerMethodField()
    skills = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = '__all__'

    def get_image(self, obj):
        if obj.image:
            return obj.image.url
        return None

    def get_skills(self, obj):
        skills = SubCategory.objects.filter(category_id=obj.id)
        serializer = SubCategoryGetSerializer(skills, many=True)
        return serializer.data


class CategoryPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class CategoryGetSerializer(serializers.ModelSerializer):
    images = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = ['id', "name", 'images']

    def get_images(self, obj):
        if obj.image:
            return obj.image.url
        return None


class SubCategorySerializer(serializers.ModelSerializer):
    category = serializers.SerializerMethodField()

    class Meta:
        model = SubCategory
        fields = "__all__"

    def get_category(self, obj):
        return obj.category.name


class SubCategoryGetSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = ["id", "name"]


class SubCategoryPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = "__all__"


class RegionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Region
        fields = '__all__'


class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = ['id', 'name']
