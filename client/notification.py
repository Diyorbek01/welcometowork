import functools

from rest_framework import viewsets, generics
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST

from client.notification_serializers import PostMenuSerializer, ProposalGetSerializer, ClientGetSerializer, \
    WorkerGetSerializer, PortfolioGetSerializer
from client.post.models import Post
from client.user.models import User
from freelancer.proposals.models import Proposal
from freelancer.worker.models import Portfolio


class NotificationViewSet(viewsets.ModelViewSet):

    @action(methods=['get'], detail=False)
    def get(self, request):
        data = []
        posts = Post.objects.filter(is_new=True)
        proposals = Proposal.objects.filter(is_new=True)
        portfolios = Portfolio.objects.filter(is_new=True)
        client = User.objects.filter(is_new=True, role='client')
        worker = User.objects.filter(is_new=True, role='freelancer')
        data.append(PostMenuSerializer(posts, many=True).data)
        data.append(ProposalGetSerializer(proposals, many=True).data)
        data.append(PortfolioGetSerializer(portfolios, many=True).data)
        data.append(ClientGetSerializer(client, many=True).data)
        data.append(WorkerGetSerializer(worker, many=True).data)
        result = functools.reduce(lambda x, y,: x + y, data)
        data = sorted(result, key=lambda d: d['created_at'])
        return Response(data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def filter_by_date(self, request):
        start_date = request.GET.get("start_date")
        finish_date = request.GET.get("finish_date")
        data = []
        posts = Post.objects.filter(is_new=True, created_at__gt=start_date, created_at__lte=finish_date)
        proposals = Proposal.objects.filter(is_new=True, created_at__gt=start_date, created_at__lte=finish_date)
        portfolios = Portfolio.objects.filter(is_new=True, created_at__gt=start_date, created_at__lte=finish_date)
        client = User.objects.filter(is_new=True, role='client', created_at__gt=start_date, created_at__lte=finish_date)
        worker = User.objects.filter(is_new=True, role='freelancer', created_at__gt=start_date,
                                     created_at__lte=finish_date)
        data.append(PostMenuSerializer(posts, many=True).data)
        data.append(ProposalGetSerializer(proposals, many=True).data)
        data.append(PortfolioGetSerializer(portfolios, many=True).data)
        data.append(ClientGetSerializer(client, many=True).data)
        data.append(WorkerGetSerializer(worker, many=True).data)
        result = functools.reduce(lambda x, y,: x + y, data)
        data = sorted(result, key=lambda d: d['created_at'])
        return Response(data, status=HTTP_200_OK)
