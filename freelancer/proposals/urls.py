from rest_framework.routers import DefaultRouter
from .views import *

router = DefaultRouter()

router.register('proposal', ProposalViewset, basename='ProposalViewset')
router.register('review', ReviewViewset, basename='ReviewViewset')
router.register('invoice', InvoiceViewset, basename='InvoiceViewset')
