from django.db.models import Avg
from rest_framework import serializers

from client.user.models import User
from freelancer.proposals.models import Review, Invoice
from freelancer.proposals.serializers import ReviewGetSerializer
from freelancer.worker.models import Portfolio, PortfolioImage
from registration.serializers import RegionSerializer, CitySerializer, SubCategorySerializer, \
    CategoryGetSerializer


class WorkerSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class WorkerGetLessSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', "first_name", "last_name", "avatar", "role"]


class WorkerGetPopularSerializer(serializers.ModelSerializer):
    rating = serializers.SerializerMethodField()
    region = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', "first_name", "last_name", "avatar", "role", "rating", 'title', 'payment_hourly', 'region']

    def get_rating(self, obj):
        result = Review.objects.filter(user_id=obj.id, is_client=True).aggregate(avarage=Avg("rate"))
        if result['avarage']:
            return round(result['avarage'], 1)
        else:
            return 0.0

    def get_region(self, obj):
        if obj.region:
            return obj.region.name
        return None


class WorkerGetProposalSerializer(serializers.ModelSerializer):
    rating = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField()
    portfolio = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', "first_name", "last_name", "avatar", "role", "rating", 'title', 'overview', 'payment_hourly',
                  'reviews', 'portfolio', 'total_earnings']

    def get_rating(self, obj):
        result = Review.objects.filter(user_id=obj.id, is_client=True).aggregate(avarage=Avg("rate"))
        if result['avarage']:
            return round(result['avarage'], 1)
        else:
            return 0.0

    def get_reviews(self, obj):
        reviews = Review.objects.filter(user_id=obj.id, is_client=True)
        serializer = ReviewGetSerializer(reviews, many=True)
        return serializer.data

    def get_portfolio(self, obj):
        portfolios = Portfolio.objects.filter(user_id=obj.id, status='approved')
        serializer = PortfolioSerializer(portfolios, many=True)
        return serializer.data


class WorkerGetSerializer(serializers.ModelSerializer):
    region = RegionSerializer()
    city = CitySerializer()
    skills = serializers.SerializerMethodField()
    categories = serializers.SerializerMethodField()
    portfolio = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField()
    rating = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', 'username', 'first_name', 'last_name', 'phone_number', 'password', 'title', 'overview',
                  'payment_hourly', 'street', 'role', 'avatar', 'created_at', 'updated_at', 'region', 'city', 'skills',
                  'portfolio', "telegram", "experience", "categories", "is_online", "reviews", "rating"]

    def get_rating(self, obj):
        result = Review.objects.filter(user_id=obj.id, is_client=True).aggregate(avarage=Avg("rate"))
        if result['avarage']:
            return round(result['avarage'], 1)
        else:
            return 0.0

    def get_skills(self, obj):
        skills_list = obj.skills.all()
        serializer = SubCategorySerializer(skills_list, many=True)
        return serializer.data

    def get_reviews(self, obj):
        reviews = Review.objects.filter(user_id=obj.id, is_client=True)
        serializer = ReviewGetSerializer(reviews, many=True)
        return serializer.data

    def get_categories(self, obj):
        categories_list = obj.categories.all()
        serializer = CategoryGetSerializer(categories_list, many=True)
        return serializer.data

    def get_portfolio(self, obj):
        portfolios = Portfolio.objects.filter(user_id=obj.id)
        serializer = PortfolioSerializer(portfolios, many=True)
        return serializer.data


class WorkerGetProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "is_online", "title", "phone_number", "telegram", 'avatar',
                  'overview', 'balance', "total_spent", 'total_earnings']


class InvoiceGetSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()

    class Meta:
        model = Invoice
        fields = ["id", 'user', 'created_at', 'amount', 'is_withdraw']

    def get_user(self, obj):
        user = obj.user
        serializer = WorkerGetLessSerializer(user)
        return serializer.data


class PortfolioSerializer(serializers.ModelSerializer):
    images = serializers.SerializerMethodField()

    class Meta:
        model = Portfolio
        fields = '__all__'

    def get_images(self, obj):
        images = PortfolioImage.objects.filter(portfolio_id=obj.id)
        serializer = PortfolioGetImageSerializer(images, many=True)
        return serializer.data


class PortfolioGetSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    images = serializers.SerializerMethodField()

    class Meta:
        model = Portfolio
        fields = ['id', 'headline', 'status', 'description', 'is_new', 'date', 'user', "created_at", "images"]

    def get_user(self, obj):
        if obj.user.avatar:
            data = {
                "id": obj.user.id,
                "full_name": obj.user.get_full_name(),
                "avatar": obj.user.avatar.url,
                "title": obj.user.title,
                "is_online": obj.user.is_online,
            }
        else:
            data = {
                "id": obj.user.id,
                "full_name": obj.user.get_full_name(),
                "title": obj.user.title,
                "is_online": obj.user.is_online,
                "avatar": None
            }
        return data

    def get_images(self, obj):
        images = PortfolioImage.objects.filter(portfolio_id=obj.id)
        serializer = PortfolioGetImageSerializer(images, many=True)
        return serializer.data


class PortfolioImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = PortfolioImage
        fields = '__all__'


class PortfolioGetImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = PortfolioImage
        fields = ['image']
