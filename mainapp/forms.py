from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User
from django.utils import timezone
from datetime import datetime
from .models import Lend, Entry, Hold


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



################################################################################################################
# Hold forms
################################################################################################################  

# Μετατροπή κράτησης σε δανεισμό
class HoldToLendForm(forms.Form):

    # Override init to pass Hold instance
    def __init__(self, hold, *args, **kwargs):
        
        super(HoldToLendForm, self).__init__(*args, **kwargs)

        # Ανάκτηση διαθέσιμων αντιτύπων
        book_id = hold.book.id
        reserved_entry_list = Lend.objects.filter(entry__book_id=book_id, return_date__isnull=True).values_list('entry_id', flat=True)
        available_entry_list = Entry.objects.filter(book_id=book_id).exclude(id__in=reserved_entry_list).values_list('id', flat=True)
        choices = []
        for n in available_entry_list:
            choices.append((n,n))

        # Τα πεδία της φόρμας
        self.fields['entry_id'] = forms.ChoiceField(label="Αριθμός αντιτύπου", choices=choices)
        self.fields['lend_date'] = forms.DateTimeField(label="Ημερομηνία δανεισμού",  input_formats=['%d/%m/%Y %H:%M'], initial=timezone.now)
        self.fields['lend_days'] = forms.IntegerField(label="Διάρκεια δανεισμού (μέρες)", initial=20)

    

    
    