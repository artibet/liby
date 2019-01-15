from django.urls import path, include
from .views import create_author, create_publisher

app_name = "api"

urlpatterns = [
    path('author/create/', create_author, name="create-author"),
    path('publisher/create/', create_publisher, name="create-publisher"),
]