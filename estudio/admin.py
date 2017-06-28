# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.conf.urls import url
from django.contrib import admin, messages
from django.contrib.admin.utils import unquote
from django.core.urlresolvers import reverse
from django.http.response import HttpResponseRedirect
from django.template.response import TemplateResponse
from estudio.models import *
from django import forms
from django.db import transaction
from geo.models import Distrito
from vulnerabilidad.models import Indice


class ProyectoForm(forms.Form):
    proyecto = forms.ChoiceField(label="Proyecto", required=True,
                                 choices=())

    def __init__(self, *args, **kwargs):
        super(ProyectoForm, self).__init__(*args, **kwargs)
        choices = []
        for item in Proyecto.objects.all().values_list("id", "nombre"):
            choices.append(item)
        if len(choices) > 1:
            choices.insert(0, ('', '---'))

        self.fields['proyecto'].choices = choices


class EscenarioAdmin(admin.TabularInline):
    model = Escenario
    extra = 0


@admin.register(Proyecto)
class ProyectoAdmin(admin.ModelAdmin):
    list_display = ("nombre", "pais_display", "autor_nombre")
    list_display_links = ("nombre",)
    inlines = [EscenarioAdmin]
    list_select_related = True

    fieldsets = (
        (None,
            {"fields": ("nombre", "comentario", "pais")}),
    )

    def pais_display(self, obj):
        return str(obj.autor)
    pais_display.short_description = "pais"
    pais_display.admin_order = "pais__codigo"

    def autor_nombre(self, obj):
        return str(obj.autor)
    autor_nombre.short_description = "autor"
    autor_nombre.admin_order = "creado__nombre"

    def save_formset(self, request, form, formset, change):
        with transaction.atomic():
            pais = form.cleaned_data.get("pais")
            instances = formset.save()
            for item in instances:
                if Indice.objects.filter(escenario_id=item.id).count() == 0:
                    Indice.objects.bulk_create(
                        [Indice(distrito_id=distrito.codigo, escenario_id=item.id)
                         for distrito in Distrito.objects.filter(departamento__pais__codigo=pais.codigo)]
                    )

    def save_model(self, request, obj, form, change):
        if obj.id is None:
            obj.autor = request.user
        super(ProyectoAdmin, self).save_model(request, obj, form, change)

    def get_readonly_fields(self, request, obj=None):
        me = request.user
        if me.is_superuser or \
                (obj is not None and me.user.id == obj.autor_id):
            return super(ProyectoAdmin, self).get_readonly_fields(request, obj)
        else:
            return [i.name for i in self.model._meta.fields] + \
                   [i.name for i in self.model._meta.many_to_many]

    def get_urls(self):
        pattern_list = super(ProyectoAdmin, self).get_urls()
        info = self.model._meta.app_label, self.model._meta.model_name

        pattern_list = [
            url('^pick/$',
                self.admin_site.admin_view(self.pick_project),
                name='%s_%s_project' % info),
        ] + pattern_list
        return pattern_list

    def pick_project(self, request, *args, **kwargs):
        info = self.model._meta.app_label, self.model._meta.model_name
        if request.method == "GET":
            context = dict(form=ProyectoForm(), title="Eliga un proyecto")
            return TemplateResponse(request, "admin/pick_project.html", context)
        else:
            rev = reverse('admin:%s_%s_changelist' % info) + "?" + request.GET.urlencode()
            if "reverse" in request.GET:
                rev = unquote(request.GET.get("reverse"))
            form = ProyectoForm(request.POST)
            if form.is_valid():
                request.session["proyecto_id"] = form.cleaned_data['proyecto']
                obj = self.get_object(request, form.cleaned_data['proyecto'])
                messages.add_message(request, messages.INFO, "Proyecto elegido {}".format(str(obj)))
            return HttpResponseRedirect(rev)
