from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponseNotFound, HttpResponseForbidden
from django.contrib.auth.models import User
from django.contrib.auth.decorators import user_passes_test, login_required
from django.contrib import messages
from .models import Hold, Lend, HoldStatus, Book, Entry, Comment
from .forms import (HoldToLendForm, BookForm, BookEntryForm, EntryForm, 
                    BookHoldForm, HoldForm, BookCommentForm, CommentForm,
                    BookLendForm, LendForm)
from .lib import SuperUserMixin

@user_passes_test(lambda u: u.is_superuser)
def dashboard(request):
    return render (request, 'mainapp/dashboard.html', {})

##########################################################################
# Book views
##########################################################################

class BookViews:

    @user_passes_test(lambda u: u.is_superuser)
    def index(request):
        return render (request, 'mainapp/books/index.html', {})

    # book create
    @user_passes_test(lambda u: u.is_superuser)
    def create(request):
        if request.method == 'POST':
            form = BookForm(request.POST)
            if form.is_valid():
                book = form.save()
                messages.success(request, f'Το βιβλίο "{book.title}" καταχωρήθηκε με επιτυχία!')
                return redirect('book-details', book_id=book.id)
        else:
            form = BookForm()

        return render(request, 'mainapp/books/create.html', {'form': form})

    # book update
    @user_passes_test(lambda u: u.is_superuser)
    def update(request, book_id):
        book = get_object_or_404(Book, pk=book_id)
        if request.method == 'POST':
            form = BookForm(request.POST, instance=book)
            if form.is_valid():
                book = form.save()
                messages.success(request, f'Το βιβλίο "{book.title}" ενημερώθηκε με επιτυχία!')
                return redirect('book-details', book_id=book.id)
        else:
            form = BookForm(instance=book)

        return render(request, 'mainapp/books/update.html', {'form': form})        


    # book details
    @user_passes_test(lambda u: u.is_superuser)
    def details(request, book_id):
        book = get_object_or_404(Book, pk=book_id)
        context = {
            'book': book
        }
        return render(request, 'mainapp/books/details.html', context)  


    # Create new entry for book
    @user_passes_test(lambda u: u.is_superuser)
    def new_entry(request, book_id):
        book = get_object_or_404(Book, pk=book_id)
        if request.method == 'POST':
            form = BookEntryForm(book, request.POST)
            if form.is_valid():
                entry = form.save(commit=False)
                entry.book = book
                entry.save()
                messages.success(request, f'Το αντίτυπο με Α/Α "{entry.id}" καταχωρήθηκε με επιτυχία!')
                return redirect('book-details', book_id=book.id)
        else:
            form = BookEntryForm(book)

        return render(request, 'mainapp/books/entries/create.html', {'form': form})


    # create new hold for book
    @user_passes_test(lambda u: u.is_superuser)
    def new_hold(request, book_id):
        book = get_object_or_404(Book, pk=book_id)
        if request.method == 'POST':
            form = BookHoldForm(book, request.POST)
            if form.is_valid():
                hold = form.save(commit=False)

                # Έλεγχος αν υπάρχει ήδη ανοιχτή κράτηση για τον επιλεγμένο χρήστη
                user_holds = Hold.objects.filter(book_id=book.id, user_id=hold.user.id, status_id=0)
                if user_holds:
                    messages.info(request, f'Υπάρχει ήδη κράτηση του χρήστη {hold.user.username} για το βιβλίο "{book.title}"')
                else:
                    hold.book = book
                    hold.save()
                    messages.success(request, f'Η κράτηση για το βιβλίο "{book.title}" στο χρήστη "{hold.user.username}" καταχωρήθηκε με επιτυχία!')
                return redirect('book-details', book_id=book.id)
        else:
            form = BookHoldForm(book)

        return render(request, 'mainapp/books/holds/create.html', {'form': form})


    # Create new comment for book
    @user_passes_test(lambda u: u.is_superuser)
    def new_comment(request, book_id):
        book = get_object_or_404(Book, pk=book_id)
        if request.method == 'POST':
            form = BookCommentForm(book, request.POST)
            if form.is_valid():
                comment = form.save(commit=False)
                comment.book = book
                comment.save()
                messages.success(request, f'Η κριτική του χρήστη "{comment.user.username}" για το βιβλίο "{book.title}" καταχωρήθηκε με επιτυχία!')
                return redirect('book-details', book_id=book.id)
        else:
            form = BookCommentForm(book)

        return render(request, 'mainapp/books/comments/create.html', {'form': form})        
       

    # Create new lend for book
    @user_passes_test(lambda u: u.is_superuser)
    def new_lend(request, book_id):
        
        book = get_object_or_404(Book, pk=book_id)
        
        # Ελεγχος αν υπάρχουν διαθέσιμα αντίτυπα
        if book.book_data.available == 0:
            messages.info(request, f'Δεν υπάρχουν διαθέσιμα αντίτυπα του βιβλίου "{book.title}" για δανεισμό!')
            return redirect('book-details', book_id=book.id)
        
        if request.method == 'POST':
            form = BookLendForm(book, request.POST)
            if form.is_valid():
                lend = form.save()
                messages.success(request, f'Ο δανεισμός του βιβλίου "{book.title}" στον χρήστη "{lend.user.username}" καταχωρήθηκε με επιτυχία!')
                return redirect('book-details', book_id=book.id)
        else:
            form = BookLendForm(book)

        return render(request, 'mainapp/books/lends/create.html', {'form': form})        

        
    @user_passes_test(lambda u: u.is_superuser)
    def search(request):
        return render (request, 'mainapp/books/search.html', {})      

            





##########################################################################
# User views
##########################################################################

class UserViews:

    @user_passes_test(lambda u: u.is_superuser)
    def index(request):
        users = User.objects.all()
        return render (request, 'mainapp/users/index.html', {"users": users})

    @user_passes_test(lambda u: u.is_superuser)
    def create(request):
        return render (request, 'mainapp/users/create.html', {})    


##########################################################################
# Hold views
##########################################################################           

class HoldViews:

    @user_passes_test(lambda u: u.is_superuser)
    def index(request):
        return render (request, 'mainapp/holds/index.html', {})   

    @user_passes_test(lambda u: u.is_superuser)
    # Διαθέσιμα βιβλία κρατήσεων
    def available(request):
        holds = Hold.objects.filter(book__book_data__available__gt = 0, status_id=0)
        context = {
            'holds': holds
        }
        return render(request, 'mainapp/holds/available.html', context)

    # Μετατροπή κράτησης σε δανεισμό
    @user_passes_test(lambda u: u.is_superuser)
    def hold_to_lend(request, hold_id):
        hold = get_object_or_404(Hold, pk=hold_id)
        
        if request.method == 'POST':
            form = HoldToLendForm(hold, request.POST)
            if form.is_valid():
                lend = Lend()   # new lend object
                lend.entry_id = form.cleaned_data['entry_id']
                lend.book_id = hold.book_id
                lend.user_id = hold.user_id
                lend.lend_date = form.cleaned_data['lend_date']
                lend.lend_days = form.cleaned_data['lend_days']
                lend.save()
                hold.status = HoldStatus.closed()   # Αλλαγή του status
                hold.lend = lend
                hold.save()
                messages.success(request, f'Ο δανεισμός καταχωρήθηκε με επιτυχία!')
                return redirect('holds-available')
        else:   # GET request
           form = HoldToLendForm(hold) 

        context = {
            'hold': hold,
            'form': form
        }

        return render(request, 'mainapp/holds/hold_to_lend.html', context)    


    # update hold
    @user_passes_test(lambda u: u.is_superuser)
    def update(request, hold_id):
        hold = get_object_or_404(Hold, pk=hold_id)
        if request.method == 'POST':
            form = HoldForm(request.POST, instance=hold)
            if form.is_valid():
                hold = form.save()
                messages.success(request, f'Η κράτηση του χρήση {hold.user.username} για το βιβλίο {hold.book.title} ενημερώθηκε με επιτυχία!')
                return redirect('book-details', book_id=hold.book.id)
        else:
            form = HoldForm(instance=hold)

        return render(request, 'mainapp/books/holds/update.html', {'form': form})          


    # delete hold
    @user_passes_test(lambda u: u.is_superuser)
    def delete(request, hold_id):
        
        # Αν δεν είναι POST requst επιστροφή
        if request.method != 'POST':
            return HttpResponseNotFound()
        
        # Get hold instance
        hold = get_object_or_404(Hold, pk=hold_id)
        book = hold.book
        user = hold.user

        # delete and go back to book details page
        hold.delete()
        messages.success(request, f'Η κράτηση του χρήση {user.username} για το βιβλίο {book.title} διαγράφηκε με επιτυχία!')
        return redirect('book-details', book.id)    



##########################################################################
# Lend views
##########################################################################           

class LendViews:

    @user_passes_test(lambda u: u.is_superuser)
    def index(request):
        return render (request, 'mainapp/lends/index.html', {})      
    
    @user_passes_test(lambda u: u.is_superuser)
    def delays(request):
         return render (request, 'mainapp/lends/delays.html', {}) 

    # update lend
    @user_passes_test(lambda u: u.is_superuser)
    def update(request, lend_id):
        lend = get_object_or_404(Lend, pk=lend_id)
        if request.method == 'POST':
            form = LendForm(request.POST, instance=lend)
            if form.is_valid():
                lend = form.save()
                messages.success(request, f'Τα στοιχεία δανεισμού του αντιτύπου {lend.entry.id} του βιβλίου "{lend.entry.book.title}" ενημερώθηκε με επιτυχία!')
                return redirect('book-details', book_id=lend.entry.book_id)
        else:
            form = LendForm(instance=lend)

        return render(request, 'mainapp/books/lends/update.html', {'form': form})           



##########################################################################
# Suggestion views
##########################################################################           

class SuggestionViews:

    @user_passes_test(lambda u: u.is_superuser)
    def index(request):
        return render (request, 'mainapp/suggestions/index.html', {})           


##########################################################################
# Comment views
##########################################################################           

class CommentViews:

    @user_passes_test(lambda u: u.is_superuser)
    def index(request):
        return render (request, 'mainapp/comments/index.html', {})    

    # update comment
    @user_passes_test(lambda u: u.is_superuser)
    def update(request, comment_id):
        comment = get_object_or_404(Comment, pk=comment_id)
        if request.method == 'POST':
            form = CommentForm(request.POST, instance=comment)
            if form.is_valid():
                comment = form.save()
                messages.success(request, f'Η κριτική του χρήση "{comment.user.username}" για το βιβλίο "{comment.book.title}" ενημερώθηκε με επιτυχία!')
                return redirect('book-details', book_id=comment.book.id)
        else:
            form = CommentForm(instance=comment)

        return render(request, 'mainapp/books/comments/update.html', {'form': form})              
    
    
    # delete comment
    @user_passes_test(lambda u: u.is_superuser)
    def delete(request, comment_id):
        
        # Αν δεν είναι POST requst επιστροφή
        if request.method != 'POST':
            return HttpResponseNotFound()
        
        # Get comment instance
        comment = get_object_or_404(Comment, pk=comment_id)
        user = comment.user
        book = comment.book

        # delete and go back to book details page
        comment.delete()
        messages.success(request, f'Η κριτική του χρήστη "{user.username}" για το βιβλίο "{book.title}" διαγράφηκε με επιτυχία!')
        return redirect('book-details', book.id)    



##########################################################################
# Entry views
##########################################################################                

class EntryViews:

    # update entry
    @user_passes_test(lambda u: u.is_superuser)
    def update(request, entry_id):
        entry = get_object_or_404(Entry, pk=entry_id)
        if request.method == 'POST':
            form = EntryForm(request.POST, instance=entry)
            if form.is_valid():
                entry = form.save()
                messages.success(request, f'Το αντίτυπο {entry.id} του βιβλίου "{entry.book.title}" ενημερώθηκε με επιτυχία!')
                return redirect('book-details', book_id=entry.book.id)
        else:
            form = EntryForm(instance=entry)

        return render(request, 'mainapp/books/entries/update.html', {'form': form})  

    # delete entry
    @user_passes_test(lambda u: u.is_superuser)
    def delete(request, entry_id):
        
        # Αν δεν είναι POST requst επιστροφή
        if request.method != 'POST':
            return HttpResponseNotFound()
        
        # Get entry instance
        entry = get_object_or_404(Entry, pk=entry_id)
        book = entry.book

        # if connected user is not superuser
        # return HttpResponseForbiten
        if request.user.is_superuser == False:
            return HttpResponseForbidden()

        # delete and go back to book details page
        entry.delete()
        messages.success(request, f'Το αντίτυπο με Α/Α {entry_id} διαγράφηκε με επιτυχία!')
        return redirect('book-details', book.id)
        


    