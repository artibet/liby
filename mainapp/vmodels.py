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
    total_lends     = models.PositiveIntegerField(default=0)
    active_lends    = models.PositiveIntegerField(default=0)
    num_comments    = models.PositiveIntegerField(default=0)
    num_stars1      = models.PositiveIntegerField(default=0)
    num_stars2      = models.PositiveIntegerField(default=0)
    num_stars3      = models.PositiveIntegerField(default=0)
    num_stars4      = models.PositiveIntegerField(default=0)
    num_stars5      = models.PositiveIntegerField(default=0)
    sum_stars       = models.PositiveIntegerField(default=0)


    def status(self):
        if self.num_entries > self.active_lends + self.active_holds:
            return 1    # Διαθέσιμο
        elif self.num_entries > self.active_lends and self.num_entries <= self.active_lends + self.active_holds:
            return 2    # Δεσμευμένο
        else:
            return 0    # Μη διαθέσιμο

    def grade(self):
        if self.num_comments == 0:
            return 0
        return round(self.sum_stars/self.num_comments, 2)           


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

    # Returns a list of books from same authors
    def from_same_author(self):
        
        # Get author id's into list
        author_ids = []
        for author in self.book.authors.all():
            author_ids.append(author.id)

        # filter
        return Book.objects.filter(authors__id__in = author_ids).exclude(id=self.book_id).distinct()

    # stars_1 percentage
    @property
    def stars1_pc(self):
        if self.sum_stars == 0:
            return 0;

        return int(round(self.num_stars1 * 100/ self.num_comments, 0))
    
    # stars_2 percentage
    @property
    def stars2_pc(self):
        if self.sum_stars == 0:
            return 0;

        return int(round(self.num_stars2 * 100 / self.num_comments, 0))

    # stars_3 percentage
    @property
    def stars3_pc(self):
        if self.sum_stars == 0:
            return 0;

        return int(round(self.num_stars3 * 100 / self.num_comments, 0))
        
    # stars_4 percentage
    @property
    def stars4_pc(self):
        if self.sum_stars == 0:
            return 0;

        return int(round(self.num_stars4 * 100 / self.num_comments, 0))

    # stars_5 percentage
    @property
    def stars5_pc(self):
        if self.sum_stars == 0:
            return 0;

        return int(round(self.num_stars5 * 100 / self.num_comments, 0))
    
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


# book_top_titles
class BookTopTitles(models.Model):
    book            = models.OneToOneField(Book, primary_key=True, on_delete=models.DO_NOTHING, related_name="book_top_titles")

    class Meta:
        managed = False
        db_table = 'book_top_titles'          


# book_best_choices
class BookTopPicks(models.Model):
    book            = models.OneToOneField(Book, primary_key=True, on_delete=models.DO_NOTHING, related_name="book_best_choices")

    class Meta:
        managed = False
        db_table = 'book_best_choices'             