# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('geo', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Modelo',
            fields=[
                ('id', models.CharField(max_length=30, serialize=False, primary_key=True)),
                ('nombre', models.CharField(max_length=100, verbose_name='nombre')),
                ('comentario', models.TextField(null=True, verbose_name='comentarios', blank=True)),
            ],
            options={
                'verbose_name': 'modelo',
                'verbose_name_plural': 'modelos',
            },
        ),
        migrations.CreateModel(
            name='Resumen',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('anual_inicio', models.IntegerField(verbose_name='a\xf1o inicio')),
                ('anual_fin', models.IntegerField(verbose_name='a\xf1o fin')),
                ('prec', models.FloatField(help_text='promedio en (mm)', verbose_name='precipitaci\xf3n')),
                ('temp', models.FloatField(help_text='promedio en (C)', verbose_name='temperatura')),
                ('distrito', models.ForeignKey(to='geo.Distrito', to_field='codigo')),
                ('modelo', models.ForeignKey(to='clima.Modelo')),
            ],
            options={
                'verbose_name': 'resumen clim\xe1tico',
                'verbose_name_plural': 'resumenes clim\xe1ticos',
            },
        ),
        migrations.CreateModel(
            name='Variable',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('anual', models.IntegerField(verbose_name='a\xf1o')),
                ('prec', models.FloatField(help_text='precipitaci\xf3n acumulada en (mm)', verbose_name='precipitaci\xf3n')),
                ('temp', models.FloatField(help_text='temperatura media en (C)', verbose_name='temperatura')),
                ('distrito', models.ForeignKey(to='geo.Distrito', to_field='codigo')),
                ('modelo', models.ForeignKey(to='clima.Modelo')),
            ],
            options={
                'verbose_name': 'variable clim\xe1tica',
                'verbose_name_plural': 'variables clim\xe1ticas',
            },
        ),
        migrations.AlterUniqueTogether(
            name='variable',
            unique_together=set([('distrito', 'modelo', 'anual')]),
        ),
        migrations.AlterUniqueTogether(
            name='resumen',
            unique_together=set([('distrito', 'modelo', 'anual_inicio', 'anual_fin')]),
        ),
    ]
