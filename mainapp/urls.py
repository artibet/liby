from django.contrib import admin
from django.urls import path
from . import views


urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    
    # Βιβλία
    path('books/', views.BookViews.index, name='books-index'),
    path('books/create/', views.BookViews.create, name='books-create'),
    path('books/search', views.BookViews.search, name='books-search'),

    # Κατηγοριες
    path('categories/', views.CategoryViews.index, name='categories-index'),
    
    # Συγγραφείς
    path('authors/', views.AuthorViews.index, name='authors-index'),
    
    # Εκδοτικοί οίκοι
    path('publishers/', views.PublisherViews.index, name='publishers-index'),
    
    # Γλώσσες
    path('languages/', views.LanguageViews.index, name='languages-index'),

    # Χώρες
    path('countries/', views.CountryViews.index, name='countries-index'),
    
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