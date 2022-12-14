# Create your views here.
from decouple import config
from rest_framework import viewsets, authentication, permissions
from rest_framework.decorators import action
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_201_CREATED, HTTP_400_BAD_REQUEST

import messages
from client.post.models import Post
from client.user.serializers import ProposalUserDetailsSerializer
from freelancer.proposals.models import Proposal, Review, Invoice, StatusChanges, Notification
from freelancer.proposals.serializers import ProposalSerializer, ProposalGetSerializer, \
    ReviewSerializer, ReviewGetSerializer, ProposalPostSerializer, InvoiceSerializer, ProposalGetDetailsSerializer
from freelancer.worker.serializers import InvoiceGetSerializer
from pusher import send_message


class ProposalViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = Proposal.objects.all()
    serializer_class = ProposalSerializer

    @action(methods=['post'], detail=False)
    def post(self, request):
        data = request.data
        serializer = ProposalSerializer(data=data)
        if serializer.is_valid():
            user = request.user
            user.balance -= int(config('PRICE'))
            if user.balance > -1:
                serializer.save()
                # user.total_spent += int(config('PRICE'))
                # user.save()
                # invoice = Invoice.objects.create(
                #     user_id=user.id,
                #     is_withdraw=True,
                #     amount=int(config('PRICE'))
                # )
                return Response(serializer.data, status=HTTP_201_CREATED)
            return Response({'message': "Hisobingizda mablag' yetarli emas"}, status=HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False)
    def get_list(self, request):
        post_id = request.GET.get("post_id")
        proposals = Proposal.objects.filter(post=post_id)
        serializer = ProposalGetSerializer(proposals, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_details(self, request):
        id = request.GET.get("id")
        proposals = Proposal.objects.get(id=id)
        serializer = ProposalGetDetailsSerializer(proposals)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_post_details(self, request):
        user_id = request.GET.get("user_id")
        post_id = request.GET.get("post_id")
        proposals = Proposal.objects.filter(user_id=user_id, post_id=post_id).last()
        serializer = ProposalUserDetailsSerializer(proposals)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get(self, request):
        proposals = Proposal.objects.all().order_by('-id')
        serializer = ProposalGetSerializer(proposals, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def filter_by_date(self, request):
        start_date = request.GET.get('start_date')
        finish_date = request.GET.get('finish_date')

        proposals = Proposal.objects.filter(created_at__gt=start_date, created_at__lte=finish_date)
        serializer = ProposalGetSerializer(proposals, many=True)
        return Response(serializer.data)

    @action(methods=['get'], detail=False)
    def filter_by_user(self, request):
        user_id = request.GET.get('user_id')
        proposals = Proposal.objects.filter(user_id=user_id)
        serializer = ProposalGetSerializer(proposals, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def change_status(self, request):
        # For admin
        proposal_id = request.GET.get("proposal_id", None)
        status = request.GET.get("status", None)

        proposal = Proposal.objects.get(id=proposal_id)
        if status == 'approved':
            proposal.admin_status = status
            proposal.save()
            status_changes = StatusChanges.objects.create(
                user=request.user,
                from_status=proposal.admin_status,
                to_status=status,
                proposal=proposal
            )
            text = f"{proposal.post.user.get_full_name()} {messages.data['create_proposal']}"
            send_message([proposal.post.user.token], messages.data['proposal_title'],
                         text)
            notification = Notification.objects.create(
                status="proposal",
                proposal=proposal,
                title=messages.data['proposal_title'],
                body=text,
            )
            notification.user.add(proposal.post.user)
            notification.save()
            return Response("Changed", status=HTTP_200_OK)

        proposal.admin_status = status
        proposal.save()
        return Response("Changed", status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def change_client_status(self, request):
        # For Client
        proposal_id = request.GET.get("proposal_id", None)
        status = request.GET.get("status", None)

        proposal = Proposal.objects.get(id=proposal_id)

        balance = proposal.user.balance - int(config('PRICE'))
        if status == "approved":
            if balance > -1:
                proposal.user.balance -= int(config('PRICE'))
                proposal.user.total_spent += int(config('PRICE'))
                proposal.client_status = status
                proposal.post_status = status
                proposal.user.save()
                proposal.save()
                invoice = Invoice.objects.create(
                    user_id=proposal.user.id,
                    is_withdraw=True,
                    amount=int(config('PRICE'))
                )
                status_changes = StatusChanges.objects.create(
                    user=request.user,
                    from_status=proposal.client_status,
                    to_status=status,
                    proposal=proposal
                )
                send_message([proposal.user.token], messages.data['proposal_title'], messages.data['confirm_proposal'])
                notification = Notification.objects.create(
                    status="proposal",
                    proposal=proposal,
                    title=messages.data['proposal_title'],
                    body=messages.data['confirm_proposal'],
                )
                notification.user.add(proposal.user)
                notification.save()
                return Response("Changed", status=HTTP_200_OK)
            else:
                return Response({"message": "Hisobingizda mablag' yetarli emas!"}, status=HTTP_400_BAD_REQUEST)

        proposal.client_status = status
        proposal.post_status = status
        proposal.save()

        return Response("Changed", status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_post(self, request):
        # status = request.GET.get("status")
        user_id = request.user.id
        proposals = Proposal.objects.filter(user_id=user_id).order_by("-updated_at")
        serializer = ProposalPostSerializer(proposals, many=True)
        return Response(serializer.data, status=HTTP_200_OK)


class ReviewViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

    @action(methods=['get'], detail=False)
    def get_post_reviews(self, request):
        post_id = request.GET.get("post_id", None)

        reviews = Review.objects.filter(post_id=post_id, is_client=False)
        serializer = ReviewGetSerializer(reviews, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_worker_reviews(self, request):
        user_id = request.user.id

        reviews = Review.objects.filter(user_id=user_id, is_client=True)
        serializer = ReviewGetSerializer(reviews, many=True)
        return Response(serializer.data, status=HTTP_200_OK)


class InvoiceViewset(viewsets.ModelViewSet):
    authentication_classes = [authentication.TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = Invoice.objects.all()
    serializer_class = InvoiceSerializer

    @action(methods=['post'], detail=False)
    def post(self, request):
        data = request.data
        serializer = InvoiceSerializer(data=data)
        if serializer.is_valid():
            serializer.is_valid(raise_exception=True)
            serializer.save()
            request.user.balance += int(data['amount'])
            request.user.save()
            return Response(serializer.data, status=HTTP_201_CREATED)
        return Response(serializer.errors, status=HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False)
    def get_list(self, request):
        invoices = Invoice.objects.all().order_by("-created_at")
        serializer = InvoiceGetSerializer(invoices, many=True)
        return Response(serializer.data, status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def filter_by_date(self, request):
        start_date = request.GET.get('start_date', None)
        finish_date = request.GET.get('finish_date', None)
        min_summa = request.GET.get('min_summa', None)
        max_summa = request.GET.get('max_summa', None)
        if min_summa and max_summa:
            invoices = Invoice.objects.filter(amount__gte=min_summa, amount__lte=max_summa).order_by("-created_at")
            if start_date and finish_date:
                new_invoices = invoices.filter(created_at__gt=start_date,
                                               created_at__lte=finish_date).order_by("-created_at")
                serializer = InvoiceGetSerializer(new_invoices, many=True)
                return Response(serializer.data, status=HTTP_200_OK)
            serializer = InvoiceGetSerializer(invoices, many=True)
            return Response(serializer.data, status=HTTP_200_OK)

        elif start_date and finish_date:
            invoices = Invoice.objects.filter(created_at__gt=start_date,
                                              created_at__lte=finish_date)
            serializer = InvoiceGetSerializer(invoices, many=True)
            return Response(serializer.data, status=HTTP_200_OK)
        else:
            invoices = Invoice.objects.all()
            serializer = InvoiceGetSerializer(invoices, many=True)
            return Response(serializer.data, status=HTTP_200_OK)
