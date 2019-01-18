from django import forms
from django.forms import ModelForm, Form
from mainapp.models import Comment, Author, Publisher, Country, Category, Language


class CommentForm(ModelForm):
    class Meta:
        model = Comment
        fields = ['stars', 'body']


# Φόρμα σύνθετης αναζήτησης
class ASearchForm(Form):
    
    # Λίστα γλωσσών
    language_list = Language.objects.order_by('description')
    language_choices = [("", "----------")]
    for l in language_list:
        language_choices.append((l.id, l.description))
    
    # Λίστα κατηγοριών
    category_list = Category.objects.order_by('description')
    category_choices = [("", "----------")]
    for c in category_list:
        category_choices.append((c.id, c.description))

    # Λίστα συγγραφέων
    author_list = Author.objects.order_by('author_name')
    author_choices = [("", "----------")]
    for a in author_list:
        author_choices.append((a.id, a.author_name))

    # Λίστα εκδοτών
    publisher_list = Publisher.objects.order_by('pub_name')
    publisher_choices = [("", "----------")]
    for p in publisher_list:
        publisher_choices.append((p.id, p.pub_name))

    # Λίστα χωρών
    country_list = Country.objects.order_by('description')
    country_choices = [("", "----------")]
    for c in country_list:
        country_choices.append((c.id, f"{c.description} ({c.code})"))
    
    # Τα πεδία της φόρμας
    title = forms.CharField(max_length=255, strip=True, label="Τίτλος Βιβλίου", required=False)
    abstract = forms.CharField(max_length=255, strip=True, label="Περίληψη", required=False)
    language = forms.ChoiceField(label="Γλώσσα", choices=language_choices, required=False)
    category = forms.ChoiceField(label="Κατηγορία", choices=category_choices, required=False)
    author = forms.ChoiceField(label="Συγγραφέας", choices=author_choices, required=False)
    publisher = forms.ChoiceField(label="Εκδότης", choices=publisher_choices, required=False)
    country = forms.ChoiceField(label="Χώρα έκδοσης", choices=country_choices, required=False)
    published_year = forms.IntegerField(label="Έτος έκδοσης", required=False)


    

