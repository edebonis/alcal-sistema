# Generated by Django 2.2.3 on 2020-01-30 01:37

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alcal', '0003_persona_usuario'),
    ]

    operations = [
        migrations.AlterField(
            model_name='persona',
            name='usuario',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL),
        ),
    ]