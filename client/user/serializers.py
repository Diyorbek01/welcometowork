from django.db.models import Avg, Sum, Q
from rest_framework import serializers

from client.post.models import Post
from client.user.models import User
from freelancer.proposals.models import Review, Proposal, Notification
from freelancer.proposals.serializers import ReviewGetSerializer
from freelancer.worker.models import Portfolio
from freelancer.worker.serializers import PortfolioSerializer


class UserSerializer(serializers.ModelSerializer):
    region = serializers.SerializerMethodField()
    city = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField()
    rating = serializers.SerializerMethodField()
    total_amount_posts = serializers.SerializerMethodField()
    number_of_posts = serializers.SerializerMethodField()
    number_of_recieved_proposals = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', 'first_name', "last_name", "phone_number", 'avatar', "region", "city", 'street', 'role',
                  "created_at", "telegram", "is_online", "reviews", "rating", "balance", "total_spent",
                  "total_amount_posts", "number_of_posts", "number_of_recieved_proposals"]
        # fields = '__all__'

    def get_rating(self, obj):
        result = Review.objects.filter(post__user_id=obj.id, is_client=False).aggregate(avarage=Avg("rate"))
        if result['avarage']:
            return round(result['avarage'], 1)
        else:
            return 0.0

    def get_reviews(self, obj):
        reviews = Review.objects.filter(post__user_id=obj.id, is_client=False).order_by('-id')
        serializer = ReviewGetSerializer(reviews, many=True)
        return serializer.data

    def get_region(self, obj):
        if obj.region:
            return obj.region.name
        return None

    def get_city(self, obj):
        if obj.city:
            return obj.city.name
        return None

    def get_total_amount_posts(self, obj):
        posts = Post.objects.filter(user_id=obj.id, status="finished")
        result = 0
        for post in posts:
            if post.is_hourly:
                try:
                    result += \
                        Proposal.objects.filter(post=post, post_status="finished").aggregate(total_sum=Sum('price'))[
                            'total_sum']
                except:
                    pass
            else:
                try:
                    result += Post.objects.filter(user_id=obj.id, status="finished").aggregate(
                        total_sum=Sum('maximum_project_budget'))['total_sum']
                except:
                    pass
        return result

    def get_number_of_posts(self, obj):
        return Post.objects.filter(~Q(status="archived"), ~Q(status="canceled"), ~Q(status="sent"), user_id=obj.id).count()

    def get_number_of_recieved_proposals(self, obj):
        return Proposal.objects.filter(post__user_id=obj.id, client_status="approved").count()


class UserProposalGetSerializer(serializers.ModelSerializer):
    portfolios = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', 'first_name', "last_name", 'avatar', 'title', "role", "total_earnings", 'overview',
                  'portfolios', 'reviews']

    def get_portfolios(self, obj):
        user_id = obj.id
        portfolios = Portfolio.objects.filter(user_id=user_id)
        serializer = PortfolioSerializer(portfolios, many=True)
        return serializer.data

    def get_reviews(self, obj):
        reviews = Review.objects.filter(user_id=obj.id, is_client=False)
        serializer = ReviewGetSerializer(reviews, many=True)
        return serializer.data


class UserGetSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', "last_name", 'avatar', "role"]


class UserProfileUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', "last_name", 'avatar', "role", 'phone_number', 'password']


class UserPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        # fields = ['id', 'first_name', "last_name","phone_number", 'avatar', "region", "city", 'street', 'role', "created_at",
        #           "telegram"]
        fields = '__all__'


class ProposalGetUserSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    client_name = serializers.SerializerMethodField()
    portfolio = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField()

    class Meta:
        model = Proposal
        fields = ['id', "user", "price", "client_name", "description",
                  'created_at', "admin_status", "client_status", 'portfolio', 'reviews']

    def get_user(self, obj):
        if obj.user.avatar:
            data = {
                "user_id": obj.user.id,
                "title": obj.user.title,
                "overview": obj.user.overview,
                "is_online": obj.user.is_online,
                "full_name": obj.user.get_full_name(),
                "avatar": obj.user.avatar.url
            }
        else:
            data = {
                "user_id": obj.user.id,
                "is_online": obj.user.is_online,
                "overview": obj.user.overview,
                "title": obj.user.title,
                "full_name": obj.user.get_full_name(),
                "avatar": None
            }
        return data

    def get_reviews(self, obj):
        reviews = Review.objects.filter(user_id=obj.user.id, is_client=True)
        serializer = ReviewGetSerializer(reviews, many=True)
        return serializer.data

    def get_client_name(self, obj):
        data = dict(
            user_id=obj.post.user_id,
            user_name=obj.post.user.get_full_name(),
        )
        return data

    def get_portfolio(self, obj):
        user_id = obj.user.id
        portfolios = Portfolio.objects.filter(user_id=user_id)
        serializer = PortfolioSerializer(portfolios)
        return serializer.data


class ProposalUserDetailsSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    created_at = serializers.SerializerMethodField()

    class Meta:
        model = Proposal
        fields = ['id', "user", "price", "description",
                  'created_at', "admin_status", "client_status"]

    def get_user(self, obj):
        serializer = UserProposalGetSerializer(obj.user)
        return serializer.data

    def get_created_at(self, obj):
        return obj.created_at


class NotificationMobileSerializer(serializers.ModelSerializer):
    post = serializers.SerializerMethodField(read_only=True)
    proposal = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Notification
        fields = "__all__"

    def get_post(self, obj):
        if obj.post:
            if obj.post.user.region:
                return dict(
                    id=obj.post.id,
                    headline=obj.post.headline,
                    region=obj.post.region.name,
                    price=f"{obj.post.hourly_from_budget}-{obj.post.hourly_from_budget}",
                    is_hourly=obj.post.is_hourly
                )

            else:
                return dict(
                    id=obj.post.id,
                    headline=obj.post.headline,
                    region=None,
                    price=str(obj.post.maximum_project_budget),
                    is_hourly=obj.post.is_hourly
                )

        return None

    def get_proposal(self, obj):
        if obj.proposal:
            return dict(
                id=obj.proposal.id,
                price=obj.proposal.price,
                user={
                    "id": obj.proposal.user_id,
                    "full_name": obj.proposal.user.get_full_name(),
                    "overview": obj.proposal.user.overview,
                    "region": obj.proposal.user.region.name
                },
            )
        return None
