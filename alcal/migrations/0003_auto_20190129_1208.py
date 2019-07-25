# Generated by Django 2.1.5 on 2019-01-29 12:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alcal', '0002_auto_20190129_1151'),
    ]

    operations = [
        migrations.CreateModel(
            name='Materia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20)),
                ('taller', models.BooleanField(default=False)),
                ('carrera', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='alcal.Carrera')),
            ],
        ),
        migrations.AddField(
            model_name='docente',
            name='email',
            field=models.EmailField(max_length=254, null=True),
        ),
        migrations.AddField(
            model_name='docente',
            name='nombre_corto',
            field=models.CharField(max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='docente',
            name='profesion',
            field=models.CharField(max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='materia',
            name='docente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='alcal.Docente'),
        ),
    ]
