# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from import_export.formats import base_formats

class CSV(base_formats.CSV):
    def get_title(self):
        return "Texto con comas"

class XLS(base_formats.XLS):
    def get_title(self):
        return "Excel 1998-2003"

class HTML(base_formats.HTML):
    def get_title(self):
        return "Página HTML"

class ODS(base_formats.ODS):
    def get_title(self):
        return "OpenDocument Format"

APP_FORMATS = (
    XLS,
    CSV,
    HTML,
    ODS
)

