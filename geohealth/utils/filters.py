from django.contrib import admin
from django.contrib.admin.options import IncorrectLookupParameters
from django.core.exceptions import ValidationError
from estudio.models import Proyecto, Escenario


class ProyectoSimpleListFilter(admin.SimpleListFilter):
    title = "Proyectos"
    parameter_name = "proyecto_id"

    def lookups(self, request, model_admin):
        qs = Proyecto.objects.filter(autor=request.user)\
                             .order_by("id")\
                             .values_list("id", "nombre")
        return qs

    def queryset(self, request, queryset):
        try:
            #request.session.pop(self.parameter_name, False)
            if self.parameter_name in self.used_parameters:
                #request.session[self.parameter_name] = self.used_parameters[self.parameter_name]
                return queryset.filter(**self.used_parameters)
            else:
                return queryset.none()
        except ValidationError as e:
            raise IncorrectLookupParameters(e)


class EscenarioSimpleListFilter(admin.SimpleListFilter):
    title = "Escenarios"
    parameter_name = "escenario_id"

    def lookups(self, request, model_admin):
        qs = Escenario.objects.filter(proyecto_id=request.session.get("proyecto_id", -1))\
                              .order_by("id")\
                              .values_list("id", "modelo__nombre")
        return qs

    def queryset(self, request, queryset):
        try:
            if self.parameter_name in self.used_parameters:
                return queryset.filter(**self.used_parameters)
            else:
                return queryset.none()
        except ValidationError as e:
            raise IncorrectLookupParameters(e)