# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from geo.models import Distrito

__all__ = ["Modelo", "Variable", "Resumen"]


class Modelo(models.Model):
    id = models.CharField(max_length=30, primary_key=True)
    nombre = models.CharField("nombre", max_length=100)
    comentario = models.TextField("comentarios", null=True, blank=True)

    def __str__(self):
        return "{}: {}".format(self.id, self.nombre)

    class Meta:
        verbose_name = "modelo"
        verbose_name_plural = "modelos"


class Variable(models.Model):
    distrito = models.ForeignKey(Distrito, to_field='codigo')
    modelo = models.ForeignKey(Modelo)
    anual = models.IntegerField("año")
    prec = models.FloatField("precipitación",
                             help_text="precipitación acumulada en (mm)")
    temp = models.FloatField("temperatura",
                             help_text="temperatura media en (C)")

    class Meta:
        verbose_name = "variable climática"
        verbose_name_plural = "variables climáticas"
        unique_together = ['distrito', 'modelo', 'anual']


class Resumen(models.Model):
    distrito = models.ForeignKey(Distrito, to_field='codigo')
    modelo = models.ForeignKey(Modelo)
    anual_inicio = models.IntegerField("año inicio")
    anual_fin = models.IntegerField("año fin")
    prec = models.FloatField("precipitación",
                             help_text="promedio en (mm)")
    temp = models.FloatField("temperatura",
                             help_text="promedio en (C)")

    class Meta:
        verbose_name = "resumen climático"
        verbose_name_plural = "resumenes climáticos"
        unique_together = ['distrito', 'modelo', 'anual_inicio', 'anual_fin']

