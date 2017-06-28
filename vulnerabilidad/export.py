from import_export import fields, resources
from vulnerabilidad.models import Indice, Salud


class IndiceResource(resources.ModelResource):

    class Meta:
        model = Indice
        fields = ("distrito__nombre", "iec", "ivg", "ivm")

class SaludResource(resources.ModelResource):

    class Meta:
        model = Salud
        fields = ("distrito__nombre", "dengue", "lepto", "diarrea", "ivs")