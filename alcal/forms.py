from django import forms
from .models import Estudiante, Curso


class PostForm(forms.ModelForm):

    class Meta:
        #model = Post
        curso = forms.ComboField(fields=Curso.objects.all())
        fields = ('curso', curso)


class NameForm(forms.Form):
    your_name = forms.CharField(label='Your name', max_length=100)


class CursoForm(forms.ModelForm):
    class Meta:
        anios = Curso.anio
        nombrecurso = Curso.cursonombre
        siguientecurso = Curso.cursosiguiente
        division = Curso.division
        model = Curso
        fields = [
            'anio',
            'division',
            'cursonombre',
            'cursosiguiente'
        ]
        labels = {
            'anio': 'Año',
            'division': 'División',
            'cursonombre': 'Nombre Curso',
            'cursosiguiente': 'Siguiente Curso',
        }
        widgets = {
            'cursonombre': forms.TextInput(),

        }