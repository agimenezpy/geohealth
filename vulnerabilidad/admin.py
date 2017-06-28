# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.conf.urls import url
from django.contrib.admin.utils import unquote
from django.core.urlresolvers import reverse
from django.db import models, transaction
from django.contrib import admin, messages
from django.forms import widgets
from django.http.response import HttpResponseRedirect
from django.template.response import TemplateResponse
from estudio.models import Proyecto
from import_export.admin import force_text, ImportForm
from geo.models import Distrito
from geohealth.utils.export import APP_FORMATS
from geohealth.utils.fields import IndexField
from vulnerabilidad.export import IndiceResource, SaludResource
from vulnerabilidad.models import *
from geohealth.utils.options import WriteOnlyPermissionsMixin
from geohealth.utils.filters import EscenarioSimpleListFilter
from import_export.admin import ImportExportMixin
from django.utils.translation import ugettext_lazy as _


class IndicadorAdmin(WriteOnlyPermissionsMixin, ImportExportMixin, admin.ModelAdmin):
    change_list_template = "admin/vulnerabilidad/change_list.html"
    list_filter = ("distrito__departamento",)
    list_display_links = ("distrito_nombre", )
    list_select_related = True
    search_fields = ("distrito__nombre", )
    list_per_page = 10
    ordering = ("distrito_id",)
    formats = APP_FORMATS

    formfield_overrides = {
        IndexField: {
            'widget': widgets.NumberInput(attrs={"class": "input-mini"})
        }
    }

    def distrito_nombre(self, obj):
        return obj.distrito.nombre
    distrito_nombre.short_description = "distrito"

    def get_urls(self):
        pattern_list = super(IndicadorAdmin, self).get_urls()
        info = self.model._meta.app_label, self.model._meta.model_name

        pattern_list = [
            url('^calculo/$',
                self.admin_site.admin_view(self.update_indexes),
                name='%s_%s_calculo' % info),
        ] + pattern_list
        return pattern_list

    def get_queryset(self, request):
        qs = super(IndicadorAdmin, self).get_queryset(request)
        if self.model._meta.model_name != "indice":
            return qs.filter(proyecto_id=request.session.get("proyecto_id", -1))
        else:
            return qs

    def changelist_view(self, request, extra_context=None):
        if request.session.get("proyecto_id", False):
            if self.model._meta.model_name != "indice" and \
               self.get_queryset(request).count() == 0:
                proy = request.session.get("proyecto_id")
                with transaction.atomic():
                    self.model.objects.bulk_create(
                        [self.model(distrito_id=distrito.codigo, proyecto_id=int(proy))
                         for distrito in Distrito.objects.all()]
                    )
            return super(IndicadorAdmin, self).changelist_view(request, extra_context)
        else:
            return HttpResponseRedirect(reverse('admin:estudio_proyecto_project') +
                                        "?reverse=" + request.path)

    def import_action(self, request, *args, **kwargs):
        import_formats = self.get_import_formats()
        form = ImportForm(import_formats,
                          request.POST or None,
                          request.FILES or None)
        if form.is_valid():
            input_format = import_formats[
                int(form.cleaned_data['input_format'])
            ]()
            import_file = form.cleaned_data['import_file']
            # first always write the uploaded file to disk as it may be a
            # memory file or else based on settings upload handlers
            tmp_storage = self.get_tmp_storage_class()()
            data = bytes()
            for chunk in import_file.chunks():
                data += chunk

            tmp_storage.save(data, input_format.get_read_mode())
            # then read the file, using the proper format-specific mode
            # warning, big files may exceed memory
            data = tmp_storage.read(input_format.get_read_mode())
            if not input_format.is_binary() and self.from_encoding:
                data = force_text(data, self.from_encoding)
            dataset = input_format.create_dataset(data)

            filter_params = {}
            if self.model._meta.model_name != "indice":
                filter_params["proyecto_id"] = request.session.get("proyecto_id", -1)
            else:
                filter_params["escenario_id"] = request.GET.get("escenario_id", -1)

            with transaction.atomic():
                for row in dataset.dict:
                    obj = self.model.objects.filter(distrito__nombre=row["distrito"],
                                                    **filter_params).get()
                    for attr in row.keys():
                        if attr == "distrito":
                            continue
                        setattr(obj, attr, row[attr])
                    obj.save()

            success_message = _('Import finished')
            messages.success(request, success_message)
            tmp_storage.remove()

            url = reverse('admin:%s_%s_changelist' % self.get_model_info(),
                          current_app=self.admin_site.name)
            return HttpResponseRedirect(url)
        else:
            context = {}
            context['form'] = form
            context['opts'] = self.model._meta
            context['fields'] = []

            return TemplateResponse(request, [self.import_template_name],
                                    context, current_app=self.admin_site.name)

@admin.register(Salud)
class SaludAdmin(IndicadorAdmin):
    list_display = ("distrito_nombre", "dengue", "lepto", "lta", "diarrea", "ivs")
    readonly_fields = ("proyecto", "distrito", "ivs")
    list_editable = ("dengue", "lepto", "lta", "diarrea",)

    resource_class = SaludResource

    fieldsets = (
        (None,
            {"fields": readonly_fields[:2]}
         ),
        ("Indices",
            {"fields": list_display[1:]}
         )
    )

    def update_indexes(self, request, *args, **kwargs):
        pass

@admin.register(Social)
class SocialAdmin(IndicadorAdmin):
    list_display = ("distrito_nombre", "social", "ivsf")
    readonly_fields = ("proyecto", "distrito", "ivsf")
    list_editable = ("social",)

    fieldsets = (
        (None,
            {"fields": readonly_fields[:2]}
         ),
        ("Indices",
            {"fields": list_display[1:]}
         )
    )

    def update_indexes(self, request, *args, **kwargs):
        pass

@admin.register(Ambiental)
class AmbientalAdmin(IndicadorAdmin):
    list_display = ("distrito_nombre", "conservacion", "eventos_extremos", "linea_costa", "cobertura_vegetal", "ivam")
    readonly_fields = ("proyecto", "distrito", "ivam")
    list_editable = ("conservacion", "eventos_extremos", "linea_costa", "cobertura_vegetal")

    fieldsets = (
        (None,
            {"fields": readonly_fields[:2]}
         ),
        ("Indices",
            {"fields": list_display[1:]}
         )
    )

    def update_indexes(self, request, *args, **kwargs):
        pass


@admin.register(Indice)
class IndiceAdmin(IndicadorAdmin):
    list_display = ("distrito_nombre", "ivg", "iec", "ivm")
    readonly_fields = ("escenario", "distrito", "ivg", "ivm")
    list_editable = ("iec", )
    list_filter = ("distrito__departamento",
                   EscenarioSimpleListFilter)
    resource_class = IndiceResource

    fieldsets = (
        (None,
            {"fields": readonly_fields[:2]}
         ),
        ("Indices",
            {"fields": list_display[1:]}
         )
    )

    def update_indexes(self, request, *args, **kwargs):
        import pandas as pd
        proyecto = request.session.get('proyecto_id', False)
        escenario = request.GET.get("escenario_id", False)
        if not proyecto or not escenario:
            messages.add_message(request, messages.ERROR,
                                 "Indices no se pueden calcular sin proyecto o escenario electo")
        else:
            proy = Proyecto.objects.get(id=proyecto)
            data = pd.DataFrame(index=[
                dis[0] for dis in Distrito.objects.filter(departamento__pais__codigo=proy.pais_id)
                                .order_by("codigo")
                                .values_list("codigo")
                ], columns=["ivs", "ivsf", "ivam", "iec", "ivg", "ivm"])
            vars = ["ivs", "ivsf", "ivam"]
            objs = [Salud, Social, Ambiental]
            for v, obj in zip(vars, objs):
                data[v] = [
                    r[0] for r in obj.objects.filter(proyecto_id=proyecto)
                        .order_by("distrito_id")
                        .values_list(v)
                    ]
            data["iec"] = [
                r[0] for r in Indice.objects.filter(escenario_id=escenario)
                    .order_by("distrito_id")
                    .values_list("iec")
                ]
            data["ivg"] = (data['ivs'] + data['ivsf'] + data['ivam'])/3
            # Calculo de IVG
            aggmin, aggmax = data["ivg"].min(), data["ivg"].max()
            data["ivg"] = (data["ivg"] - aggmin) / (aggmax - aggmin)

            # Calculo de IVM
            data["ivm"] = data["ivg"] + data["iec"]
            aggmin, aggmax = data["ivm"].min(), data["ivm"].max()
            data["ivm"] = (data["ivm"] - aggmin) / (aggmax - aggmin)

            with transaction.atomic():
                for item in Indice.objects.filter(escenario_id=unquote(escenario)) \
                        .order_by("distrito_id"):
                    item.ivg = data.loc[item.distrito_id, "ivg"]
                    item.ivm = data.loc[item.distrito_id, "ivm"]
                    item.save(update_fields=["ivg", "ivm"])
            messages.add_message(request, messages.INFO,
                                 "Índices calculados con éxito")
        return HttpResponseRedirect(reverse('admin:%s_%s_changelist' % self.get_model_info()) +
                                    "?" + request.GET.urlencode())
