from datetime import timedelta

from decouple import config
from django.db.models import Q
from django.utils.timezone import now
from rest_framework import viewsets, authentication, permissions
from rest_framework.decorators import action
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST
from rest_framework.views import APIView

import messages
from client.user.serializers import UserSerializer, UserGetSerializer, UserPostSerializer, UserProfileUpdateSerializer, \
    NotificationMobileSerializer
from freelancer.proposals.models import Notification, Proposal
from pusher import send_message
from .models import User
from ..post.models import Post


class UserViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = User.objects.filter(~Q(is_superuser=True), role="client")
    serializer_class = UserPostSerializer

    @action(methods=['get'], detail=False)
    def get(self, request):
        user_id = request.GET.get("user_id")
        workers = User.objects.get(id=user_id)
        serializer = UserSerializer(workers)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_update_profile(self, request):
        workers = User.objects.get(id=request.user.id)
        serializer = UserProfileUpdateSerializer(workers)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def filter_by_date(self, request):
        start_date = request.GET.get("start_date")
        finish_date = request.GET.get("finish_date")
        workers = User.objects.filter(~Q(is_superuser=True), created_at__gt=start_date, created_at__lte=finish_date,
                                      role="client", is_delete=False)
        serializer = UserGetSerializer(workers, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_list(self, request):
        workers = User.objects.filter(~Q(is_superuser=True), role="client", is_delete=False)
        serializer = UserGetSerializer(workers, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_bonus(self, request):
        user = request.user
        price = int(config('BONUS_PRICE'))
        user.balance += price
        user.save()
        send_message([user.token], messages.data['bonus_title'],
                     messages.data['bonus_message'])
        notification = Notification.objects.create(
            title=messages.data['bonus_title'],
            body=messages.data['bonus_message'],
            status="bonus"
        )
        notification.user.add(user)
        notification.save()
        return Response({"message": "Accepted successfully"}, status=HTTP_200_OK)

    @action(methods=['post'], detail=False)
    def change_phone_number(self, request):
        user = request.user
        phone_number = request.data.get("phone_number", None)
        try:
            user.phone_number = phone_number
            user.username = phone_number
            user.save()
            return Response({"message": "Changed"}, status=HTTP_200_OK)
        except:
            return Response({"error": "This phone number already exists"}, status=HTTP_400_BAD_REQUEST)


class NotificationMobile(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = Notification.objects.filter(is_new=True)
    serializer_class = NotificationMobileSerializer

    @action(methods=['post'], detail=False)
    def change_notification_status(self, request):
        id_list = request.data.get('id')
        for id in id_list:
            notification = Notification.objects.get(id=id)
            notification.is_new = False
            notification.save()
        notifications = Notification.objects.filter(user__in=[request.user.id], is_new=True).order_by("-created_at")
        serializer = self.get_serializer_class()(notifications, many=True)
        return Response(serializer.data)

    @action(methods=['get'], detail=False)
    def get(self, request):
        user_id = request.user.id
        notifications = Notification.objects.filter(user__in=[user_id], is_new=True).order_by("-created_at")
        serializer = self.get_serializer_class()(notifications, many=True)
        return Response(serializer.data)

    @action(methods=['post'], detail=False)
    def send_notification(self, request):
        title = request.data.get('title')
        body = request.data.get('body')

        send_message([user.token for user in User.objects.all()], title, body)
        notification = Notification.objects.create(
            title=title,
            body=body,
            status="custom",
        )
        for user in User.objects.all():
            notification.user.add(user)
        notification.save()
        return Response({"message": "Request recieved"})


class CronJob(APIView):
    def get(self, request):
        last_month = now() - timedelta(days=30)
        posts = Post.objects.filter(
            ~Q(status='finished'),
            ~Q(status='archived'),
            ~Q(status='going'),
            ~Q(status='canceled'),
            created_at__lt=last_month
        )
        for post in posts:
            send_message([post.user.token], messages.data["post_title"], messages.data["archived_post"])
            notification = Notification.objects.create(
                post=post,
                status="archived",
                title=messages.data["post_title"],
                body=messages.data["archived_post"]
            )
            post.status = "archived"
            post.save()
        proposals = Proposal.objects.filter(
            ~Q(post_status='finished'),
            ~Q(post_status='archived'),
            ~Q(post_status='cancelled'),
            ~Q(post_status='going'),
            created_at__lt=last_month
        )
        for proposal in proposals:
            send_message([proposal.post.user.token], messages.data["proposal_title"],
                         messages.data["archived_proposal"])
            notification = Notification.objects.create(
                proposal=proposal,
                status="archived",
                title=messages.data["proposal_title"],
                body=messages.data["archived_post"]
            )
            proposal.post_status = "archived"
            proposal.save()
        return Response("Success")
