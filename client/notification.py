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
        posts = Post.objects.filter(status="sent")
        proposals = Proposal.objects.filter(admin_status="pending")
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

    @action(methods=['post'], detail=False)
    def change_status(self, request):
        status = request.data.get("status", None)
        id = request.data.get("id", None)
        if status == "post":
            post = Post.objects.get(id=id)
            post.is_new = False
            post.save()
        elif status == "proposal":
            proposal = Proposal.objects.get(id=id)
            proposal.is_new = False
            proposal.save()
        elif status == "user":
            user = User.objects.get(id=id)
            user.is_new = False
            user.save()
        elif status == "portfolio":
            portfolio = Portfolio.objects.get(id=id)
            portfolio.is_new = False
            portfolio.save()
        else:
            return Response({"error": "Request not found"}, status=HTTP_400_BAD_REQUEST)
        return Response({"message": "Changed"}, status=HTTP_200_OK)
