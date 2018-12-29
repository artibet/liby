from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='psite-home'),                      
    path('book/<int:pk>/details/', views.BookDetailView.as_view(), name='psite-book')
]