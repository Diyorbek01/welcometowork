from django.contrib import admin

# Register your models here.
from freelancer.proposals.models import Proposal, Review, StatusChanges

admin.site.register(Proposal)
admin.site.register(Review)
admin.site.register(StatusChanges)