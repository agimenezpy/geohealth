from django.contrib import admin
from django.contrib.admin.utils import quote
from django.contrib.admin.views.main import ChangeList as BaseChangeList
from django.core.urlresolvers import reverse


class ReadOnlyPermissionsMixin(object):

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    def has_change_permission(self, request, obj=None):
        if obj is not None:
            return False
        else:
            return True


class WriteOnlyPermissionsMixin(object):

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    def has_change_permission(self, request, obj=None):
            return True

class Changelist(BaseChangeList):
    def __init__(self, *args):
        super(Changelist, self).__init__(*args)
        if getattr(self.model_admin, "title", False):
            request = args[0]
            func, args, kwargs = request.resolver_match
            print args
            if len(args) > 0:
                self.title = "{} para {}".format(self.model_admin.title,
                                                 args[0])
            else:
                self.title = self.model_admin.title

    def url_for_result(self, result):
        if getattr(self.model_admin, 'url_alias', False):
            url_alias = self.model_admin.url_alias
            pk = getattr(result, self.opts.pk.attname)
            return reverse(url_alias, args=(quote(pk),),
                           current_app=self.model_admin.admin_site.name)
        else:
            return super(Changelist, self).url_for_result(result)

class ModelAdmin(admin.ModelAdmin):
    #change_list_template = "admin/import_export/change_list_export.html"
    #formats = APP_FORMATS

    def get_changelist(self, request, **kwargs):
        return Changelist