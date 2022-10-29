from django.db.models import Count, Sum
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from client.user.models import User
from freelancer.proposals.models import Invoice
from registration.models import Category


class StatisticViewSet(viewsets.ModelViewSet):

    @action(methods=['get'], detail=False)
    def get(self, request):
        data = [{
            "total_users": 0,
            "total_clients": 0,
            "total_workers": 0,
            "total_incomes": 0,
            "registration_clients": [],
            "top_up": None,
            "withdraw": None,
            "registration_dates": [],
            "top_up_dates": [],
            "withdraw_dates": []
        }]
        data[0]['total_users'] = User.objects.filter(is_delete=False).count()
        data[0]['total_clients'] = User.objects.filter(is_delete=False, role="client").count()
        data[0]['total_workers'] = User.objects.filter(is_delete=False, role="freelancer").count()
        data[0]['total_incomes'] = Invoice.objects.filter(is_withdraw=False).aggregate(Sum('amount'))
        categories = [cat.id for cat in Category.objects.all()]
        for category in categories:
            data[0]['registration_clients'].append({
                "category_id": Category.objects.get(id=category).id,
                "category": Category.objects.get(id=category).name,
                "user": User.objects.extra({
                    'created_at': "date(created_at)"
                })
                .values('created_at')
                .annotate(created_count=Count('id'))
                .filter(
                    role="freelancer",
                    categories=category
                )
                .order_by(
                    "created_at"
                )
            })
        for user in User.objects.filter(role='freelancer').order_by('created_at'):
            if user.created_at.date() not in data[0]['registration_dates']:
                data[0]['registration_dates'].append(user.created_at.date())

        # for invoice in Invoice.objects.filter(is_withdraw=False):
        data[0]['top_up'] = dict(
            # "invoice_id": Category.objects.get(id=invoice.id).id,
            invoice_client=Invoice.objects.filter(is_withdraw=False, user__role="client").values('created_at__date').order_by(
                'created_at__date').annotate(sum=Sum('amount')),
            invoice_freelancer=Invoice.objects.filter(is_withdraw=False, user__role="freelancer").values('created_at__date').order_by(
                'created_at__date').annotate(sum=Sum('amount')))

        data[0]['withdraw'] = dict(
            # "invoice_id": Category.objects.get(id=invoice.id).id,
            invoice_client=Invoice.objects.filter(is_withdraw=True, user__role="client").values(
                'created_at__date').order_by(
                'created_at__date').annotate(sum=Sum('amount')),
            invoice_freelancer=Invoice.objects.filter(is_withdraw=True, user__role="freelancer").values(
                'created_at__date').order_by(
                'created_at__date').annotate(sum=Sum('amount')))

        for invoice in Invoice.objects.filter(is_withdraw=False).order_by('created_at'):
            if invoice.created_at.date() not in data[0]['top_up_dates']:
                data[0]['top_up_dates'].append(invoice.created_at.date())
        for invoice in Invoice.objects.filter(is_withdraw=True).order_by('created_at'):
            if invoice.created_at.date() not in data[0]['withdraw_dates']:
                data[0]['withdraw_dates'].append(invoice.created_at.date())

        return Response(data)

    @action(methods=['get'], detail=False)
    def filter_by_date(self, request):
        start_date = request.GET.get('start_date')
        finish_date = request.GET.get('finish_date')
        data = [{
            "total_users": 0,
            "total_clients": 0,
            "total_workers": 0,
            "registration_clients": [],
            "registration_dates": [],
            "top_up_dates": [],
            "withdraw_dates": []
        }]
        data[0]['total_users'] = User.objects.filter(is_delete=False, created_at__gt=start_date,
                                                     created_at__lte=finish_date).count()
        data[0]['total_clients'] = User.objects.filter(is_delete=False, role="client", created_at__gt=start_date,
                                                       created_at__lte=finish_date).count()
        data[0]['total_workers'] = User.objects.filter(is_delete=False, role="freelancer", created_at__gt=start_date,
                                                       created_at__lte=finish_date).count()
        categories = [cat.id for cat in Category.objects.all()]
        for category in categories:
            data[0]['registration_clients'].append({
                "category_id": Category.objects.get(id=category).id,
                "category": Category.objects.get(id=category).name,
                "user": User.objects
                .extra({
                    'created_at': "date(created_at)"
                })
                .values('created_at')
                .annotate(created_count=Count('id'))
                .filter(
                    role="freelancer",
                    categories=category,
                    created_at__gt=start_date,
                    created_at__lte=finish_date)
                .order_by("created_at")
            })
        for user in User.objects.filter(role='freelancer', created_at__gt=start_date,
                                        created_at__lte=finish_date).order_by('created_at'):
            if user.created_at.date() not in data[0]['registration_dates']:
                data[0]['registration_dates'].append(user.created_at.date())

        data[0]['top_up'] = dict(
            # "invoice_id": Category.objects.get(id=invoice.id).id,
            invoice=Invoice.objects.filter(is_withdraw=False, created_at__gt=start_date,
                                           created_at__lte=finish_date).values('created_at__date',
                                                                               'user__role').order_by(
                'created_at__date').annotate(sum=Sum('amount')))

        data[0]['withdraw'] = dict(
            # "invoice_id": Category.objects.get(id=invoice.id).id,
            invoice=Invoice.objects.filter(is_withdraw=True, created_at__gt=start_date,
                                           created_at__lte=finish_date).values('created_at__date',
                                                                               'user__role').order_by(
                'created_at__date').annotate(sum=Sum('amount')))

        for invoice in Invoice.objects.filter(is_withdraw=False, created_at__gt=start_date,
                                              created_at__lte=finish_date).order_by('created_at'):
            if invoice.created_at.date() not in data[0]['top_up_dates']:
                data[0]['top_up_dates'].append(invoice.created_at.date())
        for invoice in Invoice.objects.filter(is_withdraw=True, created_at__gt=start_date,
                                              created_at__lte=finish_date).order_by('created_at'):
            if invoice.created_at.date() not in data[0]['withdraw_dates']:
                data[0]['withdraw_dates'].append(invoice.created_at.date())

        return Response(data)
