from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models


class IndexField(models.FloatField):
    def __init__(self, *args, **kwargs):
        validators = kwargs.get("validators", [])
        validators.append(MinValueValidator(0))
        validators.append(MaxValueValidator(1))
        kwargs["validators"] = validators
        super(IndexField, self).__init__(*args, **kwargs)
