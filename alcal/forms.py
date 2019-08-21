from django import forms
from .models import Estudiante, Curso, Padre, Docente


# class PostForm(forms.ModelForm):
#
#     class Meta:
#         # model = Post
#         curso = forms.ComboField(fields=Curso.objects.all())
#         fields = ('curso', curso)


class NameForm(forms.Form):
    your_name = forms.CharField(label='Your name', max_length=100)


class CursoForm(forms.ModelForm):
    class Meta:
        valores = []
        anio = Curso.anio
        cursonombre = Curso.cursonombre
        cursosiguiente = Curso.cursosiguiente
        division = Curso.division
        model = Curso
        val = Curso.objects.values('cursonombre')
        for i in val:
            tup = (i['cursonombre'], i['cursonombre'])
            valores.append(tup)
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
            'cursonombre': forms.Select(choices=valores,
                                        attrs={
                                            'class': 'btn waves-effect waves-light btn-primary dropdown-toggle',
                                            'onchange': 'form.submit()',
                                        }
                                        ),
        }


class NuevoEstudiante(forms.ModelForm):
    class Meta:
        model = Estudiante
        fields = [
            'legajo',
            'activx',
            'curso',
            'orden',
            'apellido',
            'nombre',
            'fnac',
            'libro',
            'folio',
            'tipo',
            'num_dni',
            'domicilio_calle',
            'domicilio_numero',
            'telefono_1',
            'telefono_2',
            'telefono_3',
            'anio_ingreso',
            'genero',
            'grupo_tec',
            'observacion',
            'email',
            'ficha_de_inscripcion',
            'foto_dni_estudiante',
            'foto_dni_estudiante_archivo',
            'foto_dni_responsable',
            'partida_de_nacimiento',
            'vacunas',
            'certificado',
            'url_foto',
            'adeuda',
            'archivo_de_seguimiento',
            'responsable',
            'vinculo'
        ]
        labels = {
            'legajo': 'Legajo',
            'activx': 'Activx',
            'curso': 'Curso',
            'orden': 'Núm. Orden',
            'apellido': 'Apellido',
            'nombre': 'Nombre',
            'fnac': 'Fecha de Nacimiento',
            'libro': 'Libro',
            'folio': 'Folio',
            'tipo': 'Tipo Doc',
            'num_dni': 'Número Doc',
            'domicilio_calle': 'Domicilio (Calle)',
            'domicilio_numero': 'Domicilio (Número)',
            'telefono_1': 'Tel1',
            'telefono_2': 'Tel2',
            'telefono_3': 'Tel3',
            'anio_ingreso': 'Año de ingreso',
            'genero': 'Género',
            'grupo_tec': 'Grupo',
            'observacion': 'Observación',
            'email': 'e-mail',
            'ficha_de_inscripcion': 'Ficha de inscripción',
            'foto_dni_estudiante': 'Foto DNI Estudiante',
            'foto_dni_estudiante_archivo': 'Foto DNI Archivo',
            'foto_dni_responsable': 'Foto DNI Responsable',
            'partida_de_nacimiento': 'Partida de Nacimiento',
            'vacunas': 'Vacunas',
            'certificado': 'Certificado',
            'url_foto': 'URL Foto',
            'adeuda': 'Adeuda',
            'archivo_de_seguimiento': 'Archivo de seguimiento',
            'responsable': 'Responsable',
            'vinculo': 'Vínculo',
        }

    def __init__(self, *args, **kwargs):
        super(NuevoEstudiante, self).__init__(*args, **kwargs)
        # for visible in self.visible_fields():
        #     visible.field.widget.attrs['class'] = 'col-md-6'
        self.visible_fields()[3].field.widget.attrs['class'] = 'form-control'
        print(self.visible_fields()[3].field.widget.attrs)


class NuevoPadre(forms.ModelForm):
    class Meta:
        model = Padre
        classmethod = "POST"
        fields = [
            'apellido',
            'nombre',
            'fnac',
            'tipo',
            'num_dni',
            'domicilio_calle',
            'domicilio_numero',
            'telefono_1',
            'telefono_2',
            'telefono_3',
            'genero',
            'email',
            'pais_de_nacimiento',
            'profesion',
        ]
        labels = {
            'apellido': 'Apellido',
            'nombre': 'Nombre',
            'fnac': 'Fecha de Nacimiento',
            'tipo': 'Tipo Doc',
            'num_dni': 'Número Doc',
            'domicilio_calle': 'Domicilio (Calle)',
            'domicilio_numero': 'Domicilio (Número)',
            'telefono_1': 'Tel1',
            'telefono_2': 'Tel2',
            'telefono_3': 'Tel3',
            'genero': 'Género',
            'email': 'e-mail',
            'pais_de_nacimiento': 'País de Nacimiento',
            'profesion': 'Profesión',
        }


class NuevoDocente(forms.ModelForm):
    class Meta:
        model = Docente
        fields = [
            'numero_de_registro',
            'activo',
            'antiguedad_anios',
            'antiguedad_meses',
            'apellido',
            'nombre',
            'tipo',
            'num_dni',
            'domicilio_calle',
            'domicilio_numero',
            'anio_ingreso',
            'fnac',
            'pais_de_nacimiento',
            'telefono_1',
            'telefono_2',
            'telefono_3',
            'genero',
            'carrera_docente',
            'email',
            'profesion',
            'nombre_corto'
        ]
        labels = {
            'numero_de_registro': 'Número de Registro',
            'activo': 'Activo',
            'antiguedad_anios': 'Antigüedad (Años)',
            'antiguedad_meses': 'Antigüedad (Meses)',
            'apellido': 'Apellido',
            'nombre': 'Nombre',
            'tipo': 'Tipo Doc',
            'num_dni': 'Núermo Doc',
            'domicilio_calle': 'Domicilio (Calle)',
            'domicilio_numero': 'Domicilio (Número)',
            'telefono': 'Teléfono',
            'anio_ingreso': 'Año de Ingreso',
            'fnac': 'Fecha de Nacimiento',
            'pais_de_nacimiento': 'País de Nacimiento',
            'telefono_1': 'Tel1',
            'telefono_2': 'Tel2',
            'telefono_3': 'Tel3',
            'genero': 'Género',
            'carrera_docente': 'Carrera Docente',
            'email': 'e-mail',
            'profesion': 'Profesión',
            'nombre_corto': 'Nombre Corto'
        }


# class Alumnos(forms.ModelForm):
#     class Meta:
#         model = Estudiante
#         fields = ('legajo', 'nombre', 'apellido', 'curso')
#
#     def __init__(self, *args, **kwargs):
#         super().__init__(*args, **kwargs)
#         self.fields['city'].queryset = City.objects.none()
#
#         if 'country' in self.data:
#             try:
#                 country_id = int(self.data.get('country'))
#                 self.fields['city'].queryset = City.objects.filter(country_id=country_id).order_by('name')
#             except (ValueError, TypeError):
#                 pass  # invalid input from the client; ignore and fallback to empty City queryset
#         elif self.instance.pk:
#             self.fields['city'].queryset = self.instance.country.city_set.order_by('name')
