from django.shortcuts import render
from django.urls import reverse_lazy
from mainapp.lib import SuperUserMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from mainapp.models import Author


# List
class AuthorListView(SuperUserMixin, ListView):
    model = Author
    template_name = 'mainapp/author/list.html'
    context_object_name = 'authors'


# Create    
class AuthorCreateView(SuperUserMixin, SuccessMessageMixin, CreateView):
    model = Author
    template_name = 'mainapp/author/create.html'
    fields = ['author_name', 'email', 'bio']
    success_url = reverse_lazy('author-list')
    
    def form_valid(self, form):
        author = form.instance
        self.success_message = f"Ο συγγραφέας '{author.author_name}' δημιουργήθηκε με επιτυχία!'"
        return super().form_valid(form)


# Update
class AuthorUpdateView(SuperUserMixin, SuccessMessageMixin, UpdateView):
    model = Author
    template_name = 'mainapp/author/update.html'
    fields = ['author_name', 'email', 'bio']
    success_url = reverse_lazy('author-list')

    def form_valid(self, form):
        author = form.instance
        self.success_message = f"Ο συγγραφέας '{author.author_name}' ενημερώθηκε με επιτυχία!'"
        return super().form_valid(form)


# Delete
class AuthorDeleteView(SuperUserMixin, DeleteView):
    model = Author
    success_url = reverse_lazy('author-list')
    
    def delete(self, request, *args, **kwargs):
        author = self.get_object()
        success_message = f'Ο συγγραφέας "{author.author_name}" διαγράφηκε με επιτυχία!'
        messages.success(self.request, success_message)
        return super().delete(self, request, *args, **kwargs)
   


