# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from geo.models import Distrito, Pais
from django.db import models
from django.conf import settings

__all__ = ["Proyecto", "Escenario"]


class Proyecto(models.Model):
    nombre = models.CharField("nombre", max_length=100)
    comentario = models.TextField("comentarios", blank=True, null=True)
    pais = models.ForeignKey(Pais, to_field="codigo")
    autor = models.ForeignKey(settings.AUTH_USER_MODEL)
    creado = models.DateTimeField("creación", auto_now_add=True)

    def __str__(self):
        return "[{}] {}".format(self.id, self.nombre)

    class Meta:
        verbose_name = "proyecto"
        verbose_name_plural = "proyectos"


class Escenario(models.Model):
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    modelo = models.ForeignKey('clima.Modelo', on_delete=models.PROTECT)
    anual_inicio = models.IntegerField("año inicio")
    anual_fin = models.IntegerField("año fin")

    def __str__(self):
        return "[{}] {} ({}, {})".format(self.id, self.modelo.nombre,
                                         self.anual_inicio, self.anual_fin)

    class Meta:
        verbose_name = "escenario"
        verbose_name_plural = "escenarios"
        unique_together = ["proyecto", "modelo"]
