from django.db.models import Avg
from django.utils.timezone import now
from rest_framework import serializers

from client.post.models import Post, PostImage, Wishlist, Timer
from freelancer.proposals.models import Proposal, Review
from freelancer.proposals.serializers import ReviewGetSerializer, ProposalForPostDetailsSerializer
from freelancer.worker.serializers import WorkerGetLessSerializer
from registration.serializers import SubCategoryGetSerializer, CategoryGetSerializer


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = '__all__'


class PostGetLessSerializer(serializers.ModelSerializer):
    user_full_name = serializers.SerializerMethodField()
    price = serializers.SerializerMethodField()
    image = serializers.SerializerMethodField()

    class Meta:
        model = Post
        fields = ['id', 'headline', "user", "status", "categories", "user_full_name", "price", "image", "is_active",
                  "created_at"]

    def get_user_full_name(self, obj):
        return obj.user.get_full_name()

    def get_price(self, obj):
        if obj.is_hourly:
            return f"{obj.hourly_from_budget}-{obj.hourly_to_budget}"
        else:
            return obj.maximum_project_budget

    def get_image(self, obj):
        images = PostImage.objects.filter(post_id=obj.id).first()
        if images:
            return images.image.url
        return None


class PostMenuSerializer(serializers.ModelSerializer):
    price = serializers.SerializerMethodField()
    image = serializers.SerializerMethodField()

    class Meta:
        model = Post
        fields = ['id', 'headline', 'created_at', "address", "price", "image", "categories", "is_hourly", 'status']

    def get_price(self, obj):
        if obj.is_hourly:
            return f"{obj.hourly_from_budget}-{obj.hourly_to_budget}"
        else:
            return str(obj.maximum_project_budget)

    def get_image(self, obj):
        images = PostImage.objects.filter(post_id=obj.id).first()
        if images:
            return images.image.url
        return None


class PostFinishedSerializer(serializers.ModelSerializer):
    review = serializers.SerializerMethodField()

    class Meta:
        model = Post
        fields = ['id', 'review']

    def get_review(self, obj):
        review = Review.objects.filter(post_id=obj.id, user_id=self.context['user_id'], is_client=True).first()
        serializer = ReviewGetSerializer(review)
        return serializer.data


class PostFinishedClientSerializer(serializers.ModelSerializer):
    review = serializers.SerializerMethodField()

    class Meta:
        model = Post
        fields = ['id', 'review']

    def get_review(self, obj):
        review = Review.objects.filter(post_id=obj.id, post__user_id=self.context['user_id'], is_client=False).first()
        serializer = ReviewGetSerializer(review)
        return serializer.data


class PostGetSerializer(serializers.ModelSerializer):
    skills = serializers.SerializerMethodField()
    images = serializers.SerializerMethodField()
    categories = serializers.SerializerMethodField()
    user = serializers.SerializerMethodField()
    proposals_number = serializers.SerializerMethodField()
    proposals = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField()
    passed_date = serializers.SerializerMethodField()
    client_status = serializers.SerializerMethodField()
    rating = serializers.SerializerMethodField()

    class Meta:
        model = Post
        fields = '__all__'

    def get_skills(self, obj):
        skills = obj.skills.all()
        serializer = SubCategoryGetSerializer(skills, many=True)
        return serializer.data

    def get_rating(self, obj):
        result = Review.objects.filter(post_id=obj.id).aggregate(avarage=Avg("rate"))
        if result['avarage']:
            return round(result['avarage'], 1)
        else:
            return 0

    def get_client_status(self, obj):
        user_id = self.context['user_id']
        proposals = Proposal.objects.filter(user_id=user_id, post_id=obj.id)
        if proposals:
            status = {
                "client_status": proposals.last().client_status,
                "admin_status": proposals.last().admin_status,
            }
            return status
        else:
            return None

    def get_reviews(self, obj):
        reviews = Review.objects.filter(post_id=obj.id)
        serializer = ReviewGetSerializer(reviews, many=True)
        return serializer.data

    def get_passed_date(self, obj):
        create_date = now() - obj.created_at
        data = {
            "days": create_date.days,
            "hours": create_date.seconds // 3600,
            "minutes": (create_date.seconds // 60) % 60,
        }
        return data

    def get_categories(self, obj):
        category = obj.categories.all()
        serializer = CategoryGetSerializer(category, many=True)
        return serializer.data

    def get_images(self, obj):
        post_images = PostImage.objects.filter(post_id=obj.id)
        serializer = PostImageGetSerializer(post_images, many=True)
        return serializer.data

    def get_proposals_number(self, obj):
        number = Proposal.objects.filter(post_id=obj.id).count()
        return number

    def get_proposals(self, obj):
        proposals = Proposal.objects.filter(post_id=obj.id, admin_status='approved')
        serializer = ProposalForPostDetailsSerializer(proposals, many=True)
        return serializer.data

    def get_user(self, obj):
        if obj.user.avatar:
            data = {
                "full_name": obj.user.get_full_name(),
                "is_online": obj.user.is_online,
                "avatar": obj.user.avatar.url
            }
        else:
            data = {
                "full_name": obj.user.get_full_name(),
                "is_online": obj.user.is_online,
                "avatar": None
            }
        return data


class PostClientGetSerializer(serializers.ModelSerializer):
    skills = serializers.SerializerMethodField()
    images = serializers.SerializerMethodField()
    categories = serializers.SerializerMethodField()
    user = serializers.SerializerMethodField()
    proposals_number = serializers.SerializerMethodField()
    proposals = serializers.SerializerMethodField()
    passed_date = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField()

    class Meta:
        model = Post
        exclude = ('is_new','is_delete','is_active','extra_skills')

    def get_skills(self, obj):
        skills = obj.skills.all()
        serializer = SubCategoryGetSerializer(skills, many=True)
        return serializer.data

    def get_reviews(self, obj):
        reviews = Review.objects.filter(post_id=obj.id)
        serializer = ReviewGetSerializer(reviews, many=True)
        return serializer.data


#    def get_client_status(self, obj):
#        user_id = self.context['user_id']
#        proposals = Proposal.objects.filter(user_id=user_id, post_id=obj.id)
#        if proposals:
#            status = {
#                "client_status": proposals.last().client_status,
#                "admin_status": proposals.last().admin_status,
#            }
#            return status
#        else:
#           return None

    def get_passed_date(self, obj):
        create_date = now() - obj.created_at
        data = {
            "days": create_date.days,
            "hours": create_date.seconds // 3600,
            "minutes": (create_date.seconds // 60) % 60,
        }
        return data

    def get_categories(self, obj):
        category = obj.categories.all()
        serializer = CategoryGetSerializer(category, many=True)
        return serializer.data

    def get_images(self, obj):
        post_images = PostImage.objects.filter(post_id=obj.id)
        serializer = PostImageGetSerializer(post_images, many=True)
        return serializer.data

    def get_proposals_number(self, obj):
        number = Proposal.objects.filter(post_id=obj.id).count()
        return number

    def get_proposals(self, obj):
        proposals = Proposal.objects.filter(post_id=obj.id, admin_status='approved')
        serializer = ProposalForPostDetailsSerializer(proposals, many=True)
        return serializer.data

    def get_user(self, obj):
        if obj.user.avatar:
            data = {
                "full_name": obj.user.get_full_name(),
                "is_online": obj.user.is_online,
                "avatar": obj.user.avatar.url
            }
        else:
            data = {
                "full_name": obj.user.get_full_name(),
                "is_online": obj.user.is_online,
                "avatar": None
            }
        return data


class PostImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostImage
        fields = '__all__'


class PostImagePostSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostImage
        fields = ['id', "image", "post"]

    def create(self, validated_data):
        image = validated_data.pop('image')
        data = validated_data.pop('post')
        return PostImage.objects.create(post=data, image=image)


class PostImageGetSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostImage
        fields = ['image']


class WishListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wishlist
        fields = "__all__"


class TimerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Timer
        fields = "__all__"


class TimerGetSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    post_title = serializers.SerializerMethodField()

    class Meta:
        model = Timer
        fields = "__all__"

    def get_user(self, obj):
        serializer = WorkerGetLessSerializer(obj.user)
        return serializer.data

    def get_post_title(self, obj):
        return obj.post.headline
