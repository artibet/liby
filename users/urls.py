
from django.urls import path
from .views import hold_list, revoke_hold

# namespace urls
app_name = 'users'

urlpatterns = [
    path('holds/', hold_list, name='hold-list'),
    path('hold/<int:hold_id>/revoke', revoke_hold, name='revoke-hold'),
 
]