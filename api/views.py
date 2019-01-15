from django.shortcuts import render
from django.contrib.auth.decorators import user_passes_test
from django.http import JsonResponse
from mainapp.models import Author, Publisher

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
    

# create publisher
@user_passes_test(lambda u: u.is_superuser)
def create_publisher(request):

    publisher = Publisher()
    publisher.pub_name = request.POST['pub_name']
    publisher.country_id = request.POST['country_id']
    publisher.city = request.POST['city']
    publisher.address = request.POST['address']
    publisher.zip = request.POST['zip']
    publisher.phone = request.POST['phone']
    publisher.save()

    json = {
        "id": str(publisher.id),
        "pub_name": publisher.pub_name,
        "country_id": str(publisher.country_id),
        "city": publisher.city,
        "address": publisher.address,
        "zip": publisher.zip,
        "phone": publisher.phone
    }
    return JsonResponse(json)