from django.shortcuts import render
from django.contrib.auth.models import User
from . import models

def dashboard(request):
    return render (request, 'mainapp/dashboard.html', {})

##########################################################################
# Book views
##########################################################################

class BookViews:

    def index(request):
        return render (request, 'mainapp/books/index.html', {})

    def create(request):
        return render (request, 'mainapp/books/create.html', {})    

    def search(request):
        return render (request, 'mainapp/books/search.html', {})                


##########################################################################
# Author views
##########################################################################

class AuthorViews:

    def index(request):
        authors = models.Author.objects.all()
        return render (request, 'mainapp/authors/index.html', {'authors': authors})


##########################################################################
# Category views
##########################################################################

class CategoryViews:

    def index(request):
        categories = models.Category.objects.all()
        return render (request, 'mainapp/categories/index.html', {'categories': categories})        


##########################################################################
# Publisher views
##########################################################################

class PublisherViews:

    def index(request):
        publishers = models.Publisher.objects.all()
        return render (request, 'mainapp/publishers/index.html', {'publishers': publishers})     


##########################################################################
# Language views
##########################################################################

class LanguageViews:

    def index(request):
        langs = models.Language.objects.all()
        return render (request, 'mainapp/languages/index.html', {'langs': langs})         





##########################################################################
# User views
##########################################################################

class UserViews:

    def index(request):
        users = User.objects.all()
        return render (request, 'mainapp/users/index.html', {"users": users})

    def create(request):
        return render (request, 'mainapp/users/create.html', {})    


##########################################################################
# Hold views
##########################################################################           

class HoldViews:

    def index(request):
        return render (request, 'mainapp/holds/index.html', {})   


##########################################################################
# Lend views
##########################################################################           

class LendViews:

    def index(request):
        return render (request, 'mainapp/lends/index.html', {})      

    def delays(request):
         return render (request, 'mainapp/lends/delays.html', {})  


##########################################################################
# Suggestion views
##########################################################################           

class SuggestionViews:

    def index(request):
        return render (request, 'mainapp/suggestions/index.html', {})           


##########################################################################
# Comment views
##########################################################################           

class CommentViews:

    def index(request):
        return render (request, 'mainapp/comments/index.html', {})          