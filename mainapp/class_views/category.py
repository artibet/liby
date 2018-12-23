from django.shortcuts import render
from django.urls import reverse_lazy
from mainapp.lib import SuperUserMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from mainapp.models import Category
from mainapp.vmodels import CategoryList


# List
class CategoryListView(ListView):
    model = CategoryList
    template_name = 'mainapp/category/list.html'
    context_object_name = 'categories'


# Create    
class CategoryCreateView(SuperUserMixin, SuccessMessageMixin, CreateView):
    model = Category
    template_name = 'mainapp/category/create.html'
    fields = ['description']
    success_url = reverse_lazy('category-list')
    
    def form_valid(self, form):
        category = form.instance
        self.success_message = f"Η κατηγορία '{category.description}' δημιουργήθηκε με επιτυχία!'"
        return super().form_valid(form)


# Update
class CategoryUpdateView(SuperUserMixin, SuccessMessageMixin, UpdateView):
    model = Category
    template_name = 'mainapp/category/update.html'
    fields = ['description']
    success_url = reverse_lazy('category-list')

    def form_valid(self, form):
        category = form.instance
        self.success_message = f"Η κατηγορία '{category.description}' ενημερώθηκε με επιτυχία!'"
        return super().form_valid(form)


# Delete
class CategoryDeleteView(SuperUserMixin, DeleteView):
    model = Category
    success_url = reverse_lazy('category-list')
    
    def delete(self, request, *args, **kwargs):
        category = self.get_object()
        success_message = f'Η κατηγορία "{category.description}" διαγράφηκε με επιτυχία!'
        messages.success(self.request, success_message)
        return super().delete(self, request, *args, **kwargs)
   


