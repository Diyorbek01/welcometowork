import base64

from decouple import config
from django.core.files.base import ContentFile
# Create your views here.
from rest_framework import viewsets, authentication, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST, HTTP_201_CREATED

import messages
from client.post.models import Post, PostImage, Wishlist, Timer
from client.post.serializers import PostImageSerializer, PostGetLessSerializer, \
    PostMenuSerializer, WishListSerializer, PostFinishedSerializer, PostFinishedClientSerializer, \
    PostClientGetSerializer, TimerSerializer, TimerGetSerializer, PostImagePostSerializer, PostSerializer
from freelancer.proposals.models import Proposal, StatusChanges, Review, Notification
from pusher import send_message


class PostViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = Post.objects.filter(is_delete=False).order_by("-is_active", "-id")
    serializer_class = PostGetLessSerializer

    @action(methods=['get'], detail=False)
    def get_all(self, request):
        post = Post.objects.filter(is_delete=False, status='approved')
        serializer = PostMenuSerializer(post, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_finished(self, request):
        user_id = request.user.id
        context = {"user_id": user_id}
        role = request.user.role
        post = Post.objects.filter(user_id=user_id, is_delete=False, status='finished')

        proposals = []
        if role == "freelancer":
            for i in post:
                proposals.append(Review.objects.filter(post_id=i.id, user_id=user_id, is_client=True))
            if proposals != []:
                serializer = PostFinishedSerializer(post, many=True, context=context)
                return Response(serializer.data, status=HTTP_200_OK)
            return Response([], status=HTTP_200_OK)
        elif role == 'client':
            for i in post:
                proposals.append(Review.objects.filter(post_id=i.id, user_id=user_id, is_client=False))
            if proposals != []:
                serializer = PostFinishedClientSerializer(post, many=True, context=context)
                return Response(serializer.data, status=HTTP_200_OK)
            return Response([], status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_by_user(self, request):
        user_id = request.user.id
        post = Post.objects.filter(user_id=user_id, is_delete=False)
        serializer = PostMenuSerializer(post, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def filter_by_category(self, request):
        category_id = request.GET.get("category_id")
        post = Post.objects.filter(categories__in=category_id, is_delete=False, status='approved')
        serializer = PostMenuSerializer(post, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def filter_web(self, request):
        category_id = request.GET.get("category_id", None)
        status = request.GET.get("status", None)
        user_id = request.GET.get("user_id", None)
        start_date = request.GET.get('start_date', None)
        finish_date = request.GET.get('finish_date', None)
        post = Post.objects.all().order_by("-is_active", "-id").distinct()
        if category_id:
            categories_id = category_id.split(',')
            post = post.filter(categories__in=categories_id, is_delete=False).order_by("-is_active",
                                                                                       "-id").distinct()
        if status:
            post = post.filter(status=status, is_delete=False).order_by("-is_active", "-id").distinct()
        if user_id:
            post = post.filter(user_id=user_id, is_delete=False).order_by("-is_active", "-id").distinct()
        if start_date and finish_date:
            post = post.filter(created_at__gt=start_date, created_at__lte=finish_date,
                               is_delete=False).order_by("-is_active", "-id").distinct()
        serializer = PostGetLessSerializer(post, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_details(self, request):
        post_id = request.GET.get("post_id")
        user_id = request.user.id
        post = Post.objects.get(id=post_id)
        serializer = PostClientGetSerializer(post, context={"user_id": user_id})
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['post'], detail=False)
    def create_post(self, request):
        price = int(config('POST_PRICE'))
        balance = request.user.balance
        if (balance - price) > 0:
            data = request.data
            serializer = PostSerializer(data=data)
            if serializer.is_valid():
                serializer.is_valid(raise_exception=True)
                serializer.save()
                images = request.FILES.getlist("image")
                for image in images:
                    data = dict(
                        image=image,
                        post=serializer.data.get("id")
                    )
                    ser = PostImagePostSerializer(data=data)
                    if ser.is_valid():
                        ser.save()
                return Response(serializer.data, status=HTTP_201_CREATED)
            return Response(serializer.errors, status=HTTP_400_BAD_REQUEST)
        else:
            return Response({"message": "Hisobingizda mablag' yetarli emas!"}, status=402)

    @action(methods=['get'], detail=False)
    def change_status(self, request):
        status = request.GET.get("status", None)
        post_id = request.GET.get("post_id", None)
        post = Post.objects.get(id=post_id)
        proposal = Proposal.objects.filter(post_id=post_id, user_id=request.user.id, admin_status="approved",
                                           client_status="approved")
        if proposal.exists():
            if status == "finished" and post.is_hourly == False:
                request.user.total_earnings += post.maximum_project_budget
                request.user.save()
                send_message(post.user.token, messages.data['post_title'], messages.data['finished_post'])
                Notification.objects.create(
                    user=post.user,
                    proposal=proposal.last(),
                    title=messages.data['post_title'],
                    body=messages.data['finished_post'],
                )
            status_changes = StatusChanges.objects.create(
                user=request.user,
                from_status=post.status,
                to_status=status,
                post=post
            )
            post.status = status
            post.save()
            if status == "canceled":
                post.user.balance += int(config['POST_PRICE'])
                post.user.save()
                send_message(post.user.token, messages.data['post_title'], messages.data['cancelled_post'])
                Notification.objects.create(
                    user=post.user,
                    proposal=proposal.last(),
                    title=messages.data['post_title'],
                    body=messages.data['cancelled_post'],
                )
                status_changes = StatusChanges.objects.create(
                    user=request.user,
                    from_status=post.status,
                    to_status=status,
                    post=post
                )
                post.status = status
                post.save()
            elif status == 'approved':
                send_message(post.user.token, messages.data['post_title'], messages.data['confirm_post'])
                Notification.objects.create(
                    user=post.user,
                    proposal=proposal.last(),
                    title=messages.data['post_title'],
                    body=messages.data['confirm_post'],
                )
                status_changes = StatusChanges.objects.create(
                    user=request.user,
                    from_status=post.status,
                    to_status=status,
                    post=post
                )
                post.status = status
                post.save()
            elif status == 'going':
                send_message(post.user.token, messages.data['post_title'], messages.data['going_post'])
                Notification.objects.create(
                    user=post.user,
                    proposal=proposal.last(),
                    title=messages.data['post_title'],
                    body=messages.data['going_post'],
                )
                status_changes = StatusChanges.objects.create(
                    user=request.user,
                    from_status=post.status,
                    to_status=status,
                    post=post
                )
                post.status = status
                post.save()
            return Response("Changed", status=HTTP_200_OK)
        return Response("Post not found", status=HTTP_400_BAD_REQUEST)

    @action(methods=['delete'], detail=False)
    def delete(self, request):
        post_id = request.GET.get('post_id')
        post = Post.objects.get(id=post_id)
        post.is_delete = True
        post.save()
        return Response("Post muvaffaqiyatli o'chirildi")

    @action(methods=['get'], detail=False)
    def get_post_price(self, request):
        post_id = request.GET.get('post_id')
        proposal = Proposal.objects.filter(post_id=post_id, admin_status='approved', client_status='approved')
        if proposal.exists():
            data = dict(
                post_id=proposal.last().post.id,
                post_title=proposal.last().post.headline,
                price=proposal.last().price,
            )
            return Response(data, status=HTTP_200_OK)
        return Response({'message': "Post topilmadi"}, status=HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=False)
    def start_timer(self, request):
        data = request.data
        serializer = TimerSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=HTTP_201_CREATED)
        return Response(serializer.errors, status=HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=False)
    def finish_timer(self, request):
        data = request.data
        serializer = TimerSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=HTTP_201_CREATED)
        return Response(serializer.errors, status=HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False)
    def get_timer_list(self, request):
        timers = Timer.objects.all().order_by('created_at')
        serializer = TimerGetSerializer(timers, many=True)
        return Response(serializer.data, status=HTTP_200_OK)


class PostImageViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = PostImage.objects.all()
    serializer_class = PostImageSerializer


class WishlistViewSet(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = Wishlist.objects.all()
    serializer_class = WishListSerializer

    @action(methods=['post'], detail=False)
    def post(self, request):
        user_id = request.user.id
        post_id = request.data.get("post_id", None)
        wishlist = Wishlist.objects.filter(user_id=user_id, post_id=post_id)
        if wishlist.exists():
            instance_wishlist = wishlist.last()
            if instance_wishlist.is_like == True:
                instance_wishlist.is_like = False
                instance_wishlist.save()
                return Response({"is_like": False}, 201)
            elif instance_wishlist.is_like == False:
                instance_wishlist.is_like = True
                instance_wishlist.save()
                return Response({"is_like": True}, 201)
        else:
            result = Wishlist.objects.create(
                post_id=post_id,
                user_id=user_id,
            )
        return Response({"is_like": True}, 201)

    @action(methods=['get'], detail=False)
    def get(self, request):
        user_id = request.user.id
        wishlists = Wishlist.objects.filter(user_id=user_id, is_like=True)
        serializer = WishListSerializer(wishlists, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def check_wishlist(self, request):
        user_id = request.user.id
        post_id = request.GET.get("post_id", None)

        if Wishlist.objects.filter(user_id=user_id, post_id=post_id, is_like=True).exists():
            return Response("Post exists", status=202)
        else:
            return Response("Post doesn't exist", status=200)
