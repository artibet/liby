from django.contrib import admin
from django.urls import path
from . import views
from .class_views import county as country_views
from .class_views import language as language_views
from .class_views import category as category_views


urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    
    # Βιβλία
    path('books/', views.BookViews.index, name='books-index'),
    path('books/create/', views.BookViews.create, name='books-create'),
    path('books/search', views.BookViews.search, name='books-search'),

    # Κατηγοριες
    path('categories/', category_views.CategoryListView.as_view(), name='category-list'),
    path('categories/create/', category_views.CategoryCreateView.as_view(), name='category-create'),
    path('categories/<int:pk>/update/', category_views.CategoryUpdateView.as_view(), name='category-update'),
    path('categories/<int:pk>/delete/', category_views.CategoryDeleteView.as_view(), name='category-delete'),
    
    # Συγγραφείς
    path('authors/', views.AuthorViews.index, name='authors-index'),
    
    # Εκδοτικοί οίκοι
    path('publishers/', views.PublisherViews.index, name='publishers-index'),
    
    # Γλώσσες
    path('languages/', language_views.LanguageListView.as_view(), name='language-list'),
    path('languages/create/', language_views.LanguageCreateView.as_view(), name='language-create'),
    path('languages/<int:pk>/update/', language_views.LanguageUpdateView.as_view(), name='language-update'),
    path('languages/<int:pk>/delete/', language_views.LanguageDeleteView.as_view(), name='language-delete'),

    # Χώρες
    path('countries/', country_views.CountryListView.as_view(), name='country-list'),
    path('countries/create/', country_views.CountryCreateView.as_view(), name='country-create'),
    path('countries/<int:pk>/update/', country_views.CountryUpdateView.as_view(), name='country-update'),
    path('countries/<int:pk>/delete/', country_views.CountryDeleteView.as_view(), name='country-delete'),
    
    # Χρήστες
    path('users/', views.UserViews.index, name='users-index'),
    path('users/create/', views.UserViews.create, name='users-create'),

    # Κρατήσεις
    path('holds/', views.HoldViews.index, name='holds-index'),

    # Δανεισμοί
    path('lends/', views.LendViews.index, name='lends-index'),
    path('lends/delays', views.LendViews.delays, name='lends-delays'),

     # Προτάσεις
    path('suggestions/', views.SuggestionViews.index, name='suggestions-index'),

     # Σχόλια χρηστών
    path('comments/', views.CommentViews.index, name='comments-index'),
    
]