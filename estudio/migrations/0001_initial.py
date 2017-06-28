# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('geo', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('clima', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Escenario',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('anual_inicio', models.IntegerField(verbose_name='a\xf1o inicio')),
                ('anual_fin', models.IntegerField(verbose_name='a\xf1o fin')),
                ('modelo', models.ForeignKey(to='clima.Modelo', on_delete=django.db.models.deletion.PROTECT)),
            ],
            options={
                'verbose_name': 'escenario',
                'verbose_name_plural': 'escenarios',
            },
        ),
        migrations.CreateModel(
            name='Proyecto',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(max_length=100, verbose_name='nombre')),
                ('comentario', models.TextField(null=True, verbose_name='comentarios', blank=True)),
                ('creado', models.DateTimeField(auto_now_add=True, verbose_name='creaci\xf3n')),
                ('autor', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('pais', models.ForeignKey(to='geo.Pais', to_field='codigo')),
            ],
            options={
                'verbose_name': 'proyecto',
                'verbose_name_plural': 'proyectos',
            },
        ),
        migrations.AddField(
            model_name='escenario',
            name='proyecto',
            field=models.ForeignKey(to='estudio.Proyecto'),
        ),
        migrations.AlterUniqueTogether(
            name='escenario',
            unique_together=set([('proyecto', 'modelo')]),
        ),
    ]
