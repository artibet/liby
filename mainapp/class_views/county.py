from django.shortcuts import render
from django.urls import reverse_lazy
from mainapp.lib import SuperUserMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from mainapp.models import Country


# List
class CountryListView(SuperUserMixin, ListView):
    model = Country
    template_name = 'mainapp/country/list.html'
    context_object_name = 'countries'


# Create    
class CountryCreateView(SuperUserMixin, SuccessMessageMixin, CreateView):
    model = Country
    template_name = 'mainapp/country/create.html'
    fields = ['code', 'description']
    success_url = reverse_lazy('country-list')
    
    def form_valid(self, form):
        country = form.instance
        self.success_message = f"Η χώρα '{country.description}' δημιουργήθηκε με επιτυχία!'"
        return super().form_valid(form)


# Update
class CountryUpdateView(SuperUserMixin, SuccessMessageMixin, UpdateView):
    model = Country
    template_name = 'mainapp/country/update.html'
    fields = ['code', 'description']
    success_url = reverse_lazy('country-list')

    def form_valid(self, form):
        country = form.instance
        self.success_message = f"Η χώρα '{country.description}' ενημερώθηκε με επιτυχία!'"
        return super().form_valid(form)


# Delete
class CountryDeleteView(SuperUserMixin, DeleteView):
    model = Country
    success_url = reverse_lazy('country-list')
    
    def delete(self, request, *args, **kwargs):
        country = self.get_object()
        success_message = f'Η χώρα "{country.description}" διαγράφηκε με επιτυχία!'
        messages.success(self.request, success_message)
        return super().delete(self, request, *args, **kwargs)
   


