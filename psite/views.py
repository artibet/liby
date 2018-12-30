from django.shortcuts import render, get_object_or_404
from django.http import Http404
from django.db.models import Q
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from mainapp.vmodels import BookNewest, BookTopTitles, BookTopPicks
from mainapp.models import Book, Author, Publisher, Category


# Home
def home(request):
    
    # Ανάκτηση των 20 πρόσφατων εκδόσεων
    newest = BookNewest.objects.all()[:20]

    # Ανάκτηση των 20 κορυφαίων τίτλων
    top_titles = BookTopTitles.objects.all()[:20]

    # Ανάκτηση των 20 κορυφαίων προτιμήσεων των αναγνωστών
    best_choices = BookTopPicks.objects.all()[:20]

    context = {
        'newest': newest,
        'top_titles': top_titles,
        'best_choices': best_choices
    }

    return render (request, 'psite/home.html', context)


# Book details
class BookDetailView(DetailView):
    model = Book
    template_name = 'psite/book.html'
    context_object_name = 'book'


# Νέες παραλαβές
def new_books(request):
    newest = BookNewest.objects.all()
    books = []
    for b in newest:
        books.append(b.book)

    context = {
        'books': books,
        'title': 'Νέες παραλαβές',
        'entry_date': 1      # flag to display entry date
    }
    
    return render (request, 'psite/browse.html', context)


# Κορυφαίοι τίτλοι
def top_books(request):
    top = BookTopTitles.objects.all()
    books = []
    for b in top:
        books.append(b.book)

    context = {
        'books': books,
        'title': 'Κορυφαίοι τίτλοι',
    }
    
    return render (request, 'psite/browse.html', context)


# Προτιμήσεις αναγνωστών
def top_picks(request):
    picks = BookTopPicks.objects.all()
    books = []
    for b in picks:
        books.append(b.book)

    context = {
        'books': books,
        'title': 'Προτιμήσεις αναγνωστών',
        'total_lends': 1
    }
    
    return render (request, 'psite/browse.html', context)    


# Author page
def author(request, author_id):
    author = get_object_or_404(Author, pk=author_id)
    
    context = {
        'author': author,
        'books': author.books.all(),
    }

    return render (request, 'psite/author.html', context)    


# Publisher page
def publisher(request, publisher_id):
    publisher = get_object_or_404(Publisher, pk=publisher_id)
    
    context = {
        'publisher': publisher,
        'books': publisher.books.all()
    }

    return render (request, 'psite/publisher.html', context)      


# Category page
def category(request, category_id):
    category = get_object_or_404(Category, pk=category_id)
    books = category.books.all()

    context = {
        'books': books,
        'title': category.description,
    }
    
    return render (request, 'psite/browse.html', context)        


# Αναζήτηση
def search(request):
    if request.method != 'POST':
        raise Http404('error')   

    key = request.POST['search-text']

    q_title = Q(title__icontains = key)
    q_abstract = Q(abstract__icontains = key)
    q_author = Q(authors__author_name__icontains = key)
    q_isbn = Q(isbn__icontains = key)

    q_clause = q_title | q_abstract | q_author | q_isbn
    books = Book.objects.filter(q_clause)

    context = {
        'books': books,
        'title': 'Αποτέλεσμα αναζήτησης'
    } 

    return render (request, 'psite/browse.html', context)   
    

# Σύνθετη αναζήτηση

    