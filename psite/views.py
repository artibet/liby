from django.shortcuts import render
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from mainapp.vmodels import BookNewest, BookTopTitles, BookBestChoices
from mainapp.models import Book


# Home
def home(request):
    
    # Ανάκτηση των 10 πρόσφατων εκδόσεων
    newest = BookNewest.objects.all()

    # Ανάκτηση των 10 κορυφαίων τίτλων
    top_titles = BookTopTitles.objects.all()

    # Ανάκτηση των κορυφαίων προτιμήσεων των αναγνωστών
    best_choices = BookBestChoices.objects.all()

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