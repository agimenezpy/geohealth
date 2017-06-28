"""
Django settings for rastreoweb project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
from django.conf.global_settings import TEMPLATE_CONTEXT_PROCESSORS, TEMPLATE_LOADERS

BASE_DIR = os.path.dirname(os.path.dirname(__file__))
PROJECT_DIR = os.path.dirname(BASE_DIR)
MEDIA_ROOT = os.path.join(PROJECT_DIR, "public", "media")
STATIC_ROOT = os.path.join(PROJECT_DIR, "public", "static")


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '+|hN+=#=sQ!f#5X(v^6<$w8lt,9cHR]sb<Z7_+Fi_rX5O^{v@8'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'geohealth.apps.GeoHealtConfig',
    'django.contrib.admin',
    'django.contrib.gis',
    'import_export',
    'suitlocale',
    'geohealth.apps.GeoAppConfig',
    'geohealth.apps.ClimaAppConfig',
    'geohealth.apps.EstudioAppConfig',
    'geohealth.apps.VulnerabilidadAppConfig',
    'geohealth.utils'
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS += (
    'django.core.context_processors.request',
)

#TEMPLATE_LOADERS += (
#    'geohealth.utils.loader.Loader',
#)

ROOT_URLCONF = 'geohealth.urls'

WSGI_APPLICATION = 'geohealth.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#     }
# }

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'es-py'

TIME_ZONE = 'America/Asuncion'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, "static"),
)

TEMPLATE_DIRS = (
    os.path.join(PROJECT_DIR, 'templates'),
)

SESSION_ENGINE = 'django.contrib.sessions.backends.signed_cookies'
SESSION_SERIALIZER = 'django.contrib.sessions.serializers.JSONSerializer'
SESSION_COOKIE_NAME = 'geohealth_sessionid'

LL_ROOT = "http://cdn.leafletjs.com/"
JQUERY_JS = "http://code.jquery.com/jquery-1.7.2.min.js"
LL_CSS = LL_ROOT + "leaflet-0.7.2/leaflet.css"
LL_JS = LL_ROOT + "leaflet-0.7.2/leaflet.js"
OWS_URL = "http://geo.pykoder.com/ows/"
MAX_FEATURES = 10000
CENTER_LL = (-56, -23)
MAP_VIEWER = "google-maps"

SHAPE_DIR = r"C:\Users\agimenez\Desktop\WebProjects\BID\vulnerabilidad_project\SHP"
