# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.conf import settings
from django.apps import AppConfig as BaseConfig


class GeoHealtConfig(BaseConfig):
    name = "suit"
    verbose_name = "GeoHealth 1.0"
    settings.SUIT_CONFIG = {
        "ADMIN_NAME": verbose_name,
        "SHOW_REQUIRED_ASTERISK": True,
        "MENU_OPEN_FIRST_CHILD": True,
        "SEARCH_URL": "admin:estudio_proyecto_changelist",
        'MENU': ('geo', 'clima', 'estudio', 'vulnerabilidad',
                 {'label': "GeoApp", 'url': 'http://localhost:9080/', 'icon': 'icon-globe'})
    }


class GeoAppConfig(BaseConfig):
    name = "geo"
    verbose_name = "Geografía"


class ClimaAppConfig(BaseConfig):
    name = "clima"
    verbose_name = "Clima"


class EstudioAppConfig(BaseConfig):
    name = "estudio"
    verbose_name = "Estudio"


class VulnerabilidadAppConfig(BaseConfig):
    name = "vulnerabilidad"
    verbose_name = "Vulnerabilidad"