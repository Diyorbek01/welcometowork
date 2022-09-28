from rest_framework import serializers
from client.post.models import Post, PostImage, Wishlist
from client.post.serializers import PostImageGetSerializer
from client.user.models import User
from freelancer.proposals.models import Proposal
from freelancer.worker.models import Portfolio
from registration.serializers import SubCategoryGetSerializer, CategoryGetSerializer


class PostMenuSerializer(serializers.ModelSerializer):
    type = serializers.SerializerMethodField()
    post_id = serializers.SerializerMethodField()

    class Meta:
        model = Post
        fields = ['post_id', 'headline', 'created_at', "type", "is_new"]

    def get_type(self, obj):
        return "post"

    def get_post_id(self, obj):
        return obj.id


class ProposalGetSerializer(serializers.ModelSerializer):
    type = serializers.SerializerMethodField()
    proposal_id = serializers.SerializerMethodField()

    class Meta:
        model = Proposal
        fields = ['proposal_id', "description", 'created_at', "type", "is_new"]

    def get_type(self, obj):
        return "proposal"

    def get_proposal_id(self, obj):
        return obj.id


class WorkerGetSerializer(serializers.ModelSerializer):
    type = serializers.SerializerMethodField()
    freelancer_id = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['freelancer_id', 'first_name', "last_name", "role", "phone_number", "created_at", "type", "is_new"]

    def get_type(self, obj):
        return "freelancer"

    def get_freelancer_id(self, obj):
        return obj.id


class ClientGetSerializer(serializers.ModelSerializer):
    type = serializers.SerializerMethodField()
    client_id = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['client_id', 'first_name', "last_name", "role", "phone_number", "created_at", "type", "is_new"]

    def get_type(self, obj):
        return "client"

    def get_client_id(self, obj):
        return obj.id


class PortfolioGetSerializer(serializers.ModelSerializer):
    type = serializers.SerializerMethodField()
    portfolio_id = serializers.SerializerMethodField()

    class Meta:
        model = Portfolio
        fields = ['portfolio_id', "headline", "created_at", "type"]

    def get_type(self, obj):
        return "portfolio"


    def get_portfolio_id(self, obj):
        return obj.id
