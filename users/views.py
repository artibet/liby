from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.hashers import make_password
from django.http import HttpResponseNotFound, HttpResponseNotAllowed
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm, UserProfileForm
from mainapp.models import Hold, HoldStatus, Lend

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
    if request.method == 'POST':
        form = UserProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            request.user.first_name = form.cleaned_data['first_name']
            request.user.last_name = form.cleaned_data['last_name']
            request.user.email = form.cleaned_data['email']
            request.user.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Τα στοιχεία του λογαριασμού σας ενημερώθηκαν με επιτυχία.')
            return redirect('psite:home')
    else:
        form = UserProfileForm(instance=request.user)
    return render(request, 'users/profile.html', {'form': form}) 


# user hold list (Οι κρατήσεις μου)
@login_required
def hold_list(request):
    
    # Ανάκτηση κρατήσεων του συνδεδεμένου χρήστη
    holds = Hold.objects.filter(user = request.user).order_by('created_at')

    return render(request, 'users/holds/list.html', {'holds': holds})


# Ιστορικό δανεισμών
@login_required
def lend_history(request):
    lends = Lend.objects.filter(user = request.user).order_by('-lend_date')
    return render(request, 'users/lends/history.html', {'lends': lends})    


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


# Αλλαγή συνθηματικού
@login_required
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            request.user.password = make_password(request.POST['new_password1'])
            request.user.save()
            messages.success(request, f'Το συνθηματικό του χρήστη "{request.user.username}" άλλαξε με επιτυχία. Συνδεθείτε ξανά.')
            return redirect('login')
    else:
        form = PasswordChangeForm(request.user)

    return render(request, 'users/change_password.html', {'form': form})