# Generated by Django 2.1.5 on 2019-07-23 21:45

from django.db import migrations, models
import django.db.models.deletion
import django_countries.fields


class Migration(migrations.Migration):

    dependencies = [
        ('alcal', '0021_auto_20190723_2141'),
    ]

    operations = [
        migrations.CreateModel(
            name='Padre',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('apellido', models.CharField(max_length=100, null=True)),
                ('nombre', models.CharField(max_length=100, null=True)),
                ('fnac', models.DateField(blank=True, null=True)),
                ('num_dni', models.IntegerField(blank=True, null=True)),
                ('domicilio_calle', models.CharField(blank=True, max_length=100, null=True)),
                ('domicilio_numero', models.IntegerField(blank=True, null=True)),
                ('telefono_1', models.CharField(blank=True, max_length=100, null=True)),
                ('telefono_2', models.CharField(blank=True, max_length=100, null=True)),
                ('telefono_3', models.CharField(blank=True, max_length=100, null=True)),
                ('email', models.EmailField(blank=True, max_length=254, null=True)),
                ('pais_de_nacimiento', django_countries.fields.CountryField(blank=True, max_length=2, null=True)),
                ('profesion', models.CharField(blank=True, max_length=100, null=True)),
                ('genero', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Genero')),
                ('tipo', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.TipoDni')),
            ],
        ),
        migrations.RenameModel(
            old_name='FechasAltaBaja',
            new_name='FechaAltaBaja',
        ),
        migrations.RemoveField(
            model_name='padres',
            name='adeuda',
        ),
        migrations.RemoveField(
            model_name='padres',
            name='genero',
        ),
        migrations.RemoveField(
            model_name='padres',
            name='tipo',
        ),
        migrations.RemoveField(
            model_name='padres',
            name='vinculo_con_el_estudiante',
        ),
        migrations.AlterField(
            model_name='docente',
            name='carrera_doncente',
            field=models.ManyToManyField(blank=True, to='alcal.Carrera'),
        ),
        migrations.DeleteModel(
            name='Padres',
        ),
    ]
