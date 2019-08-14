from django.db import models
from django_countries.fields import CountryField
import django
from django.contrib.auth.models import User
from django.utils import timezone
from django.utils.html import format_html
from datetime import datetime, timedelta
from smart_selects.db_fields import ChainedForeignKey


doce_anios = timedelta(days=4380)


class Genero(models.Model):
    nombre = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre


class TipoDni(models.Model):
    nombre = models.CharField(max_length=10)

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name_plural = 'Tipos de DNI'


class Persona(models.Model):
    apellido = models.CharField(max_length=100, null=True)
    nombre = models.CharField(max_length=100, null=True)
    fnac = models.DateField(null=True, blank=True, default=datetime.today() - doce_anios)
    tipo = models.ForeignKey(TipoDni, on_delete=models.DO_NOTHING, null=True, blank=True, default=1)
    num_dni = models.IntegerField(null=True, blank=True)
    domicilio_calle = models.CharField(max_length=100, null=True, blank=True)
    domicilio_numero = models.IntegerField(null=True, blank=True)
    telefono_1 = models.CharField(max_length=100, null=True, blank=True)
    telefono_2 = models.CharField(max_length=100, null=True, blank=True)
    telefono_3 = models.CharField(max_length=100, null=True, blank=True)
    genero = models.ForeignKey(Genero, on_delete=models.DO_NOTHING, null=True, blank=True)
    observacion = models.TextField(null=True, blank=True)
    email = models.EmailField(null=True, blank=True)
    pais_de_nacimiento = CountryField(null=True, blank=True)


class Carrera(models.Model):
    TECNICO = 'TE'
    BACHILLER = 'BA'
    MODALIDADES = (
        (BACHILLER, 'Bachiller'),
        (TECNICO, 'Técnico')
    )
    nombre = models.CharField(max_length=50)
    modalidad = models.CharField(max_length=50, choices=MODALIDADES)
    anios = models.IntegerField(verbose_name='Años de carrera')

    def __str__(self):
        return self.nombre


class Curso(models.Model):
    anio = models.IntegerField(verbose_name='Año')
    division = models.CharField(max_length=5, verbose_name='Divisón')
    cursonombre = models.CharField(max_length=5, null=True, blank=True, default='-')
    cursosiguiente = models.ForeignKey('self', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return '{}'.format(self.cursonombre)


class Vinculo(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre


class Documentacion(models.Model):
    nombre = models.CharField(max_length=15)

    class Meta:
        verbose_name_plural = 'Documentaciones'

    def __str__(self):
        return self.nombre


class Padre(Persona):
    profesion = models.CharField(max_length=100, null=True, blank=True)

    def __str__(self):
        return '{}, {}'.format(self.apellido, self.nombre)


class Estudiante(Persona):
    legajo = models.IntegerField(primary_key=True)
    activx = models.BooleanField(default=True, null=True, blank=True)
    curso = models.ForeignKey(Curso, on_delete=models.DO_NOTHING, null=True, blank=True)
    orden = models.IntegerField(null=True, blank=True)
    libro = models.CharField(max_length=5, null=True, blank=True)
    folio = models.IntegerField(null=True, blank=True)
    anio_ingreso = models.IntegerField(default=datetime.today().year, null=True, blank=True)
    grupo_tec = models.IntegerField(null=True, blank=True)
    ficha_de_inscripcion = models.BooleanField(null=True, blank=True)
    foto_dni_estudiante = models.BooleanField(null=True, blank=True)
    foto_dni_estudiante_archivo = models.FileField(null=True, blank=True)
    foto_dni_responsable = models.BooleanField(null=True, blank=True)
    partida_de_nacimiento = models.BooleanField(null=True, blank=True)
    vacunas = models.BooleanField(null=True, blank=True)
    certificado = models.BooleanField(null=True, blank=True)
    url_foto = models.URLField(null=True, blank=True)
    adeuda = models.ForeignKey(Documentacion, on_delete=models.DO_NOTHING, null=True, blank=True)
    archivo_de_seguimiento = models.URLField(null=True, blank=True)
    responsable = models.ForeignKey(Padre, on_delete=models.DO_NOTHING, null=True, blank=True)
    vinculo = models.ForeignKey(Vinculo, on_delete=models.DO_NOTHING, null=True, blank=True)
    porcentaje_beca = models.IntegerField(null=True, blank=True)

    def colored_name(self):
        return format_html(
            '<span style="color: #{};">{} {}</span>',
            'FFAA00',
            self.nombre,
            self.apellido,
        )

    def __str__(self):
        return '{} - {}, {}'.format(self.legajo, self.apellido, self.nombre)


class Docente(Persona):
    numero_de_registro = models.IntegerField()
    activo = models.BooleanField(default=True)
    antiguedad_anios = models.IntegerField(verbose_name='Antigüedad (Años)', null=True, blank=True)
    antiguedad_meses = models.IntegerField(verbose_name='Antigüedad (Meses)', null=True, blank=True)
    anio_ingreso = models.IntegerField(verbose_name='Año de Ingreso', null=True, blank=True)
    carrera_docente = models.ManyToManyField(Carrera,  blank=True)
    profesion = models.CharField(max_length=20, null=True, blank=True)
    nombre_corto = models.CharField(max_length=20, null=True, blank=True)

    def __str__(self):
        return '{} - {}, {}'.format(self.numero_de_registro, self.apellido, self.nombre)


class Materia(models.Model):
    nombre = models.CharField(max_length=20)
    carrera = models.ForeignKey(Carrera, on_delete=models.DO_NOTHING)
    taller = models.BooleanField(default=False)
    docente_titular = models.ForeignKey(Docente, on_delete=models.DO_NOTHING, related_name='Titular', null=True,
                                        blank=True)
    docente_provisional = models.ForeignKey(Docente, on_delete=models.DO_NOTHING, related_name='Provisional',
                                            null=True, blank=True)
    docente_suplente = models.ForeignKey(Docente, on_delete=models.DO_NOTHING, related_name='Suplente',
                                         null=True, blank=True)
    curso = models.ForeignKey(Curso, on_delete=models.DO_NOTHING, null=True)
    carga_horaria = models.IntegerField(default=0, null=True, blank=True)

    def __str__(self):
        return '{} - {}'.format(self.nombre, self.curso)


class NotaParcial(models.Model):
    numero = models.CharField(max_length=10, null=True)
    materia = models.ForeignKey(Materia, on_delete=models.DO_NOTHING, null=True)
    # estudiante = models.ForeignKey(Estudiante, on_delete=models.DO_NOTHING, null=True)
    curso = models.ForeignKey(Curso, on_delete=models.DO_NOTHING)
    estudiante = ChainedForeignKey(
        Estudiante,
        chained_field='curso',
        chained_model_field='curso',
        show_all=False,
        sort=True,)

    class Meta:
        verbose_name_plural = 'Notas Parciales'

    def __str__(self):
        return '{} - {} - {}'.format(self.estudiante, self.materia, self.numero)


class Nota(models.Model):
    PRIMER_TRIMESTRE = 'PT'
    SEGUNDO_TRIMESTRE = 'ST'
    TERCER_TRIMESTRE = 'TT'
    CALIFICACION_FINAL = 'CF'
    CALIFICACION_DEFINITIVA = 'CD'
    NOTA_DICIEMBRE = 'ND'
    NOTA_FEBRERO = 'NF'
    MESA_ADICIONAL = 'MA'
    INSTANCIAS = (
        (PRIMER_TRIMESTRE, 'Primer Trimestre'),
        (SEGUNDO_TRIMESTRE, 'Segundo Trimestre'),
        (TERCER_TRIMESTRE, 'Tercer Trimestre'),
        (CALIFICACION_FINAL, 'Calificación Final'),
        (CALIFICACION_DEFINITIVA, 'Calificación Definitiva'),
        (NOTA_DICIEMBRE, 'Nota Diciembre'),
        (NOTA_FEBRERO, 'Nota Febrero'),
        (MESA_ADICIONAL, 'Mesa Adicional')
    )
    numero = models.DecimalField(max_digits=4, decimal_places=2, null=True)
    materia = models.ForeignKey(Materia, on_delete=models.DO_NOTHING, null=True)
    estudiante = models.ForeignKey(Estudiante, on_delete=models.DO_NOTHING, null=True)
    instancia = models.CharField(max_length=20, choices=INSTANCIAS, null=True)

    def __str__(self):
        return '{} - {} - {}'.format(self.estudiante, self.materia, self.numero)


class Inasistencia(models.Model):
    estudiante = models.ForeignKey(Estudiante, on_delete=models.DO_NOTHING, null=True)
    TIPOS = (
        ('t', 'Llegada tarde'),
        ('T', 'Llegada tarde fuera de hora'),
        ('A', 'Ausente'),
        ('r', 'Retirado dentro de la última hora'),
        ('R', 'Retirado'),
        ('E', 'Ausente a Educación Física')
    )
    cantidad = models.DecimalField(decimal_places=2, max_digits=2)
    fecha = models.DateField()
    hora = models.TimeField(null=True)
    tipo = models.CharField(choices=TIPOS, max_length=20)
    turno = models.CharField(choices=(('M', 'Mañana'), ('T', 'Tarde')), max_length=20)


class Notificacion(models.Model):
    estudiante = models.ForeignKey(Estudiante, on_delete=models.DO_NOTHING)
    TIPOS = (
        ('F', 'Felicitación'),
        ('O', 'Observación'),
        ('A', 'Apercibimiento'),
        ('N', 'Notificación'),
        ('C', 'Cambio de horario')
    )
    notificacion = models.TextField()
    fecha = models.DateField(default=django.utils.timezone.now)
    tipo = models.CharField(choices=TIPOS, max_length=20)
    informante = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)

    class Meta:
        verbose_name_plural = 'Notificaciones'

    def __str__(self):
        return '{} - {} - {}'.format(self.fecha, self.estudiante, self.tipo)


class FechaAltaBaja(models.Model):

    TIPOS = (
        ('B', 'Baja'),
        ('A', 'Alta'),
    )
    fecha = models.DateField()
    estudiante = models.ForeignKey(Estudiante, on_delete=models.DO_NOTHING, null=True)
    tipo = models.CharField(choices=TIPOS, max_length=20)

    def __str__(self):
        return '{} - {} - {}'.format(self.estudiante, self.fecha, self.tipo)


class NombreCuota(models.Model):
    nombre = models.CharField(max_length=20)
    def __str__(self):
        return self.nombre


class Cuota(models.Model):
    fecha_pago = models.DateField()
    estudiante = models.ForeignKey(Estudiante, on_delete=models.DO_NOTHING, null=True)
    nombre_cuota = models.ForeignKey(NombreCuota, on_delete=models.DO_NOTHING, max_length=20)
    pagada = models.BooleanField(default=False)
    importe = models.IntegerField()
    list_display = ('fecha_pago', 'estudiante')
    def __str__(self):
        return '{} - {} - {}'.format(self.fecha_pago, self.nombre_cuota, self.estudiante)


class Seguimiento(models.Model):

    estudiante = models.ForeignKey(Estudiante, on_delete=models.DO_NOTHING)
    TIPOS = (
        ('Cambio de Modalidad', 'Cambio de modalidad'),
        ('Pase a otra institución', 'Pase a otra institución'),
        ('Inasistencias', 'Inasistencias'),
        ('Situación de Salud', 'Situación de Salud'),
        ('Becas', 'Becas'),
        ('Cuestiones de Convivencia', 'Cuestiones de Convivencia'),
        ('Convocatoria', 'Convocatoria'),
        ('Situación académica', 'Situación académica'),
        ('Situación personal/familiar', 'Situación personal/familiar'),
        ('Reconocimiento', 'Reconocimiento'),
        ('Acuerdo con la Familia', 'Acuerdo con la Familia')
    )
    notificacion = models.TextField()
    fecha = models.DateField(default=django.utils.timezone.now)
    tipo = models.CharField(choices=TIPOS, max_length=30 )
    def __str__(self):

        return '{} - {} - {}'.format(self.estudiante.apellido, self.estudiante.curso.cursonombre, self.tipo)