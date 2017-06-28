# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import geohealth.utils.fields
import django.db.models.deletion
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('geo', '0001_initial'),
        ('estudio', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Ambiental',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('conservacion', geohealth.utils.fields.IndexField(default=0, verbose_name='conservaci\xf3n', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('eventos_extremos', geohealth.utils.fields.IndexField(default=0, verbose_name='eventos extremos', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('linea_costa', geohealth.utils.fields.IndexField(default=0, verbose_name='linea de costa', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('cobertura_vegetal', geohealth.utils.fields.IndexField(default=0, verbose_name='cobertura vegetal', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('ivam', geohealth.utils.fields.IndexField(default=0, help_text='\xedndice ambiental', verbose_name='IVAmp', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('distrito', models.ForeignKey(to='geo.Distrito', on_delete=django.db.models.deletion.PROTECT, to_field='codigo')),
                ('proyecto', models.ForeignKey(to='estudio.Proyecto')),
            ],
            options={
                'verbose_name': '\xedndicador ambiental',
                'verbose_name_plural': '\xedndicadores ambientales',
            },
        ),
        migrations.CreateModel(
            name='Indice',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('ivg', geohealth.utils.fields.IndexField(default=0, help_text='\xedndice general', verbose_name='IVGp', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('iec', geohealth.utils.fields.IndexField(default=0, help_text='\xedndice de escenario clim\xe1tico', verbose_name='IECp', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('ivm', geohealth.utils.fields.IndexField(default=0, help_text='\xedndice de vulnerabilidad', verbose_name='IVMp', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('distrito', models.ForeignKey(to='geo.Distrito', on_delete=django.db.models.deletion.PROTECT, to_field='codigo')),
                ('escenario', models.ForeignKey(to='estudio.Escenario')),
            ],
            options={
                'verbose_name': '\xedndice',
                'verbose_name_plural': '\xedndices',
            },
        ),
        migrations.CreateModel(
            name='Salud',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('dengue', geohealth.utils.fields.IndexField(default=0, verbose_name='Dengue', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('lepto', geohealth.utils.fields.IndexField(default=0, verbose_name='Leptospirose', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('lta', geohealth.utils.fields.IndexField(default=0, verbose_name='LTA', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('diarrea', geohealth.utils.fields.IndexField(default=0, verbose_name='Diarrea', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('ivs', geohealth.utils.fields.IndexField(default=0, help_text='\xedndice de salud', verbose_name='IVSp', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('distrito', models.ForeignKey(to='geo.Distrito', on_delete=django.db.models.deletion.PROTECT, to_field='codigo')),
                ('proyecto', models.ForeignKey(to='estudio.Proyecto')),
            ],
            options={
                'verbose_name': 'indicador salud',
                'verbose_name_plural': 'indicadores salud',
            },
        ),
        migrations.CreateModel(
            name='Social',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('social', geohealth.utils.fields.IndexField(default=0, verbose_name='IVSF', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('ivsf', geohealth.utils.fields.IndexField(default=0, help_text='\xedndice social', verbose_name='IVSFp', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1), django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('distrito', models.ForeignKey(to='geo.Distrito', on_delete=django.db.models.deletion.PROTECT, to_field='codigo')),
                ('proyecto', models.ForeignKey(to='estudio.Proyecto')),
            ],
            options={
                'verbose_name': '\xedndicador social',
                'verbose_name_plural': '\xedndicadores sociales',
            },
        ),
        migrations.AlterUniqueTogether(
            name='social',
            unique_together=set([('proyecto', 'distrito')]),
        ),
        migrations.AlterUniqueTogether(
            name='salud',
            unique_together=set([('proyecto', 'distrito')]),
        ),
        migrations.AlterUniqueTogether(
            name='indice',
            unique_together=set([('escenario', 'distrito')]),
        ),
        migrations.AlterUniqueTogether(
            name='ambiental',
            unique_together=set([('proyecto', 'distrito')]),
        ),
    ]
