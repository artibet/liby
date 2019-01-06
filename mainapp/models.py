from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

# --------------------------------------------------------------------
# country
# --------------------------------------------------------------------
class Country(models.Model):
    code            = models.CharField(max_length=2, unique=True, verbose_name="Κωδικός Χώρας")
    description     = models.CharField(max_length=100, verbose_name="Περιγραφή Χώρας")
    created_at      = models.DateTimeField(auto_now_add=True, null=True)
    updated_at      = models.DateTimeField(auto_now=True, null=True)

    def __str__(self):
        return self.description + " (" + self.code + ")"  

    class Meta:
        db_table = 'country'   
        verbose_name = 'Χώρα'
        verbose_name_plural = 'Χώρες' 
        ordering = ['description']

          


# --------------------------------------------------------------------
# publisher
# --------------------------------------------------------------------
class Publisher(models.Model):
    pub_name        = models.CharField(max_length=255, verbose_name='Επωνυμία')
    city            = models.CharField(max_length=100, blank=True, verbose_name='Πόλη')
    address         = models.CharField(max_length=100, blank=True, verbose_name='Διεύθυνση')
    zip             = models.CharField(max_length=20, blank=True, verbose_name='Ταχ. Κώδικας')
    phone           = models.CharField(max_length=50, blank=True, verbose_name='Τηλέφωνο')
    country         = models.ForeignKey(Country, on_delete=models.PROTECT, verbose_name='Χώρα')
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.pub_name
    
    class Meta:
        db_table = 'publisher'
        verbose_name = 'Εκδοτικός Οίκος'
        verbose_name_plural = 'Εκδοτικοί Οίκοι' 
        ordering = ['pub_name']


# --------------------------------------------------------------------
# language
# --------------------------------------------------------------------
class Language(models.Model):
    description     = models.CharField(max_length=50, verbose_name="Περιγραφή γλώσσας")
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.description 

    class Meta:
        db_table = 'language'
        verbose_name = 'Γλώσσα'
        verbose_name_plural = 'Γλώσσες' 
        ordering = ['description']


# --------------------------------------------------------------------
# category
# --------------------------------------------------------------------
class Category(models.Model):
    description     = models.CharField(max_length=100, verbose_name="Περιγραφή Κατηγορίας")
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)    

    def __str__(self):
        return self.description

    class Meta:
        db_table = 'category'
        verbose_name = 'Κατηγορία Βιβλίου'
        verbose_name_plural = 'Κατηγορίες Βιβλίων' 
        ordering = ['description']


# --------------------------------------------------------------------
# author
# --------------------------------------------------------------------
class Author(models.Model):
    author_name     = models.CharField(max_length=255, verbose_name="Επωνυμία Συγγραφέα")
    bio             = models.TextField(blank=True, verbose_name="Βιογραφικό/Πληροφορίες")
    email           = models.EmailField(max_length=100, blank=True, verbose_name="Email")
    created_at      = models.DateTimeField(auto_now_add=True)
    updated_at      = models.DateTimeField(auto_now=True)        

    def __str__(self):
        return self.author_name
    
    class Meta:
        db_table = 'author'
        verbose_name = 'Συγγραφέας'
        verbose_name_plural = 'Συγγραφείς' 
        ordering = ['author_name']


# --------------------------------------------------------------------
# book
# --------------------------------------------------------------------
class Book(models.Model):
    language        = models.ForeignKey(Language, on_delete=models.PROTECT, related_name="books")
    publisher       = models.ForeignKey(Publisher, on_delete=models.PROTECT, related_name="books")
    title           = models.CharField(max_length=255)
    isbn            = models.CharField(max_length=50, blank=True)
    pages           = models.PositiveSmallIntegerField(default=0)
    dimensions      = models.CharField(max_length=50, blank=True)
    weight          = models.PositiveIntegerField(blank=True, null=True)
    published_year  = models.PositiveSmallIntegerField(blank=True, null=True)
    published_month = models.PositiveSmallIntegerField(blank=True, null=True)
    revision        = models.PositiveSmallIntegerField(default=1)
    abstract        = models.TextField(blank=True)
    image           = models.ImageField(default="default_book.png", upload_to="book_covers")
    created_at      = models.DateTimeField(auto_now_add=True, null=True)
    updated_at      = models.DateTimeField(auto_now=True, null=True)

    # many-to-many relationships
    authors         = models.ManyToManyField(Author, related_name = "books")
    categories      = models.ManyToManyField(Category, related_name = "books")
    comments        = models.ManyToManyField(User, related_name = "user_comments", through='Comment')
    holds           = models.ManyToManyField(User, related_name = "user_holds", through='Hold')

    def __str__(self):
        return self.title

    def published_month_desc(self):
        if self.published_month == 1:
            return 'Ιανουάριος'
        elif self.published_month == 2:
            return 'Φεβρουάριος'
        elif self.published_month == 3:
            return 'Μάρτιος'
        elif self.published_month == 4:
            return 'Απρίλιος'      
        elif self.published_month == 5:
            return 'Μάιος' 
        elif self.published_month == 6:
            return 'Ιούνιος'
        elif self.published_month == 7:
            return 'Ιούλιος' 
        elif self.published_month == 8:
            return 'Αύγουστος'  
        elif self.published_month == 9:
            return 'Σεπτέμβριος'  
        elif self.published_month == 10:
            return 'Οκτώβριος'
        elif self.published_month == 11:
            return 'Νομέβριος'
        elif self.published_month == 12:
            return 'Δεκέμβριος'
        else:
            return ''
   
    class Meta:
        db_table = 'book'
        verbose_name = 'Βιβλίο'
        verbose_name_plural = 'Βιβλία' 
        ordering = ['title']


# --------------------------------------------------------------------
# Entry
# --------------------------------------------------------------------
class Entry(models.Model):
    book            = models.ForeignKey(Book, on_delete=models.CASCADE)
    entry_date      = models.DateTimeField(default=timezone.now)
    classification  = models.CharField(max_length=255, blank=True)
    cancel_date     = models.DateTimeField(null=True, blank=True)
    notes           = models.TextField(blank=True)

    # many-to-many relationships
    lends           = models.ManyToManyField(User, related_name = "lends", through='Lend')

    def __str__(self):
        return self.book.title
    
    class Meta:
        db_table = 'entry'
        verbose_name = 'Εισαγωγή'
        verbose_name_plural = 'Εισαγωγές' 
        ordering = ['-entry_date']


# --------------------------------------------------------------------
# hold_status
# --------------------------------------------------------------------
class HoldStatus(models.Model):
    id              = models.IntegerField(primary_key=True)
    description     = models.CharField(max_length=100)

    def __str__(self):
        return self.description

    @staticmethod
    def opened():
        return HoldStatus.objects.get(id=0)

    @staticmethod
    def closed(cls):
        return HoldStatus.objects.get(id=1)

    @staticmethod
    def canceled(cls):
        return HoldStatus.objects.get(id=2)
    
    class Meta:
        db_table = 'hold_status'  
        verbose_name = 'Κατάσταση Κρατήσεων'
        verbose_name_plural = 'Καταστάσεις Κρατήσεων' 
        ordering = ['description']    


# --------------------------------------------------------------------
# hold
# --------------------------------------------------------------------
class Hold(models.Model):
    book            = models.ForeignKey(Book, on_delete=models.PROTECT)
    user            = models.ForeignKey(User, on_delete=models.PROTECT)
    status          = models.ForeignKey(HoldStatus, default=0, on_delete=models.PROTECT)
    created_at      = models.DateTimeField(auto_now_add=True)

    def __str(self):
        return "{0} ({1} {2})".format(self.book.title, self.user.lastname, self.user.first_name)
    
    class Meta:
        db_table = 'hold'
        verbose_name = 'Κράτηση'
        verbose_name_plural = 'Κρατήσεις' 
        ordering = ['book']  


# --------------------------------------------------------------------
# comment
# --------------------------------------------------------------------        
class Comment(models.Model):
    star_choices = [
        (1, '1 αστέρι'),
        (2, '2 αστέρια'),
        (3, '3 αστέρια'),
        (4, '4 αστέρια'),
        (5, '5 αστέρια'),
    ]

    user            = models.ForeignKey(User, on_delete=models.CASCADE)
    book            = models.ForeignKey(Book, on_delete=models.CASCADE)
    stars           = models.PositiveSmallIntegerField(default=0, verbose_name="Αξιολόγηση", choices=star_choices)
    body            = models.TextField(blank=True, verbose_name="Σχόλια")
    created_at      = models.DateTimeField(auto_now_add=True, null=True)
    updated_at      = models.DateTimeField(auto_now=True, null=True)

    # create a list for star rendering
    @property
    def star_list(self):
        star_list = [0,0,0,0,0]
        for n in range(self.stars):
            star_list[n] = 1    
        return star_list

    class Meta:
        db_table = 'comment'


# --------------------------------------------------------------------
# lend
# --------------------------------------------------------------------
class Lend(models.Model):
    entry           = models.ForeignKey(Entry, on_delete=models.PROTECT)
    user            = models.ForeignKey(User, on_delete=models.PROTECT)
    lend_date       = models.DateTimeField(default=timezone.now)
    lend_days       = models.PositiveSmallIntegerField(default=20)
    return_date     = models.DateTimeField(blank=True, null=True)

    def __str(self):
        return "{0} ({1} {2})".format(self.book.title, self.user.lastname, self.user.first_name)
    
    class Meta:
        db_table = 'lend'
        verbose_name = 'Δανεισμός'
        verbose_name_plural = 'Δανεισμοί' 
        ordering = ['-lend_date']  


# --------------------------------------------------------------------
# suggestion
# --------------------------------------------------------------------        
class Suggestion(models.Model):
    user            = models.ForeignKey(User, on_delete="models.PROTECT")
    title           = models.CharField(max_length=255)
    author          = models.CharField(max_length=255, blank=True)
    publisher       = models.CharField(max_length=255, blank=True)
    isbn            = models.CharField(max_length=50, blank=True)
    created_at      = models.DateTimeField(auto_now_add=True, null=True)
    updated_at      = models.DateTimeField(auto_now=True, null=True)

    def __str(self):
        return "{0} ({1} {2})".format(self.title, self.user.lastname, self.user.first_name)

    class Meta:
        db_table = 'suggestion'
        verbose_name = 'Πρόταση'
        verbose_name_plural = 'Προτάσεις' 
        ordering = ['-created_at']          

    