from django.urls import path, include
from .views import create_author

app_name = "api"

urlpatterns = [
    path('author/create/', create_author, name="create-author"),
]