from .base import *

DEBUG = True
TEMPLATE_DEBUG = DEBUG

DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'geohealth',
        'USER': 'geohealth',
        'PASSWORD': 'geoh4dmin',
        'HOST': 'localhost',
        'PORT': '5432',
    },
}

INTERNAL_IPS = ('127.0.0.1',)
#INSTALLED_APPS += ('debug_toolbar',)

#MIDDLEWARE_CLASSES += (
#    'debug_toolbar.middleware.DebugToolbarMiddleware',
#)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['console'],
            'propagate': True,
            'level': 'DEBUG',
        },
    },
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': 'unique-geohealth',
    }
}
