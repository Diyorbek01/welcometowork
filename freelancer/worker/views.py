from collections import Counter
from functools import reduce

from django.db.models import Q
from rest_framework import viewsets, authentication, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.status import HTTP_201_CREATED, HTTP_400_BAD_REQUEST, HTTP_200_OK

from client.user.models import User
from freelancer.proposals.models import StatusChanges
from freelancer.worker.models import Portfolio, PortfolioImage
from freelancer.worker.serializers import WorkerSerializer, WorkerGetSerializer, PortfolioSerializer, \
    PortfolioImageSerializer, WorkerGetLessSerializer, PortfolioGetSerializer, WorkerGetProfileSerializer, \
    WorkerGetPopularSerializer, WorkerGetProposalSerializer
from registration.models import Category
from registration.serializers import CategorySerializer


def perseus_sort(l):
    counter = Counter(l)
    return sorted(l, key=lambda x: (counter[x], x))


class WorkerViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = User.objects.filter(~Q(is_superuser=True), role="freelancer")
    serializer_class = WorkerSerializer

    @action(methods=['get'], detail=False)
    def get(self, request):
        user_id = request.GET.get("user_id")
        workers = User.objects.get(id=user_id)
        serializer = WorkerGetSerializer(workers)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def change_online_status(self, request):
        status = request.GET.get('status')

        request.user.is_online = status
        request.user.save()
        return Response('Changed', status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_popular_categories(self, request):
        workers = User.objects.filter(role="freelancer")
        all_categories = []
        for worker in workers:
            all_categories.append([w.id for w in worker.categories.all()])
        result = reduce(lambda x, y: x + y, all_categories)
        category_ids = []
        for id in perseus_sort(result):
            if id not in category_ids:
                category_ids.insert(0, id)
        categories = []
        for cat in category_ids:
            category = Category.objects.get(id=cat)
            categories.append(category)
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_profile(self, request):
        user_id = request.GET.get("user_id", None)
        workers = User.objects.get(id=user_id)
        serializer = WorkerGetProfileSerializer(workers)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_popular_users(self, request):
        users = User.objects.filter(is_delete=False, role='freelancer')
        serializer = WorkerGetPopularSerializer(users, many=True)
        data = sorted(serializer.data, key=lambda d: d['rating'])
        return Response(data.__reversed__(), status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_month_popular_users(self, request):
        users = User.objects.filter(is_delete=False, role='freelancer')
        serializer = WorkerGetPopularSerializer(users, many=True)
        data = sorted(serializer.data, key=lambda d: d['rating'])
        return Response(data.__reversed__(), status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_proposal_user(self, request):
        user_id = request.GET.get("user_id", None)
        user = User.objects.get(id=user_id)
        serializer = WorkerGetProposalSerializer(user)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_list(self, request):
        workers = User.objects.filter(~Q(is_superuser=True), role="freelancer", is_delete=False)
        serializer = WorkerGetLessSerializer(workers, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def filter_by_date(self, request):
        start_date = request.GET.get("start_date")
        finish_date = request.GET.get("finish_date")
        workers = User.objects.filter(~Q(is_superuser=True), created_at__gt=start_date, created_at__lte=finish_date,
                                      role="freelancer", is_delete=False)
        serializer = WorkerGetLessSerializer(workers, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def filter_by_category(self, request):
        category_id = request.GET.get("category_id")
        workers = User.objects.filter(categories=category_id, role="freelancer", is_delete=False)
        serializer = WorkerGetPopularSerializer(workers, many=True)
        return Response(serializer.data, status=HTTP_200_OK)


class PortfolioViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = Portfolio.objects.all()
    serializer_class = PortfolioSerializer

    @action(methods=['get'], detail=False)
    def get_list(self, request):
        user_id = request.GET.get("user_id")
        portfolio = Portfolio.objects.filter(user_id=user_id)
        serializer = PortfolioSerializer(portfolio, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get(self, request):
        id = request.GET.get("id")
        portfolio = Portfolio.objects.get(id=id)
        serializer = PortfolioGetSerializer(portfolio)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['post'], detail=False)
    def create_portfolio(self, request):
        data = request.data
        serializer = PortfolioSerializer(data=data)
        if serializer.is_valid():
            serializer.is_valid(raise_exception=True)
            serializer.save()
            images = request.FILES.getlist("image")
            for image in images:
                image_instance = PortfolioImage.objects.create(
                    user_id=serializer.data.get("user"),
                    image=image,
                    portfolio_id=serializer.data.get("id")
                )
            return Response(serializer.data, status=HTTP_201_CREATED)
        return Response('serializer.errors', status=HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False)
    def change_status(self, request):
        portfolio_id = request.GET.get("portfolio_id", None)
        status = request.GET.get("status", None)

        portfolio = Portfolio.objects.get(id=portfolio_id)
        status_changes = StatusChanges.objects.create(
            user=request.user,
            from_status=portfolio.status,
            to_status=status,
            portfolio=portfolio
        )
        portfolio.status = status
        portfolio.save()
        return Response("Changed", status=HTTP_200_OK)


class PortfolioImageViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = PortfolioImage.objects.all()
    serializer_class = PortfolioImageSerializer
