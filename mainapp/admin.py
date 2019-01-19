from django.contrib import admin
from .models import Country, Language, Category, \
                    Publisher, Book, Author, HoldStatus, \
                    Hold, Entry, Lend, Comment

admin.site.register(Country)
admin.site.register(Language)
admin.site.register(Category)
admin.site.register(Publisher)
admin.site.register(Book)
admin.site.register(Author)
admin.site.register(HoldStatus)
admin.site.register(Hold)
admin.site.register(Entry)
admin.site.register(Lend)
admin.site.register(Comment)