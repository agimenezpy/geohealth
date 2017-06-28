from __future__ import print_function
import pyExcelerator as pyCel
import fiona
from fiona.crs import from_epsg
from json import loads
from django.contrib.gis.gdal import DataSource
from django.core.management.base import BaseCommand, CommandError
from os import walk, path, getenv
from django.conf import settings
from optparse import make_option


class Command(BaseCommand):
    args = "<excel_file> <sheet>"
    help = "Create a ESRI shapefile from EXCEL file"
    verbose = False
    opened_files = {}
    index = {}
    names = ["NOMBRE", "DESLOC", "DESCLOC", "DESCLOCA", "DISTRITO", "DEPARTAMEN"]

    option_list = BaseCommand.option_list + (
        make_option('--check',
            action='store_true',
            dest='check',
            default=False,
            help='Check'),
        make_option('--dump',
            action='store_true',
            dest='dump',
            default=False,
            help='Dump'))

    def get_file(self, shpname):
        for pth, dirname, files in walk(settings.SHAPE_DIR):
            for f in files:
                if f == shpname:
                    return path.join(pth, f)

    def get_matrix(self, filename, sheet):
        for sheet_name, values in pyCel.parse_xls(filename, 'cp1252'):
                if sheet_name != sheet:
                    continue
                matrix = [[]]
                for row_idx, col_idx in sorted(values.keys()):
                    v = values[(row_idx, col_idx)]
                    if isinstance(v, unicode):
                        v = v.encode('latin-1', 'backslashreplace')
                    else:
                        v = str(v)
                    last_row, last_col = len(matrix) - 1, len(matrix[-1])
                    while last_row < row_idx:
                        matrix.extend([[]])
                        last_row = len(matrix)

                    while last_col < col_idx:
                        matrix[-1].extend([''])
                        last_col = len(matrix[-1])

                    matrix[-1].extend([v])
                return matrix

    def get_shape(self, filename, fid):
        ds = self.opened_files.get(filename, False)
        if not ds:
            if filename[0] != "~":
                filename = self.get_file(path.basename(filename))
            ds = DataSource(filename.replace("~", getenv("HOME")), "r")
            self.opened_files[filename] = ds
        return ds[0][int(float(fid))].geom.geos

    def get_field(self, filename, fid):
        ds = self.opened_files.get(filename, False)
        if not ds:
            if filename[0] != "~":
                filename = self.get_file(path.basename(filename))
            ds = DataSource(filename.replace("~", getenv("HOME")), "r")
            self.opened_files[filename] = ds
        idx = -1
        fields = ds[0].fields
        for name in self.names:
            if fields.count(name) > 0:
                idx = fields.index(name)
                break
        return ds[0][int(float(fid))].get(idx).encode('latin-1', 'backslashreplace')

    def get_index(self, filename, name):
        ds = self.opened_files.get(filename, False)
        if not ds:
            if filename[0] != "~":
                filename = self.get_file(path.basename(filename))
            ds = DataSource(filename.replace("~", getenv("HOME")), "r")
            self.opened_files[filename] = ds
        if len(self.index) == 0:
            idx = -1
            fields = ds[0].fields
            for n in self.names:
                if fields.count(n) > 0:
                    idx = fields.index(n)
                    break
            self.index = dict([(feat.get(idx).encode('latin-1', 'backslashreplace'), fid)
                               for fid, feat in enumerate(ds[0])])
        return self.index[name]

    def handle(self, *args, **options):
        self.verbose = options["verbosity"] == 2
        filename, sheet = args
        if options["check"]:
            self.check_file(filename, sheet)
        elif options["dump"]:
            self.dump_file(filename, sheet)
        else:
            self.process_file(filename, sheet)

    def process_file(self, filename, sheet):
        filebase, filepath = path.basename(filename), path.dirname(filename)
        if path.exists(filename):
            matrix = self.get_matrix(filename, sheet)
            schema = {'geometry': "Polygon",
                      'properties': []}
            col_index = {}
            for index, field in enumerate(matrix[0]):
                fielddef = field.split("|")
                if len(fielddef) > 1:
                    fieldname, typ = fielddef
                    schema["properties"].append((fieldname, typ))
                    col_index[fieldname] = index
                else:
                    col_index[fielddef[0]] = index
            schema["properties"].append(('X', "float:15.2"))
            schema["properties"].append(('Y', "float:15.2"))

            sink = fiona.open(path.join(filepath, "ETL_shp", sheet + ".shp"),
                              "w", driver="ESRI Shapefile", schema=schema,
                              crs=from_epsg(32721),
                              encoding="UTF-8")
            for row in matrix[1:]:
                geom = self.get_shape(row[col_index["PATH"]], row[col_index["FID"]])
                props = dict([(fieldname, unicode(row[col_index[fieldname]], "latin-1"))
                            for fieldname, typ in schema["properties"]
                            if col_index.has_key(fieldname)])
                center = geom.centroid
                props['X'] = center.x
                props['Y'] = center.y
                record = {'id': -1,
                          'properties': props,
                          'geometry': loads(geom.geojson)}
                sink.write(record)
            print(" %d Registro(s) Procesado(s) " % (len(matrix) - 1))
            sink.close()
            #for source in self.opened_files.itervalues():
            #    source.close()
        else:
            raise CommandError("%s does not exists" % filename)

    def check_file(self, filename, sheet):
        if path.exists(filename):
            matrix = self.get_matrix(filename, sheet)
            col_index = {}
            for index, field in enumerate(matrix[0]):
                fielddef = field.split("|")
                col_index[fielddef[0]] = index

            for row in matrix[1:]:
                name = self.get_field(row[col_index["PATH"]], row[col_index["FID"]])
                curname = row[col_index["NOMBRE"]]
                if name != curname:
                    print("ERROR: %s\t%s\t%s : %s" % (row[col_index["FID"]],
                                                   curname,
                                                   name,
                                                  row[col_index["PATH"]]))
        else:
            raise CommandError("%s does not exists" % filename)

    def dump_file(self, filename, sheet):
        if path.exists(filename):
            matrix = self.get_matrix(filename, sheet)
            col_index = {}
            for index, field in enumerate(matrix[0]):
                fielddef = field.split("|")
                col_index[fielddef[0]] = index

            for row in matrix[1:]:
                rfid = self.get_index(row[col_index["PATH"]], row[col_index["NOMBRE"]])
                curname = row[col_index["NOMBRE"]]
                print("%s: %s\t%d" % (row[col_index["FID"]], curname, rfid))
        else:
            raise CommandError("%s does not exists" % filename)