from django.conf import settings


def config(request):
    return {"LL_JS": settings.LL_JS,
            "LL_CSS": settings.LL_CSS,
            "JQUERY_JS": settings.JQUERY_JS,
            "OWS_URL": settings.OWS_URL,
            "MAX_FEATURES": settings.MAX_FEATURES,
            "MAP_VIEWER": settings.MAP_VIEWER}