from django.forms import ModelForm
from django.forms.widgets import CheckboxSelectMultiple
from django import forms
from django.contrib.auth.models import User
from django.utils import timezone
from datetime import datetime
from .models import Lend, Entry, Hold, Book, Comment


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

    
class HoldForm(forms.ModelForm):
    class Meta:
        model = Hold
        fields = [
            'user',
            'created_at'
        ]     

################################################################################################################
# Book forms
################################################################################################################  

class BookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = [
            'image',
            'title',
            'revision',
            'isbn',
            'language',
            'authors',
            'categories',
            'publisher',
            'published_year',
            'published_month',
            'pages',
            'dimensions',
            'weight',
            'abstract'

        ]

    

# Νέο αντίτυπο μέσα από την σελίδα του βιβλίου
class BookEntryForm(forms.ModelForm):
    class Meta:
        model = Entry
        fields = [
            'entry_date',
            'classification',
            'cancel_date',
            'notes'
        ]      

    def __init__(self, book, *args, **kwargs):
        super(BookEntryForm, self).__init__(*args, **kwargs)
        self.book = book


# Νέα κράτηση μέσα από την σελίδα του βιβλίου
class BookHoldForm(forms.ModelForm):
    class Meta:
        model = Hold
        fields = [
            'user',
            'created_at'
        ] 
        labels = {
            'user': 'Κράτηση για τον χρήστη'
        }     

    def __init__(self, book, *args, **kwargs):
        super(BookHoldForm, self).__init__(*args, **kwargs)
        self.book = book     


# Νέα αξιολόγηση από τη σελίδα του βιβλίου
class BookCommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = [
            'user',
            'created_at',
            'stars',
            'body'
        ] 
        labels = {
            'user': 'Σχόλιο για τον χρήστη'
        }     

    def __init__(self, book, *args, **kwargs):
        super(BookCommentForm, self).__init__(*args, **kwargs)
        self.book = book     


# Νέος δανεισμός από τη σελίδα του βιβλίου
class BookLendForm(forms.ModelForm):
    class Meta:
        model = Lend
        fields = [
            'entry',
            'user',
            'lend_date',
            'lend_days',
            'return_date'
        ] 
        labels = {
            'user': 'Δανεισμός στον χρήστη'
        }     

    def __init__(self, book, *args, **kwargs):
        super(BookLendForm, self).__init__(*args, **kwargs)
        self.book = book 
        
        reserved_entry_list = Lend.objects.filter(entry__book_id=book.id, return_date__isnull=True).values_list('entry_id', flat=True)
        available_entry_list = Entry.objects.filter(book_id=book.id).exclude(id__in=reserved_entry_list).values_list('id', flat=True)
        choices = []
        for n in available_entry_list:
            choices.append((n,n))    

        self.fields['entry'].choices = choices

################################################################################################################
# Entry forms
################################################################################################################  

class EntryForm(forms.ModelForm):
    class Meta:
        model = Entry
        fields = [
            'entry_date',
            'classification',
            'cancel_date',
            'notes'
        ]      


################################################################################################################
# Comment forms
################################################################################################################      

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = [
            'user',
            'created_at',
            'stars',
            'body'
        ]


################################################################################################################
# Lend forms
################################################################################################################  

class LendForm(forms.ModelForm):
    class Meta:
        model = Lend
        fields = [
            'entry',
            'user',
            'lend_date',
            'lend_days',
            'return_date'
        ] 
   

    def __init__(self, *args, **kwargs):
        super(LendForm, self).__init__(*args, **kwargs)
        lend = self.instance
        reserved_entry_list = Lend.objects.filter(entry__book_id=lend.entry.book_id, return_date__isnull=True).values_list('entry_id', flat=True)
        available_entry_list = Entry.objects.filter(book_id=lend.entry.book_id).exclude(id__in=reserved_entry_list).values_list('id', flat=True)
        choices = []
        for n in available_entry_list:
            choices.append((n,n))    
        choices.append((lend.entry_id, lend.entry_id))   # add current entry from reserve list
        self.fields['entry'].choices = choices         