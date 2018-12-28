from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User
from bootstrap_datepicker_plus import DateTimePickerInput


# Create user form
class UserCreateForm(ModelForm):
    class Meta:
        model = User
        fields = ['username', 'password', 'email', 'last_name', 'first_name', 'is_superuser', 'is_staff', 'is_active']
        labels = {
            'username': 'Όνομα Χρήστη',
            'password': 'Κωδικός Πρόσβασης',
            'email': 'Διεύθυνση email',
            'last_name': 'Επώνυμο',
            'first_name': 'Όνομα',
            'is_superuser': 'Διαχειριστής',
            'is_staff': 'Εκδότης',
            'is_active': 'Ενεργός'
        }
        help_texts = {
            'username': '',
            'is_superuser': '',
            'is_staff': '',
            'is_active': ''
        }
        widgets = {
            'password': forms.PasswordInput(),
        }    


# Update user form
class UserUpdateForm(ModelForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'last_name', 'first_name', 'is_superuser', 'is_staff', 'is_active', 'date_joined', 'last_login']
        labels = {
            'username': 'Όνομα Χρήστη',
            'password': 'Κωδικός Πρόσβασης',
            'email': 'Διεύθυνση email',
            'last_name': 'Επώνυμο',
            'first_name': 'Όνομα',
            'is_superuser': 'Διαχειριστής',
            'is_staff': 'Εκδότης',
            'is_active': 'Ενεργός',
            'date_joined': 'Εγγραφή',
            'last_login': 'Τελευταία Σύνδεση',
        }
        help_texts = {
            'username': '',
            'is_superuser': '',
            'is_staff': '',
            'is_active': ''
        }
        widgets = {
            'password': forms.PasswordInput()
        } 

# Change password form
class ChangePasswordForm(forms.Form):
    password = forms.CharField(label='Νέο Συνθηματικό', max_length=128, widget=forms.PasswordInput)
   