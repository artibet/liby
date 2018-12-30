from django.shortcuts import render, get_object_or_404
from django.http import Http404
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

    target = request.POST['search-target']
    text = request.POST['search-text']

    if target == '1':       # search in book titles
        books = Book.objects.filter(title__icontains = text)
        title = f"Αποτέλεσμα αναζήτησης του '{text}' στους τίτλους βιβλίων"
    elif target == '2':     # search in author names
        books = Book.objects.filter(authors__author_name__icontains = text).distinct()
        title = f"Αποτέλεσμα αναζήτησης του '{text}' στα ονόματα συγγραφέων"
    elif target == '3':     # search in ISBN
        books = Book.objects.filter(isbn__icontains = text)
        title = f"Αποτέλεσμα αναζήτησης του '{text}' στο ISBN των βιβλίων"        
    else:
       raise Http404('error')   

    context = {
        'books': books,
        'title': title
    } 

    return render (request, 'psite/browse.html', context)   
    