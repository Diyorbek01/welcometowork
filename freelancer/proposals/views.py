# Create your views here.
from decouple import config
from rest_framework import viewsets, authentication, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_201_CREATED, HTTP_400_BAD_REQUEST

from client.user.serializers import ProposalUserDetailsSerializer
from freelancer.proposals.models import Proposal, Review, Invoice, StatusChanges
from freelancer.proposals.serializers import ProposalSerializer, ProposalGetSerializer, \
    ReviewSerializer, ReviewGetSerializer, ProposalPostSerializer, InvoiceSerializer, ProposalGetDetailsSerializer
from freelancer.worker.serializers import InvoiceGetSerializer


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
            serializer.save()
            user = request.user
            user.balance -= int(config('PRICE'))
            if user.balance > 0:
                user.total_spent += int(config('PRICE'))
                user.save()
                invoice = Invoice.objects.create(
                    user_id=user.id,
                    is_withdraw=True,
                    amount=int(config('PRICE'))
                )
                return Response(serializer.data, status=HTTP_201_CREATED)
            return Response({'message': "Hisobingizda mablag' yetarli emas"})
        return Response(serializer.errors)

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
        proposal_id = request.GET.get("proposal_id", None)
        status = request.GET.get("status", None)

        proposal = Proposal.objects.get(id=proposal_id)
        proposal.admin_status = status
        proposal.save()
        proposal.post.user.balance -= int(config('PRICE'))
        if proposal.post.user.balance > 0:
            proposal.post.user.total_spent += int(config('PRICE'))
            proposal.post.user.save()
            invoice = Invoice.objects.create(
                user_id=proposal.post.user.id,
                is_withdraw=True,
                amount=int(config('PRICE'))
            )
            status_changes = StatusChanges.objects.create(
                user=request.user,
                from_status=proposal.admin_status,
                to_status=status,
                proposal=proposal
            )
            return Response("Changed", status=HTTP_200_OK)
        return Response({"message": "Foydalanuvchi hisobida mablag' yetarli emas!"}, status=HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False)
    def change_client_status(self, request):
        proposal_id = request.GET.get("proposal_id", None)
        status = request.GET.get("status", None)

        proposal = Proposal.objects.get(id=proposal_id)
        status_changes = StatusChanges.objects.create(
            user=request.user,
            from_status=proposal.client_status,
            to_status=status,
            proposal=proposal
        )
        proposal.client_status = status
        proposal.post.user.save()
        proposal.save()

        return Response("Changed", status=HTTP_200_OK)

    @action(methods=['get'], detail=False)
    def get_post(self, request):
       # status = request.GET.get("status")
        user_id = request.user.id
        proposals = Proposal.objects.all()
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

        reviews = Review.objects.filter(post_id=post_id)
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
        invoices = Invoice.objects.all()
        serializer = InvoiceGetSerializer(invoices, many=True)
        return Response(serializer.data, status=HTTP_200_OK)
