from django.contrib import admin
from .models import Country, Language, Category

admin.site.register(Country)
admin.site.register(Language)
admin.site.register(Category)