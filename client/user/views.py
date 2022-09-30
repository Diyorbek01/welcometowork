from decouple import config
from django.db.models import Q
from rest_framework import viewsets, authentication, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK

from client.user.serializers import UserSerializer, UserGetSerializer, UserPostSerializer, UserProfileUpdateSerializer
from .models import User


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
        return Response({"message": "Accepted successfully"}, status=HTTP_200_OK)