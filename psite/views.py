from django.shortcuts import render
from mainapp.vmodels import BookNewest, BookTopTitles, BookBestChoices

# Home
def home(request):
    
    # Ανάκτηση των 10 πρόσφατων εκδόσεων
    newest = BookNewest.objects.all()

    # Ανάκτηση των 10 κορυφαίων τίτλων
    top_titles = BookTopTitles.objects.all()

    # Ανάκτηση των κορυφαίων προτιμήσεων των αναγνωστών
    best_choices = BookBestChoices.objects.all()

    context = {
        'newest': newest,
        'top_titles': top_titles,
        'best_choices': best_choices
    }

    return render (request, 'psite/home.html', context)
