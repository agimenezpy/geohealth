from __future__ import unicode_literals
from django.contrib.gis.gdal import DataSource
from django.core.management.base import BaseCommand, CommandError
from os import path


class Command(BaseCommand):
    args = "<shape_file>"
    help = "Export a ESRI shapefile to a CSV file"

    def handle(self, *args, **options):
        self.verbose = options["verbosity"] == 2
        for file in args:
            self.process_file(file)

    def process_file(self, file):
        filename, filepath = path.basename(file), path.dirname(file)
        if path.exists(file):
            outname, ext = path.splitext(filename)
            source = DataSource(file)
            sink = open(outname + ".csv", "w")
            for layer in source:
                sink.write("\t".join(layer.fields + ["GEOM"])+"\n")
                for feature in layer:
                    fields = map(unicode, [feature.get(field) for field in range(feature.num_fields)])
                    outstr = "\t".join(fields + [feature.geom.geos.hexewkb]) + "\n"
                    sink.write(outstr.encode("UTF-8"))
                break
            sink.close()

        else:
            raise CommandError("%s does not exists" % filename)
