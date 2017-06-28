import os
import sys

from django.core.management.base import BaseCommand, CommandError
from optparse import make_option
from django.conf import settings
from django.contrib.gis.utils import LayerMapping


class Command(BaseCommand):
    args = '<shape_file fqdn_class ...>'
    help = "Imports the shape file dir"
    verbose = False
    encoding = None
    option_list = BaseCommand.option_list + (
        make_option('--nostrict',
                    action='store_true',
                    dest='strict',
                    default=True,
                    help='Commit on success'),
        make_option('-e', '--encoding', action='store', dest='encoding', default='UTF-8',
                    type='choice', choices=['UTF-8', 'ISO-8859-1'],
                    help='Encoding; UTF-8, ISO-8859-1'))

    def handle(self, *args, **options):
        if options["verbosity"] == '2':
            self.verbose = True
        self.encoding = options["encoding"]
        shapepath, fqdn_class = args
        dot = fqdn_class.rindex(".")
        module_name, clazz_name = fqdn_class[:dot], fqdn_class[dot+1:]
        clazz = getattr(sys.modules[module_name], clazz_name)
        self.save_shape(shapepath, clazz, options["strict"])


    def get_file(self, shpname):
        for path, dirname, files in os.walk(settings.SHAPE_DIR):
            for f in files:
                if f == shpname:
                    return os.path.join(path, f)

    def save_shape(self, shpname, mclass, st=True):
        shpfile = self.get_file(shpname)
        try:
            lm = LayerMapping(mclass, shpfile, getattr(mclass, "mapping", {}),
                              transform=False, encoding=self.encoding)

            lm.save(strict=st, verbose=self.verbose)
        except Exception, e:
            raise CommandError("Failed to import file %s \n %s" % (shpfile, e))

