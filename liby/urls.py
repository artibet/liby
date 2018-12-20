
from django.contrib import admin
from django.urls import path, include


urlpatterns = [
    #path('admin/', admin.site.urls),
    path('admin/', include('mainapp.urls')),    # admin dashboard
    path('', include('psite.urls')),            # public site
]
