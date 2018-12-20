from django.shortcuts import render

def dashboard(request):
    return render (request, 'mainapp/dashboard.html', {})

