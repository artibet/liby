from django.shortcuts import render
from django.urls import reverse_lazy
from mainapp.lib import SuperUserMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.models import User
from mainapp.vmodels import UserList
from mainapp.forms import UserCreateForm


# List
class UserListView(ListView):
    model = UserList
    template_name = 'mainapp/user/list.html'
    context_object_name = 'users'


# Create    
class UserCreateView(SuccessMessageMixin, CreateView):
    model = User
    template_name = 'mainapp/user/create.html'
    fields = ['username', 'password', 'email', 'last_name', 'first_name', 'is_superuser', 'is_staff', 'is_active']
    form_class = UserCreateForm
    success_url = reverse_lazy('user-list')
    
    def form_valid(self, form):
        user = form.instance
        self.success_message = f"Ο χρήστης '{user.username}' δημιουργήθηκε με επιτυχία!'"
        return super().form_valid(form)


# Update
class UserUpdateView(SuccessMessageMixin, UpdateView):
    model = User
    template_name = 'mainapp/user/update.html'
    fields = ['username', 'email', 'last_name', 'first_name', 'is_superuser', 'is_staff', 'is_active', 'date_joined', 'last_login']
    success_url = reverse_lazy('user-list')

    def form_valid(self, form):
        user = form.instance
        self.success_message = f"Ο χρήστης '{user.username}' ενημερώθηκε με επιτυχία!'"
        return super().form_valid(form)


# Delete
class UserDeleteView(DeleteView):
    model = User
    success_url = reverse_lazy('user-list')
    
    def delete(self, request, *args, **kwargs):
        user = self.get_object()
        success_message = f'Ο χρήστης "{user.username}" διαγράφηκε με επιτυχία!'
        messages.success(self.request, success_message)
        return super().delete(self, request, *args, **kwargs)
   


