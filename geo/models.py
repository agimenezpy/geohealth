# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.gis.db import models


class Pais(models.Model):
    """Limite del país"""
    codigo = models.CharField("código", unique=True, max_length=12)
    nombre = models.CharField("nombre", max_length=20)
    iso2 = models.CharField("ISO2", max_length=2)
    iso3 = models.CharField("ISO3", max_length=3)
    x = models.FloatField("coordenada X", default=0.0)
    y = models.FloatField("coordenada Y", default=0.0)
    geom = models.MultiPolygonField("geometría", srid=4326)
    objects = models.GeoManager()

    def __unicode__(self):
        return "[%s] %s" % (self.codigo, self.nombre)

    class Meta:
        verbose_name = "pais"
        verbose_name_plural = "paises"
        ordering = ("codigo",)

    mapping = {
        'codigo': 'ISO_A2',
        'nombre': 'ADMIN',
        'iso2': 'ISO_A2',
        'iso3': 'ISO_A3',
        'geom': 'POLYGON',
    }


class Departamento(models.Model):
    """Departamentos"""
    codigo = models.CharField("código", unique=True, max_length=12)
    nombre = models.CharField("nombre", max_length=50)
    pais = models.ForeignKey(Pais, to_field="codigo")
    x = models.FloatField("coordenada X", default=0.0)
    y = models.FloatField("coordenada Y", default=0.0)
    geom = models.PolygonField("geometría", srid=4326)
    objects = models.GeoManager()

    def __unicode__(self):
        return "[%s] %s" % (self.codigo, self.nombre)

    class Meta:
        verbose_name = "departamento"
        verbose_name_plural = "departamentos"
        ordering = ("codigo",)

    mapping = {
        'codigo': 'CODIGO',
        'nombre': 'DPTO_DESC',
        'pais': {'codigo': 'PAIS'},
        'x': 'X',
        'y': 'Y',
        'geom': 'POLYGON',
    }


class Distrito(models.Model):
    """Distritos"""
    codigo = models.CharField("código", unique=True, max_length=12)
    nombre = models.CharField("nombre", max_length=50)
    departamento = models.ForeignKey(Departamento, to_field="codigo")
    x = models.FloatField("coordenada X", default=0.0)
    y = models.FloatField("coordenada Y", default=0.0)
    geom = models.PolygonField("geometría", srid=4326)
    objects = models.GeoManager()

    def __unicode__(self):
        return "[%s] %s" % (self.codigo, self.nombre)

    class Meta:
        verbose_name = "distrito"
        verbose_name_plural = "distritos"
        ordering = ("codigo",)

    mapping = {
        'codigo': 'CODIGO',
        'nombre': 'CODENAME',
        'departamento': {'codigo': 'DPTO'},
        'x': 'X',
        'y': 'Y',
        'geom': 'POLYGON',
    }
