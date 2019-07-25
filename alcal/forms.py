from django import forms

from .models import Estudiante, Curso


class PostForm(forms.ModelForm):

    class Meta:
        # model = Post
        curso = forms.ComboField(fields=Curso.objects.all())
        fields = ('curso', Curso)


class NameForm(forms.Form):
    your_name = forms.CharField(label='Your name', max_length=100)
