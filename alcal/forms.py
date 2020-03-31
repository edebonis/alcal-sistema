from .models import Estudiante, Curso, Padre, Docente, NotaParcial, Seguimiento, Inasistencia, Materia
from django import forms
from django.forms import boundfield
from datetime import datetime, timedelta


def nueva(self, widget=None, attrs=None, only_initial=False):
    widget = widget or self.field.widget
    if self.field.localize:
        widget.is_localized = True
    attrs = attrs or {}
    attrs = self.build_widget_attrs(attrs, widget)
    if self.auto_id and 'id' not in widget.attrs:
        attrs.setdefault('id', self.html_initial_id if only_initial else self.auto_id)
    return widget.render(
        name=self.html_initial_name if only_initial else self.html_name,
        value=self.value(),
        attrs=attrs,
        #renderer=self.form.renderer,
    )


boundfield.BoundField.as_widget = nueva


class NameForm(forms.Form):
    your_name = forms.CharField(label='Your name', max_length=100)


class Cursos(forms.ModelForm):
    class Meta:
        valores = []
        anio = Curso.anio
        cursonombre = Curso.cursonombre
        cursosiguiente = Curso.cursosiguiente
        division = Curso.division
        model = Curso
        val = Curso.objects.values('cursonombre')
        if val:
            for i in val:
                tup = (i['cursonombre'], i['cursonombre'])
                valores.append(tup)
            valores.sort()
        else:
            valores = ('', '')
        fields = [
            # 'anio',
            # 'division',
            'cursonombre',
            # 'cursosiguiente'
        ]
        labels = {
            # 'anio': 'Año',
            # 'division': 'División',
            'cursonombre': 'Nombre Curso',
            # 'cursosiguiente': 'Siguiente Curso',
        }
        widgets = {
            'cursonombre': forms.Select(choices=valores,
                                        attrs={
                                            'class': 'btn waves-effect waves-light btn-primary dropdown-toggle',
                                            'onchange': 'form.submit()',
                                        }
                                        ),
        }


class InasistenciaForm(forms.ModelForm):
    class Meta:
        model = Inasistencia
        fields = ['tipo']
        labels = {'tipo': 'Tipo',
                  }


class FechaInasistencias(forms.Form):
    fecha = forms.DateField(input_formats=["%d/%m/%Y"], required=False)
    print(datetime.strftime(datetime.today(), "%d/%m/%Y"))
    def __init__(self, *args, **kwargs):
        super(FechaInasistencias, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'
            visible.field.widget.attrs['type'] = 'text'
            visible.field.widget.attrs['placeholder'] = 'dd/mm/yyyy'
            visible.field.widget.attrs['value'] = datetime.strftime(datetime.today(), "%d/%m/%Y")
            visible.field.widget.attrs['id'] = 'datepicker'
            visible.field.widget.attrs['autocomplete'] = 'off'
            visible.field.widget.attrs['onchange'] = 'form.submit()'


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
            'foto_perfil',
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
            'foto_perfil': 'Foto de Perfil',
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
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'


class NuevoSeguimiento(forms.ModelForm):

    class Meta:
        model = Seguimiento
        fields = [
            'estudiante',
            'notificacion',
            'fecha',
            'tipo'
        ]
        labels = {
            'estudiante': 'Estudiante',
            'notificacion': 'Notificación',
            'fecha': 'Fecha',
            'tipo': 'Tipo'
        }

    def __init__(self, *args, **kwargs):
        super(NuevoSeguimiento, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():

            if type(visible.field) == forms.fields.DateField:
                visible.field.widget.attrs['class'] = 'form-control'
                visible.field.widget.attrs['placeholder'] = 'dd-mm-yyyy'
                visible.field.widget.attrs['id'] = 'datepicker'
                visible.field.widget.attrs['autocomplete'] = 'off'
                visible.field.widget.attrs['value'] = datetime.strftime(datetime.today(), "%d/%m/%Y")
                visible.field.widget.attrs[type] = 'date'
            else:
                visible.field.widget.attrs['class'] = 'form-control'


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

    def __init__(self, *args, **kwargs):
        super(NuevoPadre, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'


class NuevoDocente(forms.ModelForm):
    class Meta:
        model = Docente
        fields = [
            'usuario',
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
            'foto_perfil',
            'pais_de_nacimiento',
            'telefono_1',
            'telefono_2',
            'telefono_3',
            'genero',
            'carrera_docente',
            'email',
            'profesion',
            'nombre_corto',
        ]
        labels = {
            'usuario': 'Usuario del Sistema',
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
            'foto_perfil': 'Foto de Perfil',
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

    def __init__(self, *args, **kwargs):
        super(NuevoDocente, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'


class NuevaNota(forms.ModelForm):
    class Meta:
        model = NotaParcial
        classmethod = "POST"
        fields = ['nota',
                  'materia',
                  'curso',
                  'estudiante'
                  ]
        labels = {
            'nota': 'Número',
            'materia': 'Materia',
            'curso': 'Curso',
            'estudiante': 'Estudiante',
        }

    def __init__(self, *args, **kwargs):
        super(NuevaNota, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'
        # self.visible_fields()[3].field.widget.attrs['class'] = 'form-control'
        # print(self.visible_fields()[3].field.widget.attrs)


class SelectorDeAlumno(forms.ModelForm):

    class Meta:
        model = NotaParcial
        classmethod = "POST"
        fields = ['curso',
                  'estudiante'
                  ]
        labels = {
            'curso': 'Curso',
            'estudiante': 'Estudiante',
        }

    def __init__(self, *args, **kwargs):
        super(SelectorDeAlumno, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control '
        self.fields['curso'].queryset = self.fields['curso'].queryset.order_by('cursonombre')
        # self.fields['estudiante'].widget.attrs['data-value'] = Estudiante.objects.get().fi

class NuevaMateria(forms.ModelForm):
    class Meta:
        model = Materia
        fields = [
            'curso',
            'nombre',
            'carrera',
            'carga_horaria',
            'docente_titular',
            'docente_suplente',
            'docente_provisional',
            'taller'
        ]
        labels = {
            'curso': 'Curso',
            'nombre': 'Nombre',
            'carrera': 'Carrera',
            'carga_horaria': 'Horas Semanales',
            'docente_titular': 'Docente Titular',
            'docente_suplente': 'Docente Suplente',
            'docente_provisional': 'Docente Provisional',
            'taller': 'Materia de Formación específica'
        }

    def __init__(self, *args, **kwargs):
        super(NuevaMateria, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'
        self.fields['curso'].queryset = self.fields['curso'].queryset.order_by('cursonombre')