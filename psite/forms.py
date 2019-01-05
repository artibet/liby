from django.forms import ModelForm
from mainapp.models import Comment

class CommentForm(ModelForm):
    class Meta:
        model = Comment
        fields = ['stars', 'body']
