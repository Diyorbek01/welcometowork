"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

from client.post.urls import router as post_router
from client.user.urls import router as client_router
from freelancer.proposals.urls import router as proposal_router
from freelancer.worker.urls import router as worker_router
from registration import auth
from registration.urls import router as registration_router

urlpatterns = [
    path('admin/', admin.site.urls),

    # ----------- Client -------------
    path('api/v1/', include(client_router.urls)),
    path('api/v1/', include(post_router.urls)),
    # ----------- Freelancer
    path('api/v1/', include(worker_router.urls)),
    path('api/v1/', include(proposal_router.urls)),
    # ----------- Registration
    path('api/v1/', include(registration_router.urls)),

    path("api/v1/auth/login/", auth.login),
    path("api/v1/auth/login_admin/", auth.login_admin),
    path("api/v1/auth/send_otp/", auth.send_sms_register),
    path("api/v1/auth/check_otp/", auth.chek_otp),
    path("api/v1/auth/check_otp_for_reset/", auth.check_otp_for_reset),
    path("api/v1/auth/phone_number_reset_password/", auth.send_reset_password),
    path("api/v1/auth/reset_password/", auth.reset_password),
    path("api/v1/auth/create_password/", auth.create_password),

    path('api/payme/', include('paymeuz.urls')),

    path('__debug__/', include('debug_toolbar.urls')),
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
