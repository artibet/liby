from django.shortcuts import render
from django.urls import reverse_lazy
from mainapp.lib import SuperUserMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from mainapp.models import Language
from mainapp.vmodels import LanguageList


# List
class LanguageListView(SuperUserMixin, ListView):
    model = LanguageList
    template_name = 'mainapp/language/list.html'
    context_object_name = 'langs'


# Create    
class LanguageCreateView(SuperUserMixin, SuccessMessageMixin, CreateView):
    model = Language
    template_name = 'mainapp/language/create.html'
    fields = ['description']
    success_url = reverse_lazy('language-list')
    
    def form_valid(self, form):
        language = form.instance
        self.success_message = f"Η γλώσσα '{language.description}' δημιουργήθηκε με επιτυχία!'"
        return super().form_valid(form)


# Update
class LanguageUpdateView(SuperUserMixin, SuccessMessageMixin, UpdateView):
    model = Language
    template_name = 'mainapp/language/update.html'
    fields = ['description']
    success_url = reverse_lazy('language-list')

    def form_valid(self, form):
        language = form.instance
        self.success_message = f"Η γλώσσα '{language.description}' ενημερώθηκε με επιτυχία!'"
        return super().form_valid(form)


# Delete
class LanguageDeleteView(SuperUserMixin, DeleteView):
    model = Language
    success_url = reverse_lazy('language-list')
    
    def delete(self, request, *args, **kwargs):
        language = self.get_object()
        success_message = f'Η γλώσσα "{language.description}" διαγράφηκε με επιτυχία!'
        messages.success(self.request, success_message)
        return super().delete(self, request, *args, **kwargs)
   


