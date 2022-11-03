from django.db.models import Q
from rest_framework import serializers

from client.post.models import Post
from client.user.models import User
from freelancer.proposals.models import Proposal
from registration.models import Category, SubCategory, Region, City


class CategoryLessSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', "name", "name_ru"]


class CategorySerializer(serializers.ModelSerializer):
    image = serializers.SerializerMethodField()
    skills = serializers.SerializerMethodField()
    number_of_workers = serializers.SerializerMethodField()
    number_of_posts = serializers.SerializerMethodField()
    number_of_proposals = serializers.SerializerMethodField()

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

    def get_number_of_workers(self, obj):
        return User.objects.filter(role='freelancer', is_delete=False, categories__in=[obj.id]).count()

    def get_number_of_posts(self, obj):
        return Post.objects.filter(Q(status='approved') | Q(status='going'), is_delete=False,
                                   categories__in=[obj.id]).count()

    def get_number_of_proposals(self, obj):
        return Proposal.objects.filter(Q(post_status='approved') | Q(post_status='going'),
                                       post__categories__in=[obj.id]).count()


class CategoryPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class CategoryGetSerializer(serializers.ModelSerializer):
    images = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = ['id', "name", "name_ru", 'images']

    def get_images(self, obj):
        if obj.image:
            return obj.image.url
        return None


class SubCategorySerializer(serializers.ModelSerializer):
    category = serializers.SerializerMethodField()
    category_ru = serializers.SerializerMethodField()

    class Meta:
        model = SubCategory
        fields = "__all__"

    def get_category(self, obj):
        return obj.category.name

    def get_category_ru(self, obj):
        return obj.category.name_ru


class SubCategoryGetSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = ["id", "name", "name_ru"]


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
