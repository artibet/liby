from django.urls import path
from . import views

app_name = 'psite'

urlpatterns = [
    path('', views.home, name='home'),                      
    path('book/<int:book_id>/', views.book_details, name='book'),
    path('book/<int:book_id>/create_comment', views.create_comment, name='create-comment'),
    path('book/<int:book_id>/hold', views.hold_book, name='hold-book'),
    path('new_books/', views.new_books, name='new_books'),
    path('top_books/', views.top_books, name='top-books'),
    path('top_picks/', views.top_picks, name='top-picks'),
    path('author/<int:author_id>/', views.author, name='author'),
    path('publisher/<int:publisher_id>/', views.publisher, name='publisher'),
    path('category/<int:category_id>/', views.category, name='category'),
    path('search/', views.search, name='search'),
    path('asearch_form/', views.asearch_form, name='asearch-form'),
    path('asearch_results/', views.asearch_results, name='asearch-results'),
        
    path('comment/<int:comment_id>/update/', views.update_comment, name='update-comment'),
    path('comment/<int:comment_id>/delete/', views.delete_comment, name='delete-comment'),
    
]