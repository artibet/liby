from django.shortcuts import render

# Books index
def index(request):
    return render (request, 'mainapp/books/index.html', {})

def create(request):
    return render (request, 'mainapp/books/create.html', {})    

def search(request):
    pass    