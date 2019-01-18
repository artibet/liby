from django.shortcuts import render, get_object_or_404, redirect
from django.http import Http404, HttpResponseForbidden, HttpResponseNotFound
from django.contrib import messages
from django.db.models import Q, Avg, Max, Min
from django.urls import reverse_lazy
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required, user_passes_test
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from mainapp.vmodels import BookNewest, BookTopTitles, BookTopPicks
from mainapp.models import Book, Author, Publisher, Category, Comment, Hold, HoldStatus
from .forms import CommentForm, ASearchForm

PAGE_SIZE = 8   # pagination

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
    book_list = []
    for b in newest:
        book_list.append(b.book)

    # paginate book_list
    paginator = Paginator(book_list, PAGE_SIZE)
    page = request.GET.get('page')
    books = paginator.get_page(page)
    

    context = {
        'books': books,
        'title': 'Νέες παραλαβές',
        'entry_date': 1      # flag to display entry date
    }
    
    return render (request, 'psite/browse.html', context)


# Κορυφαίοι τίτλοι
def top_books(request):
    top = BookTopTitles.objects.all()
    book_list = []
    for b in top:
        book_list.append(b.book)

    # paginate book_list
    paginator = Paginator(book_list, PAGE_SIZE)
    page = request.GET.get('page')
    books = paginator.get_page(page)

    context = {
        'books': books,
        'title': 'Κορυφαίοι τίτλοι',
    }
    
    return render (request, 'psite/browse.html', context)


# Προτιμήσεις αναγνωστών
def top_picks(request):
    picks = BookTopPicks.objects.all()
    book_list = []
    for b in picks:
        book_list.append(b.book)

    # paginate book_list
    paginator = Paginator(book_list, PAGE_SIZE)
    page = request.GET.get('page')
    books = paginator.get_page(page)

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
    paginator = Paginator(book_list, PAGE_SIZE)
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
    paginator = Paginator(book_list, PAGE_SIZE)
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
    paginator = Paginator(book_list, PAGE_SIZE)
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
      
    # paginate book_list
    paginator = Paginator(book_list, PAGE_SIZE)
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


# Σύνθετη αναζήτηση
def asearch_form(request):
    form = ASearchForm()
    return render(request, 'psite/asearch.html', {"form":form})  


def asearch_results(request):
    
    form = ASearchForm(request.GET)
    
    if form.is_valid():

        title = form.cleaned_data['title']
        abstract = form.cleaned_data['abstract']
        language = form.cleaned_data['language']
        category = form.cleaned_data['category']
        author = form.cleaned_data['author']
        publisher = form.cleaned_data['publisher']
        country = form.cleaned_data['country']
        published_year = form.cleaned_data['published_year']   

        # q_clauses
        q_title = Q(title__icontains = title)
        q_abstract = Q(abstract__icontains = abstract)
        q_language = Q(language_id = language)
        q_category = Q(categories__id = category)
        q_author = Q(authors__id = author)
        q_publisher = Q(publisher_id = publisher)
        q_country = Q(publisher__country_id = country)
        q_published_year = Q(published_year = published_year)
        

        # check if there is at least one criterium
        if not title and not abstract and not language and not category and not author and not publisher and not country and not published_year:
            messages.error(request, f'Θα πρέπει αν δώσετε τουλάχιστον ένα κριτήριο αναζήτησης!')
            return render(request, 'psite/asearch.html', {"form":form})  
        
        else:
            
            q_clause = None

            # title
            if title:
                q_clause = q_title

            # abstract
            if abstract:
                if q_clause:
                    q_clause = q_clause & q_abstract
                else:
                    q_clause = q_abstract

            # language
            if language:
                if q_clause:
                    q_clause = q_clause & q_language
                else:
                    q_clause = q_language

            # category
            if category:
                if q_clause:
                    q_clause = q_clause & q_category
                else:
                    q_clause = q_category

            # author
            if author:
                if q_clause:
                    q_clause = q_clause & q_author
                else:
                    q_clause = q_author

            # publisher
            if publisher:
                if q_clause:
                    q_clause = q_clause & q_publisher
                else:
                    q_clause = q_publisher

            # country
            if country:
                if q_clause:
                    q_clause = q_clause & q_country
                else:
                    q_clause = q_country     

            # published_year
            if published_year:
                if q_clause:
                    q_clause = q_clause & q_published_year
                else:
                    q_clause = q_published_year            

            
            
            # Ανάκτηση βιβλίων ανάλογα με το κριτήριο
            # book_list = Book.objects.filter(q_clause)
            book_list = Book.objects.filter(q_clause)
            
            # paginate book_list
            paginator = Paginator(book_list, PAGE_SIZE)
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

    
    return render(request, 'psite/asearch.html', {"form":form})  

    

# Καταχώρηση αξιολόγησης (comment) για βιβλίο
@login_required
def create_comment(request, book_id):
    book = get_object_or_404(Book, pk=book_id)

    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            form.instance.book_id = book.id
            form.instance.user_id = request.user.id
            form.save()
            messages.success(request, f'Η αξιολόγησή σας καταχωρήθηκε με επιτυχία!')
            return redirect('psite:book', book.id)
    else:
        # Αν ο συνδεδεμένος χρήστης έχει ήδη καταχωρήσει κριτική, 
        # εμφάνιση σχετικού μηνύματος
        # comment = Comment.objects.filter(user_id=request.user.id, book_id=book.id)
        # if comment:
        #     messages.error(request, f'Εχετε ήδη καταχωρήση μία αξιολόγηση για το συγκεκριμένο βιβλίο!')
        #     return redirect('psite:book', book.id)
        # else:
        form = CommentForm()

    context = {
        'form': form,
        'book': book
    }

    return render(request, 'psite/comment_form.html', context)
    

# Επεξεργασία υπάρχουσας αξιολόγησης
@login_required
def update_comment(request, comment_id):
    comment = get_object_or_404(Comment, pk=comment_id)
    book = comment.book
    
    # if connected user is not the author of the comment
    # return HttpResponseForbidden
    if comment.user.id != request.user.id:
        return HttpResponseForbidden()

    if request.method == 'POST':
        form = CommentForm(request.POST, instance=comment)
        if form.is_valid():
            form.instance.book_id = book.id
            form.instance.user_id = request.user.id
            form.save()
            messages.success(request, f'Η αξιολόγησή σας ενημερώθηκε με επιτυχία!')
            return redirect('psite:book', book.id)
    else:
        form = CommentForm(instance=comment)

    context = {
        'form': form,
        'book': book
    }

    return render(request, 'psite/comment_form.html', context)


# Διαγραφή αξιολόγησης
@login_required
def delete_comment(request, comment_id):
    
    # Αν δεν είναι POST requst επιστροφή
    if request.method != 'POST':
        return HttpResponseNotFound()
    
    # Get comment instance and respective book
    comment = get_object_or_404(Comment, pk=comment_id)
    book = comment.book

    # if connected user is not the author of the comment
    # return HttpResponseForbiten
    if comment.user.id != request.user.id:
        return HttpResponseForbidden()

    # delete and go back to book details page
    comment.delete()
    messages.success(request, f'Η αξιολόγησή σας διαγράφηκε με επιτυχία!')
    return redirect('psite:book', book.id)
    
   
# Κράτηση βιβλίου
@login_required
def hold_book(request, book_id):
    
    # get book instance
    book = get_object_or_404(Book, pk=book_id)
   
    # POST request
    if request.method == 'POST':
        hold = Hold()   # new Hold object
        hold.book = book
        hold.user = request.user
        hold.status = HoldStatus.opened()
        hold.save()
        messages.success(request, f'Η κράτησή σας πραγματοποιήθηκε με επιτυχία!')
        return redirect('psite:book', book.id)
    
    # GET request

    # Έλεγχος αν ο τρέχον χρήστης έχει ήδη ενεργή κράτηση
    active_hold = Hold.objects.filter(book_id=book_id, user_id=request.user.id, status_id=0).first()
    if active_hold:
        has_active_hold = True
        active_hold_date = active_hold.created_at
    else:
        active_hold_date = ''
        has_active_hold = False

    # Ενεργές κρατήσεις και πιο παλαιότερη - νεότερη κράτηση
    active_holds = book.book_data.active_holds
    if active_holds > 0:
        oldest_hold = Hold.objects.filter(status_id=0, book_id=book_id).aggregate(Min('created_at')).get('created_at__min')
        newest_hold = Hold.objects.filter(status_id=0, book_id=book_id).aggregate(Max('created_at')).get('created_at__max')
    else:
        oldest_hold = ''
        newest_hold = ''

    context = {
        'book': book,
        'has_active_hold': has_active_hold,
        'active_hold_date': active_hold_date,
        'active_holds': active_holds,
        'oldest_hold': oldest_hold,
        'newest_hold': newest_hold
    }

    return render(request, 'psite/hold.html', context)
    
    



    

    

