# Generated by Django 2.2.3 on 2019-08-21 19:44

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alcal', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='persona',
            name='fnac',
            field=models.DateField(blank=True, default=datetime.datetime(2007, 8, 24, 16, 44, 36, 473089), null=True),
        ),
    ]
