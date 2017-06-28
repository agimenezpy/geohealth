from django.contrib import admin
from geohealth.utils.options import ReadOnlyPermissionsMixin, ModelAdmin
from geo.models import Pais, Departamento, Distrito


@admin.register(Pais)
class PaisAdmin(ReadOnlyPermissionsMixin, ModelAdmin):
    list_display = ("codigo", "nombre", "iso3")
    list_display_links = ("nombre",)

    url_alias = ""


@admin.register(Departamento)
class DepartamentoAdmin(ReadOnlyPermissionsMixin, ModelAdmin):
    list_display = ("codigo", "nombre", "pais_display")
    list_display_links = ("nombre",)

    list_filter = ("pais", )

    url_alias = ""

    def pais_display(self, obj):
        return obj.pais.nombre
    pais_display.short_description = "pais"
    pais_display.admin_order = "pais__codigo"


@admin.register(Distrito)
class DistritoAdmin(ReadOnlyPermissionsMixin, ModelAdmin):
    list_display = ("codigo", "nombre", "departamento_display", "pais_display")
    list_display_links = ("nombre",)

    list_filter = ("departamento",)
    search_fields = ("nombre", )

    url_alias = ""

    def departamento_display(self, obj):
        return obj.departamento.nombre
    departamento_display.short_description = "departamento"
    departamento_display.admin_order = "departamento__codigo"

    def pais_display(self, obj):
        return obj.departamento.pais.nombre
    pais_display.short_description = "pais"
