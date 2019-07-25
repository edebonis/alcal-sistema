# Generated by Django 2.1.5 on 2019-07-23 21:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alcal', '0022_auto_20190723_2145'),
    ]

    operations = [
        migrations.CreateModel(
            name='Parentezco',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estudiante', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Estudiante')),
                ('padre', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Padre')),
                ('vinculo', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='alcal.Vinculo')),
            ],
        ),
    ]
