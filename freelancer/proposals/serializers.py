from rest_framework import serializers

from client.post.models import Post, PostImage
from freelancer.proposals.models import Proposal, Review, Invoice, StatusChanges


class ProposalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proposal
        fields = '__all__'


class ProposalForPostDetailsSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    address = serializers.SerializerMethodField()

    class Meta:
        model = Proposal
        fields = ['id', "user", "address", 'description', 'created_at']

    def get_user(self, obj):
        if obj.user.avatar:
            data = {
                "id": obj.user.id,
                "full_name": obj.user.get_full_name(),
                "avatar": obj.user.avatar.url,
                "is_online": obj.user.is_online,
                "payment_hourly": obj.user.payment_hourly,
            }
        else:
            data = {
                "id": obj.user.id,
                "full_name": obj.user.get_full_name(),
                "avatar": None,
                "is_online": obj.user.is_online,
                "payment_hourly": obj.user.payment_hourly,
            }
        return data

    def get_address(self, obj):
        return obj.post.address


class ProposalGetSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    post_title = serializers.SerializerMethodField()
    post_price = serializers.SerializerMethodField()
    address = serializers.SerializerMethodField()

    class Meta:
        model = Proposal
        fields = ['id', "post_title", "user", "price", "address", "post_price", 'created_at']

    def get_user(self, obj):
        if obj.user.avatar:
            data = {
                "full_name": obj.user.get_full_name(),
                "avatar": obj.user.avatar.url,
                "title": obj.user.title,
                "is_online": obj.user.is_online,
            }
        else:
            data = {
                "full_name": obj.user.get_full_name(),
                "avatar": None,
                "title": obj.user.title,
                "is_online": obj.user.is_online,
            }
        return data

    def get_post_title(self, obj):
        return obj.post.headline

    def get_post_price(self, obj):
        if obj.post.is_hourly:
            data = dict(
                is_hourly=True,
                from_price=obj.post.hourly_from_budget,
                to_price=obj.post.hourly_to_budget,
            )
        else:
            data = dict(
                is_hourly=False,
                price=obj.post.maximum_project_budget
            )
        return data

    def get_address(self, obj):
        return obj.post.address


class PostMenuSerializer(serializers.ModelSerializer):
    price = serializers.SerializerMethodField()
    image = serializers.SerializerMethodField()

    class Meta:
        model = Post
        fields = ['id', 'headline', 'created_at', "address", "price", "image", "categories", "is_hourly"]

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


class ProposalPostSerializer(serializers.ModelSerializer):
    posts = serializers.SerializerMethodField()

    class Meta:
        model = Proposal
        # fields = "__all__"
        fields = ['id', "admin_status", "client_status", "posts"]

    def get_posts(self, obj):
        serializer = PostMenuSerializer(obj.post)
        return serializer.data


class ProposalGetDetailsSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    client_name = serializers.SerializerMethodField()
    post_title = serializers.SerializerMethodField()
    post_price = serializers.SerializerMethodField()
    address = serializers.SerializerMethodField()

    class Meta:
        model = Proposal
        fields = ['id', "post_title", "user", "price", "address", "post_price", "client_name", "description",
                  'created_at', "admin_status", "client_status"]

    def get_user(self, obj):
        if obj.user.avatar:
            data = {
                "user_id": obj.user.id,
                "is_online": obj.user.is_online,
                "full_name": obj.user.get_full_name(),
                "avatar": obj.user.avatar.url
            }
        else:
            data = {
                "user_id": obj.user.id,
                "is_online": obj.user.is_online,
                "full_name": obj.user.get_full_name(),
                "avatar": None
            }
        return data

    def get_post_title(self, obj):
        data = dict(
            post_id=obj.post.id,
            post_title=obj.post.headline,
        )
        return data

    def get_client_name(self, obj):
        data = dict(
            user_id=obj.post.user_id,
            user_name=obj.post.user.get_full_name(),
        )
        return data

    def get_post_price(self, obj):
        if obj.post.is_hourly:
            data = dict(
                is_hourly=True,
                from_price=obj.post.hourly_from_budget,
                to_price=obj.post.hourly_to_budget,
            )
        else:
            data = dict(
                is_hourly=False,
                price=obj.post.maximum_project_budget
            )
        return data

    def get_address(self, obj):
        return obj.post.address


class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review
        fields = '__all__'


class ReviewGetSerializer(serializers.ModelSerializer):
    worker = serializers.SerializerMethodField()
    client = serializers.SerializerMethodField()
    price = serializers.SerializerMethodField()

    class Meta:
        model = Review
        fields = ['id', 'rate', 'comment', "worker", "client", "created_at", 'price']

    def get_worker(self, obj):
        return obj.user.get_full_name()

    def get_client(self, obj):
        return obj.post.user.get_full_name()

    def get_price(self, obj):
        if obj.post.is_hourly:
            data = {
                "is_hourly": obj.post.is_hourly,
                "hourly_from_budget": obj.post.hourly_from_budget,
                "hourly_to_budget": obj.post.hourly_to_budget,
            }
        else:
            data = {
                "is_hourly": obj.post.is_hourly,
                "maximum_project_budget": obj.post.maximum_project_budget,
            }
        return data


class InvoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Invoice
        fields = "__all__"



class StatusChangeSerializer(serializers.ModelSerializer):
    class Meta:
        model = StatusChanges
        fields = "__all__"
