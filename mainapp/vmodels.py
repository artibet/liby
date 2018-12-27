# Create models for database views here
from django.db import models
from django.utils import timezone
from .models import (
    Country, Language, Publisher, Author,
    Category, User, Book)


# --------------------------------------------------------------------
# publisher_list
# --------------------------------------------------------------------
class PublisherList(models.Model):
    pub_name        = models.CharField(max_length=255, verbose_name='Επωνυμία')
    city            = models.CharField(max_length=100, blank=True, verbose_name='Πόλη')
    address         = models.CharField(max_length=100, blank=True, verbose_name='Διεύθυνση')
    zip             = models.CharField(max_length=20, blank=True, verbose_name='Ταχ. Κώδικας')
    phone           = models.CharField(max_length=50, blank=True, verbose_name='Τηλέφωνο')
    country         = models.ForeignKey(Country, on_delete=models.PROTECT, verbose_name='Χώρα')
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)
    books           = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.pub_name
    
    class Meta:
        managed = False
        db_table = 'publisher_list'
        verbose_name = 'Εκδοτικός Οίκος'
        verbose_name_plural = 'Εκδοτικοί Οίκοι' 
        ordering = ['pub_name']


# --------------------------------------------------------------------
# language_list
# --------------------------------------------------------------------
class LanguageList(models.Model):
    description     = models.CharField(max_length=50, verbose_name="Περιγραφή γλώσσας")
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)
    books           = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.description 

    class Meta:
        managed = False
        db_table = 'language_list'
        verbose_name = 'Γλώσσα'
        verbose_name_plural = 'Γλώσσες' 
        ordering = ['description']        


# --------------------------------------------------------------------
# author_list
# --------------------------------------------------------------------
class AuthorList(models.Model):
    author_name     = models.CharField(max_length=255, verbose_name="Επωνυμία Συγγραφέα")
    bio             = models.TextField(blank=True, verbose_name="Βιογραφικό/Πληροφορίες")
    email           = models.EmailField(max_length=100, unique=True, blank=True, verbose_name="Email")
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)   
    books           = models.PositiveIntegerField(default=0)     

    def __str__(self):
        return author_name
    
    class Meta:
        managed = False
        db_table = 'author_list'
        verbose_name = 'Συγγραφέας'
        verbose_name_plural = 'Συγγραφείς' 
        ordering = ['author_name']     


# --------------------------------------------------------------------
# category_list
# --------------------------------------------------------------------
class CategoryList(models.Model):
    description     = models.CharField(max_length=100, verbose_name="Περιγραφή Κατηγορίας")
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)    
    books           = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.description

    class Meta:
        managed = False
        db_table = 'category_list'
        verbose_name = 'Κατηγορία Βιβλίου'
        verbose_name_plural = 'Κατηγορίες Βιβλίων' 
        ordering = ['description']           


# --------------------------------------------------------------------
# user_data
# --------------------------------------------------------------------
class UserData(models.Model):
    user            = models.OneToOneField(User, primary_key=True, on_delete=models.DO_NOTHING, related_name="user_data")

    lends           = models.PositiveIntegerField(default=0)
    comments        = models.PositiveIntegerField(default=0)
    holds           = models.PositiveIntegerField(default=0)
    suggestions     = models.PositiveIntegerField(default=0)
    
    class Meta:
        managed = False
        db_table = 'user_data'
        verbose_name = 'Χρήστης'
        verbose_name_plural = 'Χρήστες' 
  

# --------------------------------------------------------------------
# book_data
# --------------------------------------------------------------------        
class BookData(models.Model):
    book            = models.OneToOneField(Book, on_delete=models.DO_NOTHING, primary_key=True, related_name="book_data")
    
    active_holds    = models.PositiveIntegerField(default=0)
    num_entries     = models.PositiveIntegerField(default=0)
    num_lends       = models.PositiveIntegerField(default=0)
    num_comments    = models.PositiveIntegerField(default=0)
    sum_stars       = models.PositiveIntegerField(default=0)


    def is_available(self):
        return num_entries > active_holds

    # if true add a half star to rating
    def has_half_star(self):
        if self.num_comments == 0:
            return False
        remain = self.sum_stars % self.num_comments
        if remain / self.num_comments >= 0.5:
            return True
        else:
            return False

    def stars(self):
        stars = [0,0,0,0,0]
        if self.num_comments == 0:
            return stars
        avg = int(self.sum_stars // self.num_comments)
        for n in range(avg):
            stars[n] = 1
        if self.has_half_star():
            stars[avg] = 2

        return stars          

    
    class Meta:
        managed = False
        db_table = 'book_data'
        verbose_name = 'Βιβλίο'
        verbose_name_plural = 'Βιβλία' 


# book_newest
class BookNewest(models.Model):
    book            = models.OneToOneField(Book, primary_key=True, on_delete=models.DO_NOTHING, related_name="book_newest")

    class Meta:
        managed = False
        db_table = 'book_newest'        