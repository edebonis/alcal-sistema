# Generated by Django 2.1.5 on 2019-07-23 19:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alcal', '0018_materia_carga_horaria'),
    ]

    operations = [
        migrations.CreateModel(
            name='NotaParcial',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.CharField(max_length=10, null=True)),
                ('estudiante', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
                ('materia', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Materia')),
            ],
        ),
        migrations.AlterField(
            model_name='nota',
            name='instancia',
            field=models.CharField(choices=[('PT', 'Primer Trimestre'), ('ST', 'Segundo Trimestre'), ('TT', 'Tercer Trimestre'), ('CF', 'Calificación Final'), ('CD', 'Calificación Definitiva'), ('ND', 'Nota Diciembre'), ('NF', 'Nota Febrero'), ('MA', 'Mesa Adicional')], max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='nota',
            name='numero',
            field=models.DecimalField(decimal_places=2, max_digits=4, null=True),
        ),
    ]
