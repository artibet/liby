from django.shortcuts import render
from django.urls import reverse_lazy
from mainapp.lib import SuperUserMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from mainapp.models import Publisher
from mainapp.vmodels import PublisherList


# List
class PublisherListView(SuperUserMixin, ListView):
    model = PublisherList
    template_name = 'mainapp/publisher/list.html'
    context_object_name = 'publishers'


# Create    
class PublisherCreateView(SuperUserMixin, SuccessMessageMixin, CreateView):
    model = Publisher
    template_name = 'mainapp/publisher/create.html'
    fields = ['pub_name', 'country', 'city', 'address', 'zip', 'phone']
    success_url = reverse_lazy('publisher-list')
    
    def form_valid(self, form):
        publisher = form.instance
        self.success_message = f"Ο Εκδοτικός Οίκος '{publisher.pub_name}' δημιουργήθηκε με επιτυχία!'"
        return super().form_valid(form)


# Update
class PublisherUpdateView(SuperUserMixin, SuccessMessageMixin, UpdateView):
    model = Publisher
    template_name = 'mainapp/publisher/update.html'
    fields = ['pub_name', 'country', 'city', 'address', 'zip', 'phone']
    success_url = reverse_lazy('publisher-list')

    def form_valid(self, form):
        publisher = form.instance
        self.success_message = f"Ο Εκδοτικός Οίκος '{publisher.pub_name}' ενημερώθηκε με επιτυχία!'"
        return super().form_valid(form)


# Delete
class PublisherDeleteView(SuperUserMixin, DeleteView):
    model = Publisher
    success_url = reverse_lazy('publisher-list')
    
    def delete(self, request, *args, **kwargs):
        publisher = self.get_object()
        success_message = f'Ο Εκδοτικός Οίκος "{publisher.pub_name}" διαγράφηκε με επιτυχία!'
        messages.success(self.request, success_message)
        return super().delete(self, request, *args, **kwargs)
   


