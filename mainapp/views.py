from django.shortcuts import render

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
        pass               


##########################################################################
# Author views
##########################################################################

class AuthorViews:

    def index(request):
        return render (request, 'mainapp/authors/index.html', {})


##########################################################################
# Category views
##########################################################################

class CategoryViews:

    def index(request):
        return render (request, 'mainapp/categories/index.html', {})        


##########################################################################
# Publisher views
##########################################################################

class PublisherViews:

    def index(request):
        return render (request, 'mainapp/publishers/index.html', {})     


##########################################################################
# Language views
##########################################################################

class LanguageViews:

    def index(request):
        return render (request, 'mainapp/languages/index.html', {})         


##########################################################################
# Country views
##########################################################################

class CountryViews:

    def index(request):
        return render (request, 'mainapp/countries/index.html', {})       


##########################################################################
# User views
##########################################################################

class UserViews:

    def index(request):
        return render (request, 'mainapp/users/index.html', {})

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