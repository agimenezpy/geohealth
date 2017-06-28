# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Pais',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('codigo', models.CharField(unique=True, max_length=12, verbose_name='c\xf3digo')),
                ('nombre', models.CharField(max_length=20, verbose_name='nombre')),
                ('iso2', models.CharField(max_length=2, verbose_name='ISO2')),
                ('iso3', models.CharField(max_length=3, verbose_name='ISO3')),
                ('x', models.FloatField(default=0.0, verbose_name='coordenada X')),
                ('y', models.FloatField(default=0.0, verbose_name='coordenada Y')),
                ('geom', django.contrib.gis.db.models.fields.MultiPolygonField(srid=4326, verbose_name='geometr\xeda')),
            ],
            options={
                'ordering': ('codigo',),
                'verbose_name': 'pais',
                'verbose_name_plural': 'paises',
            },
        ),
        migrations.CreateModel(
            name='Departamento',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('codigo', models.CharField(unique=True, max_length=12, verbose_name='c\xf3digo')),
                ('nombre', models.CharField(max_length=50, verbose_name='nombre')),
                ('x', models.FloatField(default=0.0, verbose_name='coordenada X')),
                ('y', models.FloatField(default=0.0, verbose_name='coordenada Y')),
                ('geom', django.contrib.gis.db.models.fields.PolygonField(srid=4326, verbose_name='geometr\xeda')),
                ('pais', models.ForeignKey(to='geo.Pais', to_field='codigo')),
            ],
            options={
                'ordering': ('codigo',),
                'verbose_name': 'departamento',
                'verbose_name_plural': 'departamentos',
            },
        ),
        migrations.CreateModel(
            name='Distrito',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('codigo', models.CharField(unique=True, max_length=12, verbose_name='c\xf3digo')),
                ('nombre', models.CharField(max_length=50, verbose_name='nombre')),
                ('x', models.FloatField(default=0.0, verbose_name='coordenada X')),
                ('y', models.FloatField(default=0.0, verbose_name='coordenada Y')),
                ('geom', django.contrib.gis.db.models.fields.PolygonField(srid=4326, verbose_name='geometr\xeda')),
                ('departamento', models.ForeignKey(to='geo.Departamento', to_field='codigo')),
            ],
            options={
                'ordering': ('codigo',),
                'verbose_name': 'distrito',
                'verbose_name_plural': 'distritos',
            },
        )
    ]
