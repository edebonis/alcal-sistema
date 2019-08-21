# Generated by Django 2.2.3 on 2019-08-21 19:44

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import django_countries.fields
import smart_selects.db_fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Carrera',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('modalidad', models.CharField(choices=[('BA', 'Bachiller'), ('TE', 'Técnico')], max_length=50)),
                ('anios', models.IntegerField(verbose_name='Años de carrera')),
            ],
        ),
        migrations.CreateModel(
            name='Curso',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('anio', models.IntegerField(verbose_name='Año')),
                ('division', models.CharField(max_length=5, verbose_name='Divisón')),
                ('cursonombre', models.CharField(blank=True, default='-', max_length=5, null=True)),
                ('cursosiguiente', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='alcal.Curso')),
            ],
        ),
        migrations.CreateModel(
            name='Documentacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=15)),
            ],
            options={
                'verbose_name_plural': 'Documentaciones',
            },
        ),
        migrations.CreateModel(
            name='Genero',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Materia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20)),
                ('taller', models.BooleanField(default=False)),
                ('carga_horaria', models.IntegerField(blank=True, default=0, null=True)),
                ('carrera', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Carrera')),
                ('curso', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Curso')),
            ],
        ),
        migrations.CreateModel(
            name='NombreCuota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Periodo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20, null=True)),
                ('fecha_inicio', models.DateField()),
                ('fecha_fin', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Persona',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('apellido', models.CharField(max_length=100, null=True)),
                ('nombre', models.CharField(max_length=100, null=True)),
                ('fnac', models.DateField(blank=True, default=datetime.datetime(2007, 8, 24, 16, 44, 21, 851851), null=True)),
                ('num_dni', models.IntegerField(blank=True, null=True)),
                ('domicilio_calle', models.CharField(blank=True, max_length=100, null=True)),
                ('domicilio_numero', models.IntegerField(blank=True, null=True)),
                ('telefono_1', models.CharField(blank=True, max_length=100, null=True)),
                ('telefono_2', models.CharField(blank=True, max_length=100, null=True)),
                ('telefono_3', models.CharField(blank=True, max_length=100, null=True)),
                ('observacion', models.TextField(blank=True, null=True)),
                ('email', models.EmailField(blank=True, max_length=254, null=True)),
                ('pais_de_nacimiento', django_countries.fields.CountryField(blank=True, max_length=2, null=True)),
                ('genero', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Genero')),
            ],
        ),
        migrations.CreateModel(
            name='TipoDni',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=10)),
            ],
            options={
                'verbose_name_plural': 'Tipos de DNI',
            },
        ),
        migrations.CreateModel(
            name='Vinculo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Docente',
            fields=[
                ('persona_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='alcal.Persona')),
                ('numero_de_registro', models.IntegerField()),
                ('activo', models.BooleanField(default=True)),
                ('antiguedad_anios', models.IntegerField(blank=True, null=True, verbose_name='Antigüedad (Años)')),
                ('antiguedad_meses', models.IntegerField(blank=True, null=True, verbose_name='Antigüedad (Meses)')),
                ('anio_ingreso', models.IntegerField(blank=True, null=True, verbose_name='Año de Ingreso')),
                ('profesion', models.CharField(blank=True, max_length=20, null=True)),
                ('nombre_corto', models.CharField(blank=True, max_length=20, null=True)),
                ('carrera_docente', models.ManyToManyField(blank=True, to='alcal.Carrera')),
            ],
            bases=('alcal.persona',),
        ),
        migrations.CreateModel(
            name='Estudiante',
            fields=[
                ('persona_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, to='alcal.Persona')),
                ('legajo', models.IntegerField(primary_key=True, serialize=False)),
                ('activx', models.BooleanField(blank=True, default=True, null=True)),
                ('orden', models.IntegerField(blank=True, null=True)),
                ('libro', models.CharField(blank=True, max_length=5, null=True)),
                ('folio', models.IntegerField(blank=True, null=True)),
                ('anio_ingreso', models.IntegerField(blank=True, default=2019, null=True)),
                ('grupo_tec', models.IntegerField(blank=True, null=True)),
                ('ficha_de_inscripcion', models.BooleanField(blank=True, null=True)),
                ('foto_dni_estudiante', models.BooleanField(blank=True, null=True)),
                ('foto_dni_estudiante_archivo', models.FileField(blank=True, null=True, upload_to='')),
                ('foto_dni_responsable', models.BooleanField(blank=True, null=True)),
                ('partida_de_nacimiento', models.BooleanField(blank=True, null=True)),
                ('vacunas', models.BooleanField(blank=True, null=True)),
                ('certificado', models.BooleanField(blank=True, null=True)),
                ('url_foto', models.URLField(blank=True, null=True)),
                ('archivo_de_seguimiento', models.URLField(blank=True, null=True)),
                ('porcentaje_beca', models.IntegerField(blank=True, null=True)),
                ('adeuda', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Documentacion')),
                ('curso', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Curso')),
            ],
            bases=('alcal.persona',),
        ),
        migrations.CreateModel(
            name='Padre',
            fields=[
                ('persona_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='alcal.Persona')),
                ('profesion', models.CharField(blank=True, max_length=100, null=True)),
            ],
            bases=('alcal.persona',),
        ),
        migrations.AddField(
            model_name='persona',
            name='tipo',
            field=models.ForeignKey(blank=True, default=1, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.TipoDni'),
        ),
        migrations.CreateModel(
            name='Pendiente',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('materia', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Materia')),
                ('estudiante', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
            ],
        ),
        migrations.CreateModel(
            name='Seguimiento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('notificacion', models.TextField()),
                ('fecha', models.DateField(default=django.utils.timezone.now)),
                ('tipo', models.CharField(choices=[('Cambio de Modalidad', 'Cambio de modalidad'), ('Pase a otra institución', 'Pase a otra institución'), ('Inasistencias', 'Inasistencias'), ('Situación de Salud', 'Situación de Salud'), ('Becas', 'Becas'), ('Cuestiones de Convivencia', 'Cuestiones de Convivencia'), ('Convocatoria', 'Convocatoria'), ('Situación académica', 'Situación académica'), ('Situación personal/familiar', 'Situación personal/familiar'), ('Reconocimiento', 'Reconocimiento'), ('Acuerdo con la Familia', 'Acuerdo con la Familia')], max_length=30)),
                ('estudiante', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
            ],
        ),
        migrations.CreateModel(
            name='Notificacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('notificacion', models.TextField()),
                ('fecha', models.DateField(default=django.utils.timezone.now)),
                ('tipo', models.CharField(choices=[('F', 'Felicitación'), ('O', 'Observación'), ('A', 'Apercibimiento'), ('N', 'Notificación'), ('C', 'Cambio de horario')], max_length=20)),
                ('informante', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
                ('estudiante', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
            ],
            options={
                'verbose_name_plural': 'Notificaciones',
            },
        ),
        migrations.CreateModel(
            name='NotaParcial',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.CharField(max_length=10, null=True)),
                ('curso', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Curso')),
                ('materia', smart_selects.db_fields.ChainedForeignKey(chained_field='curso', chained_model_field='curso', on_delete=django.db.models.deletion.CASCADE, to='alcal.Materia')),
                ('estudiante', smart_selects.db_fields.ChainedForeignKey(chained_field='curso', chained_model_field='curso', on_delete=django.db.models.deletion.CASCADE, to='alcal.Estudiante')),
            ],
            options={
                'verbose_name_plural': 'Notas Parciales',
            },
        ),
        migrations.CreateModel(
            name='Nota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.DecimalField(decimal_places=2, max_digits=4, null=True)),
                ('instancia', models.CharField(choices=[('PT', 'Primer Trimestre'), ('ST', 'Segundo Trimestre'), ('TT', 'Tercer Trimestre'), ('CF', 'Calificación Final'), ('CD', 'Calificación Definitiva'), ('ND', 'Nota Diciembre'), ('NF', 'Nota Febrero'), ('MA', 'Mesa Adicional')], max_length=20, null=True)),
                ('materia', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Materia')),
                ('estudiante', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
            ],
        ),
        migrations.CreateModel(
            name='MesaPendiente',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateTimeField()),
                ('materia', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Materia')),
                ('pendiente', smart_selects.db_fields.ChainedManyToManyField(chained_field='materia', chained_model_field='materia', to='alcal.Pendiente')),
                ('periodo', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Periodo')),
                ('docente', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Docente')),
            ],
            options={
                'verbose_name': 'Mesa de Pendientes',
                'verbose_name_plural': 'Mesas de Pendientes',
            },
        ),
        migrations.AddField(
            model_name='materia',
            name='docente_provisional',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='Provisional', to='alcal.Docente'),
        ),
        migrations.AddField(
            model_name='materia',
            name='docente_suplente',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='Suplente', to='alcal.Docente'),
        ),
        migrations.AddField(
            model_name='materia',
            name='docente_titular',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='Titular', to='alcal.Docente'),
        ),
        migrations.CreateModel(
            name='Inasistencia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.DecimalField(decimal_places=2, max_digits=2)),
                ('fecha', models.DateField()),
                ('hora', models.TimeField(null=True)),
                ('tipo', models.CharField(choices=[('t', 'Llegada tarde'), ('T', 'Llegada tarde fuera de hora'), ('A', 'Ausente'), ('r', 'Retirado dentro de la última hora'), ('R', 'Retirado'), ('E', 'Ausente a Educación Física')], max_length=20)),
                ('turno', models.CharField(choices=[('M', 'Mañana'), ('T', 'Tarde')], max_length=20)),
                ('estudiante', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
            ],
        ),
        migrations.CreateModel(
            name='FechaAltaBaja',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField()),
                ('tipo', models.CharField(choices=[('B', 'Baja'), ('A', 'Alta')], max_length=20)),
                ('estudiante', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
            ],
        ),
        migrations.AddField(
            model_name='estudiante',
            name='responsable',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Padre'),
        ),
        migrations.AddField(
            model_name='estudiante',
            name='vinculo',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Vinculo'),
        ),
        migrations.CreateModel(
            name='Cuota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_pago', models.DateField()),
                ('pagada', models.BooleanField(default=False)),
                ('importe', models.IntegerField()),
                ('nombre_cuota', models.ForeignKey(max_length=20, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.NombreCuota')),
                ('estudiante', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
            ],
        ),
    ]
