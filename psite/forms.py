from django import forms
from django.forms import ModelForm, Form
from mainapp.models import Comment, Author, Publisher, Country, Category, Language


class CommentForm(ModelForm):
    class Meta:
        model = Comment
        fields = ['stars', 'body']


# Φόρμα σύνθετης αναζήτησης
class ASearchForm(Form):
    
    
    # Λίστα κατηγοριών
    category_list = []#Category.objects.order_by('description')
    category_choices = [("", "----------")]
    for c in category_list:
        category_choices.append((c.id, c.description))

    # Λίστα συγγραφέων
    author_list = []#Author.objects.order_by('author_name')
    author_choices = [("", "----------")]
    for a in author_list:
        author_choices.append((a.id, a.author_name))

    # Λίστα εκδοτών
    publisher_list = []#Publisher.objects.order_by('pub_name')
    publisher_choices = [("", "----------")]
    for p in publisher_list:
        publisher_choices.append((p.id, p.pub_name))

    # Λίστα χωρών
    country_list = []#Country.objects.order_by('description')
    country_choices = [("", "----------")]
    for c in country_list:
        country_choices.append((c.id, f"{c.description} ({c.code})"))
    
    # Τα πεδία της φόρμας
    title = forms.CharField(max_length=255, strip=True, label="Τίτλος Βιβλίου", required=False)
    abstract = forms.CharField(max_length=255, strip=True, label="Περίληψη", required=False)
    language = forms.ModelChoiceField(label="Γλώσσα", queryset=Language.objects.all(), required=False)
    category = forms.ModelChoiceField(label="Κατηγορία", queryset=Category.objects.all(), required=False)
    author = forms.ModelChoiceField(label="Συγγραφέας", queryset=Author.objects.all(), to_field_name='id', required=False)
    publisher = forms.ModelChoiceField(label="Εκδότης", queryset=Publisher.objects.all(), required=False)
    country = forms.ModelChoiceField(label="Χώρα έκδοσης", queryset=Country.objects.all(), required=False)
    published_year = forms.IntegerField(label="Έτος έκδοσης", required=False)


    

