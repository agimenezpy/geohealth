# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from geo.models import Distrito
from estudio.models import Proyecto, Escenario
from django.db import models
from geohealth.utils.fields import IndexField

__all__ = ["Salud", "Social", "Ambiental", "Indice"]


class Salud(models.Model):
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    distrito = models.ForeignKey(Distrito, to_field='codigo', on_delete=models.PROTECT)
    dengue = IndexField("Dengue", default=0)
    lepto = IndexField("Leptospirose", default=0)
    lta = IndexField("LTA", default=0)
    diarrea = IndexField("Diarrea", default=0)
    ivs = IndexField("IVSp", default=0,
                     help_text="índice de salud")

    def natural_key(self):
        return self.proyecto_id, self.distrito_id

    class Meta:
        verbose_name = "indicador salud"
        verbose_name_plural = "indicadores salud"
        unique_together = ['proyecto', 'distrito']


class Social(models.Model):
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    distrito = models.ForeignKey(Distrito, to_field='codigo', on_delete=models.PROTECT)
    social = IndexField("IVSF", default=0)
    ivsf = IndexField("IVSFp", default=0,
                      help_text="índice social")

    def natural_key(self):
        return self.proyecto_id, self.distrito_id

    class Meta:
        verbose_name = "índicador social"
        verbose_name_plural = "índicadores sociales"
        unique_together = ['proyecto', 'distrito']


class Ambiental(models.Model):
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    distrito = models.ForeignKey(Distrito, to_field='codigo', on_delete=models.PROTECT)
    conservacion = IndexField("conservación", default=0)
    eventos_extremos = IndexField("eventos extremos", default=0)
    linea_costa = IndexField("linea de costa", default=0)
    cobertura_vegetal = IndexField("cobertura vegetal", default=0)
    ivam = IndexField("IVAmp", default=0,
                      help_text="índice ambiental")

    def natural_key(self):
        return self.proyecto_id, self.distrito_id

    class Meta:
        verbose_name = "índicador ambiental"
        verbose_name_plural = "índicadores ambientales"
        unique_together = ['proyecto', 'distrito']


class Indice(models.Model):
    escenario = models.ForeignKey(Escenario, on_delete=models.CASCADE)
    distrito = models.ForeignKey(Distrito, to_field='codigo', on_delete=models.PROTECT)
    ivg = IndexField("IVGp", default=0,
                     help_text="índice general")
    iec = IndexField("IECp", default=0,
                     help_text="índice de escenario climático")
    ivm = IndexField("IVMp", default=0,
                     help_text="índice de vulnerabilidad")

    def natural_key(self):
        return self.escenario_id, self.distrito_id

    def __str__(self):
        return "{}".format(self.id)

    class Meta:
        verbose_name = "índice"
        verbose_name_plural = "índices"
        unique_together = ['escenario', 'distrito']
