from django.contrib import admin
from django.urls import path
from . import views
from .views_group.books import views as book_views
from .views_group.categories import views as category_views
from .views_group.authors import views as author_views
from .views_group.publishers import views as publisher_views
from .views_group.languages import views as language_views
from .views_group.countries import views as country_views

urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    
    # Εκδόσεις
    path('books/', book_views.index, name='books-index'),
    path('books/create/', book_views.create, name='books-create'),
    path('books/search', book_views.search, name='books-search'),

    # Κατηγοριες
    path('categories/', category_views.index, name='categories-index'),
    
    # Συγγραφείς
    path('authors/', author_views.index, name='authors-index'),
    
    # Εκδοτικοί οίκοι
    path('publishers/', publisher_views.index, name='publishers-index'),
    
    # Γλώσσες
    path('languages/', language_views.index, name='languages-index'),

    # Χώρες
    path('countries/', country_views.index, name='countries-index'),
    
]