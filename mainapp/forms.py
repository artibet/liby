from django.forms import ModelForm
from django.contrib.auth.models import User

# Create user form
class UserCreateForm(ModelForm):
    class Meta:
        model = User
        fields = '__all__'
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


