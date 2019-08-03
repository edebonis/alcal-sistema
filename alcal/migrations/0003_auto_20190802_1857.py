# Generated by Django 2.2.3 on 2019-08-02 21:57

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alcal', '0002_auto_20190731_1928'),
    ]

    operations = [
        migrations.AlterField(
            model_name='curso',
            name='cursosiguiente',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='alcal.Curso'),
        ),
        migrations.AlterField(
            model_name='estudiante',
            name='fnac',
            field=models.DateField(blank=True, default=datetime.datetime(2007, 8, 5, 18, 57, 3, 829377), null=True),
        ),
        migrations.AlterField(
            model_name='estudiante',
            name='tipo',
            field=models.ForeignKey(blank=True, default=1, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.TipoDni'),
        ),
    ]
