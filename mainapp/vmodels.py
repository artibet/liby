# Create models for database views here
from django.db import models
from .models import Country

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