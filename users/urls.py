
from django.urls import path
from .views import hold_list, lend_history, revoke_hold, change_password

# namespace urls
app_name = 'users'

urlpatterns = [
    path('holds/', hold_list, name='hold-list'),    # οι κρατήσεις μου
    path('lends/', lend_history, name='lend-history'),    # οι ιστορικό δανεισμών
    path('change_password', change_password, name='change-password'),    # Αλλαγή συνθηματικού
    path('hold/<int:hold_id>/revoke', revoke_hold, name='revoke-hold'),
 
]