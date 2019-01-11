from django.contrib import admin
from django.urls import path
from . import views
from .class_views import county as country_views
from .class_views import language as language_views
from .class_views import category as category_views
from .class_views import publisher as publisher_views
from .class_views import author as author_views
from .class_views import user as user_views
from .views import BookViews


urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    
    # Βιβλία
    path('books/', BookViews.index, name='books-index'),
    path('books/create/', BookViews.create, name='books-create'),
    path('books/<int:book_id>/update/', BookViews.update, name='book-update'),
    path('books/<int:book_id>/', BookViews.details, name='book-details'),
    path('books/search', views.BookViews.search, name='books-search'),

    # Κατηγοριες
    path('categories/', category_views.CategoryListView.as_view(), name='category-list'),
    path('categories/create/', category_views.CategoryCreateView.as_view(), name='category-create'),
    path('categories/<int:pk>/update/', category_views.CategoryUpdateView.as_view(), name='category-update'),
    path('categories/<int:pk>/delete/', category_views.CategoryDeleteView.as_view(), name='category-delete'),
    
    # Συγγραφείς
    path('authors/', author_views.AuthorListView.as_view(), name='author-list'),
    path('authors/create/', author_views.AuthorCreateView.as_view(), name='author-create'),
    path('authors/<int:pk>/update/', author_views.AuthorUpdateView.as_view(), name='author-update'),
    path('authors/<int:pk>/delete/', author_views.AuthorDeleteView.as_view(), name='author-delete'),
    
    # Εκδοτικοί οίκοι
    path('publishers/', publisher_views.PublisherListView.as_view(), name='publisher-list'),
    path('publishers/create/', publisher_views.PublisherCreateView.as_view(), name='publisher-create'),
    path('publishers/<int:pk>/update/', publisher_views.PublisherUpdateView.as_view(), name='publisher-update'),
    path('publishers/<int:pk>/delete/', publisher_views.PublisherDeleteView.as_view(), name='publisher-delete'),
    
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
    path('users/', user_views.UserListView.as_view(), name='user-list'),
    path('users/create/', user_views.UserCreateView.as_view(), name='user-create'),
    path('users/<int:pk>/update/', user_views.UserUpdateView.as_view(), name='user-update'),
    path('users/<int:pk>/delete/', user_views.UserDeleteView.as_view(), name='user-delete'),
    path('users/<int:pk>/change_password/', user_views.change_password, name='user-change_password'),

    # Κρατήσεις
    path('holds/', views.HoldViews.index, name='holds-index'),
    path('holds/available/', views.HoldViews.available, name='holds-available'),
    path('holds/<int:hold_id>/lend/', views.HoldViews.hold_to_lend, name='hold-to-lend'),

    # Δανεισμοί
    path('lends/', views.LendViews.index, name='lends-index'),
    path('lends/delays', views.LendViews.delays, name='lends-delays'),

     # Προτάσεις
    path('suggestions/', views.SuggestionViews.index, name='suggestions-index'),

     # Σχόλια χρηστών
    path('comments/', views.CommentViews.index, name='comments-index'),
    
]