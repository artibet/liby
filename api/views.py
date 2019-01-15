from django.shortcuts import render
from django.contrib.auth.decorators import user_passes_test
from django.http import JsonResponse
from mainapp.models import Author

# create author
@user_passes_test(lambda u: u.is_superuser)
def create_author(request):

    author = Author()
    author.author_name = request.POST['author_name']
    author.email = request.POST['email']
    author.bio = request.POST['bio']
    author.save()

    json = {
        "id": str(author.id),
        "author_name": author.author_name,
        "email": author.email,
        "bio": author.bio
    }
    return JsonResponse(json)
    

