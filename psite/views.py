from django.shortcuts import render, get_object_or_404
from django.http import Http404
from django.db.models import Q
from django.core.paginator import Paginator
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
def book_details(request, book_id):
    
    book = get_object_or_404(Book, pk=book_id)
    comments = book.comment_set.order_by('-updated_at')

    context = {
        'book': book,
        'comments': comments
    }

    return render (request, 'psite/book.html', context)
    


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

    # paginate book_list
    book_list = author.books.all()
    paginator = Paginator(book_list, 8)
    page = request.GET.get('page')
    books = paginator.get_page(page)
    
    context = {
        'author': author,
        'books': books
    }

    return render (request, 'psite/author.html', context)    


# Publisher page
def publisher(request, publisher_id):
    publisher = get_object_or_404(Publisher, pk=publisher_id)

    # paginate book_list
    book_list = publisher.books.all()
    paginator = Paginator(book_list, 8)
    page = request.GET.get('page')
    books = paginator.get_page(page)
    
    context = {
        'publisher': publisher,
        'books': books
    }

    return render (request, 'psite/publisher.html', context)      


# Category page
def category(request, category_id):
    category = get_object_or_404(Category, pk=category_id)

    # paginate book_list
    book_list = category.books.all()
    paginator = Paginator(book_list, 8)
    page = request.GET.get('page')
    books = paginator.get_page(page)

    context = {
        'books': books,
        'title': f"{category.description} ({paginator.count})",
    }
    
    return render (request, 'psite/browse.html', context)        


# Αναζήτηση
def search(request):

    # get search criteria
    key = request.GET['search-text']
    target = request.GET['search-target']

    # Δημιουργούμε q clauses για το κριτήριο αναζήτησης
    q_title = Q(title__icontains = key)
    q_abstract = Q(abstract__icontains = key)
    q_author = Q(authors__author_name__icontains = key)
    q_isbn = Q(isbn__icontains = key)
    q_invalid = Q(id = -1)  
        
    # Ανάλογα με την επιλογή αναζήτησης (target)
    # διαμορφώνεται η τελική q_clause 
    if target == '1':     # Αναζήτηση σε τίτλο
        q_clause = q_title
    elif target == '2':   # Αναζήτηση στην περίληψη
        q_clause = q_abstract
    elif target == '3':   # Αναζήτηση στον συγγραφέα
        q_clause = q_author
    elif target == '4':   # Αναζήτηση σε ISBN
        q_clause = q_isbn
    elif target == '5':    # Αναζήτηση οπουδήποτε
        q_clause = q_title | q_abstract | q_author | q_isbn
    else:
        q_clause = q_invalid      # invalid target - return none
    
    # Ανάκτηση βιβλίων ανάλογα με το κριτήριο
    book_list = Book.objects.filter(q_clause)
    print(book_list)
    
    # paginate book_list
    num_per_page = 12
    paginator = Paginator(book_list, num_per_page)
    page = request.GET.get('page')
    books = paginator.get_page(page)
    num_books = paginator.count

    if num_books > 0:
        title = f"Bρέθηκαν {num_books} βιβλία"
    else:
        title = 'Δεν βρέθηκαν βιβλία'
    
    context = {
        'books': books,
        'title': title
    } 

    return render (request, 'psite/browse.html', context)   
    


    