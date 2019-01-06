from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.http import HttpResponseNotFound, HttpResponseNotAllowed
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm
from mainapp.models import Hold, HoldStatus

def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Ο λογαριασμός "{username}" δημιουργήθηκε με επιτυχία! Συνδεθείτε στην εφαρμογή.')
            return redirect('login')
    else:
        form = UserRegisterForm()
    return render(request, 'users/register.html', {'form': form})

@login_required
def profile(request):
    return render(request, 'users/profile.html')    


# user hold list
@login_required
def hold_list(request):
    
    # Ανάκτηση κρατήσεων του συνδεδεμένου χρήστη
    holds = Hold.objects.filter(user = request.user).order_by('created_at')

    return render(request, 'users/holds/list.html', {'holds': holds})


# Ανάκληση κράτησης
@login_required
def revoke_hold(request, hold_id):
    
    # Αν δεν είναι POST request - 404
    if request.method != "POST":
        return HttpResponseNotFound

    # Ανάκτηση κράτησης
    hold = get_object_or_404(Hold, pk=hold_id)

    # Έλεγχος αν ο συνδεδεμένος χρήστης είναι κάτοχος της κράτησης
    if (request.user != hold.user):
        return HttpResponseNotAllowed

    # Ανάκληση κράτησης και επιστροφή στον πίνακα κρατήσεων
    hold.status = HoldStatus.canceled()
    hold.save()
    return redirect('users:hold-list')
