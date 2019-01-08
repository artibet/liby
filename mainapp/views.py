from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Hold, Lend, HoldStatus
from .forms import HoldToLendForm

@login_required
def dashboard(request):
    return render (request, 'mainapp/dashboard.html', {})

##########################################################################
# Book views
##########################################################################

class BookViews:

    def index(request):
        return render (request, 'mainapp/books/index.html', {})

    def create(request):
        return render (request, 'mainapp/books/create.html', {})    

    def search(request):
        return render (request, 'mainapp/books/search.html', {})                





##########################################################################
# User views
##########################################################################

class UserViews:

    def index(request):
        users = User.objects.all()
        return render (request, 'mainapp/users/index.html', {"users": users})

    def create(request):
        return render (request, 'mainapp/users/create.html', {})    


##########################################################################
# Hold views
##########################################################################           

class HoldViews:

    def index(request):
        return render (request, 'mainapp/holds/index.html', {})   

    # Διαθέσιμα βιβλία κρατήσεων
    def available(request):
        holds = Hold.objects.filter(book__book_data__available__gt = 0, status_id=0)
        context = {
            'holds': holds
        }
        return render(request, 'mainapp/holds/available.html', context)

    # Μετατροπή κράτησης σε δανεισμό
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



##########################################################################
# Lend views
##########################################################################           

class LendViews:

    def index(request):
        return render (request, 'mainapp/lends/index.html', {})      

    def delays(request):
         return render (request, 'mainapp/lends/delays.html', {})  



##########################################################################
# Suggestion views
##########################################################################           

class SuggestionViews:

    def index(request):
        return render (request, 'mainapp/suggestions/index.html', {})           


##########################################################################
# Comment views
##########################################################################           

class CommentViews:

    def index(request):
        return render (request, 'mainapp/comments/index.html', {})          