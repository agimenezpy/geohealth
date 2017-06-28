from .base import *

DEBUG = False
TEMPLATE_DEBUG = DEBUG

DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'geositedb',
        'USER': 'geosite',
        'PASSWORD': 'geosite4dmin',
        'HOST': 'localhost',
        'PORT': '5432',
    },
}

ALLOWED_HOSTS = [
    ".pykoder.com",
]

POSTGIS_TEMPLATE = 'geositedb'

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'error_log': {
            'class': 'logging.FileHandler',
            'filename': "/home/agimenez/logs/user/geohealth_error.log",
        }
    },
    'loggers': {
        'django': {
            'handlers': ['error_log'],
            'propagate': True,
            'level': 'ERROR' if not DEBUG else 'DEBUG'
        }
    }
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.filebased.FileBasedCache',
        'LOCATION': '/home/agimenez/tmp/django_cache',
    }
}

SHAPE_DIR = r"/home/agimenez/webapps/vulnerabilidad/SHP"