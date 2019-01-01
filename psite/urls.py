from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='psite-home'),                      
    path('book/<int:book_id>/', views.book_details, name='psite-book'),
    path('new_books/', views.new_books, name='psite-new_books'),
    path('top_books/', views.top_books, name='psite-top_books'),
    path('top_picks/', views.top_picks, name='psite-top_picks'),
    path('author/<int:author_id>/', views.author, name='psite-author'),
    path('publisher/<int:publisher_id>/', views.publisher, name='psite-publisher'),
    path('category/<int:category_id>/', views.category, name='psite-category'),
    path('search/', views.search, name='psite-search'),
]