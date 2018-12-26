from django.shortcuts import render
from mainapp.vmodels import BookNewest

# Home
def home(request):
    
    # Ανάκτηση των 10 πρόσφατων εκδόσεων
    newest = BookNewest.objects.all()
    context = {
        'newest': newest
    }

    return render (request, 'psite/home.html', context)
