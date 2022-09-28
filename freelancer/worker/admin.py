from django.contrib import admin

# Register your models here.
from freelancer.worker.models import Portfolio,PortfolioImage

admin.site.register(Portfolio)
admin.site.register(PortfolioImage)
