from django.contrib import admin
from clima.models import Modelo


@admin.register(Modelo)
class ModeloAdmin(admin.ModelAdmin):
    list_display_links = ("nombre", )
    list_display = ("id", "nombre",)
    readonly_fields = ("id", "nombre")
    ordering = ("id", )

    fieldsets = (
        (None,
         {"fields": ("id", "nombre", "comentario")}
         ),
    )

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

