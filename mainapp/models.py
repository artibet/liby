from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

# --------------------------------------------------------------------
# country
# --------------------------------------------------------------------
class Country(models.Model):
    code            = models.CharField(max_length=2, unique=True)
    description     = models.CharField(max_length=100)

    def __str__(self):
        return self.description + " (" + self.code + ")"  

    class Meta:
        db_table = 'country'   
        verbose_name = 'Country'
        verbose_name_plural = 'Countries' 
        ordering = ['description']

          


# --------------------------------------------------------------------
# publisher
# --------------------------------------------------------------------
class Publisher(models.Model):
    pub_name        = models.CharField(max_length=255)
    city            = models.CharField(max_length=100, blank=True)
    address         = models.CharField(max_length=100, blank=True)
    zip             = models.CharField(max_length=20, blank=True)
    phone           = models.CharField(max_length=50, blank=True)
    country         = models.ForeignKey(Country, on_delete=models.PROTECT)

    class Meta:
        db_table = 'publisher'


# --------------------------------------------------------------------
# language
# --------------------------------------------------------------------
class Language(models.Model):
    description     = models.CharField(max_length=50)

    def __str__(self):
        return self.description 

    class Meta:
        db_table = 'language'
        verbose_name = 'Language'
        verbose_name_plural = 'Languages' 
        ordering = ['description']

           


# --------------------------------------------------------------------
# category
# --------------------------------------------------------------------
class Category(models.Model):
    description     = models.CharField(max_length=100)

    def __str__(self):
        return self.description

    class Meta:
        db_table = 'category'
        verbose_name = 'Category'
        verbose_name_plural = 'Categories' 
        ordering = ['description']




# --------------------------------------------------------------------
# author
# --------------------------------------------------------------------
class Author(models.Model):
    author_name     = models.CharField(max_length=255)
    bio             = models.TextField(blank=True)
    email           = models.EmailField(max_length=100, unique=True, blank=True)

    class Meta:
        db_table = 'author'


# --------------------------------------------------------------------
# book
# --------------------------------------------------------------------
class Book(models.Model):
    language        = models.ForeignKey(Language, on_delete=models.PROTECT)
    publisher       = models.ForeignKey(Publisher, on_delete=models.PROTECT)
    title           = models.CharField(max_length=255)
    isbn            = models.CharField(max_length=50, unique=True, blank=True)
    pages           = models.PositiveSmallIntegerField(default=0)
    published       = models.DateTimeField(default=timezone.now)
    revision        = models.PositiveSmallIntegerField(default=1)
    num             = models.PositiveSmallIntegerField(default=1)
    abstract        = models.TextField(blank=True)
    image           = models.ImageField(max_length="255", blank=True)
    created_at      = models.DateTimeField(auto_now_add=True, null=True)
    updated_at      = models.DateTimeField(auto_now=True, null=True)

    # many-to-many relationships
    authors         = models.ManyToManyField(Author)
    categories      = models.ManyToManyField(Category)
    comments        = models.ManyToManyField(User, through='Comment')
    
    class Meta:
        db_table = 'book'


# --------------------------------------------------------------------
# hold_status
# --------------------------------------------------------------------
class HoldStatus(models.Model):
    description     = models.CharField(max_length=100)

    class Meta:
        db_table = 'hold_status'      


# --------------------------------------------------------------------
# hold
# --------------------------------------------------------------------
class Hold(models.Model):
    book            = models.ForeignKey(Book, on_delete=models.PROTECT)
    user            = models.ForeignKey(User, on_delete=models.PROTECT)
    status          = models.ForeignKey(HoldStatus, on_delete=models.PROTECT)
    created_at      = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'hold'


# --------------------------------------------------------------------
# comment
# --------------------------------------------------------------------        
class Comment(models.Model):
    user            = models.ForeignKey(User, on_delete=models.CASCADE)
    book            = models.ForeignKey(Book, on_delete=models.CASCADE)
    stars           = models.PositiveSmallIntegerField(default=0)
    body            = models.TextField(blank=True)
    created_at      = models.DateTimeField(auto_now_add=True, null=True)
    updated_at      = models.DateTimeField(auto_now=True, null=True)

    class Meta:
        db_table = 'comment'

