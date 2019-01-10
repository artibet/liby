from django.shortcuts import render
from django.urls import reverse_lazy
from mainapp.lib import SuperUserMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from mainapp.models import Book

# Create    
class BookCreateView(SuperUserMixin, SuccessMessageMixin, CreateView):
    model = Book
    template_name = 'mainapp/books/create.html'
    context_object_name = 'book'
    fields = [
        'image',
        'title',
        'revision',
        'isbn',
        'language',
        'publisher',
        'published_year',
        'published_month',
        'pages',
        'dimensions',
        'weight',
        'abstract'
    ]
    success_url = reverse_lazy('book-details')
    
    def form_valid(self, form):
        book = form.instance
        self.success_message = f"Το βιβλίο με τίτλο '{book.title}' δημιουργήθηκε με επιτυχία!'"
        return super().form_valid(form)