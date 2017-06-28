$(document).ready(function ($) {
    var gmap = new google.maps.Map(document.getElementById('map-canvas'), {
      streetViewControl: false,
      center: new google.maps.LatLng(-24, -57),
      zoom: 7,
      mapTypeId: google.maps.MapTypeId.HYBRID,
      maxZoom: 16,
      mapTypeControl: false
    });
    var geocode = new google.maps.Geocoder();

    $("#map-canvas").on("loadData", function(event, data) {
        gmap.data.setStyle({
            icon: iconField
        });
        gmap.data.addGeoJson(data);
    });

    var infoWindow = new google.maps.InfoWindow({
        content: ""
    });

    gmap.data.addListener('click', function(event) {
        infoWindow.close();
        var pos = event.feature.getGeometry().get();
        gmap.panTo(pos)
        var bounds = new google.maps.LatLngBounds();
        bounds.extend(pos);
        gmap.fitBounds(bounds);
        infoWindow.setContent("<h1>Datos del beneficiario:</h1>" +
        "<p>Cedula: " + event.feature.getProperty("cedula") + "</p>" +
        "<p>Nombres y Apellidos: " + event.feature.getProperty("nombre") + "</p>" +
        "<p>Microcuenca: " + event.feature.getProperty("microcuenca") + "</p>");
        infoWindow.setPosition(pos);
        infoWindow.open(gmap);
    });
    var controlDiv = document.createElement("div");
    controlDiv.index = 1;
    $(controlDiv).addClass("map-control");
    $(controlDiv).html("<a href='#sp'>San Pedro</a><br>" +
                       "<a href='#sp'>Caaguazu</a>");

    $(controlDiv).find("a").click(function(e) {
        geocode.geocode({
           address: "Departamento " + e.target.innerHTML,
           region: "PY"
        },
        function (results, status) {
            if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
                gmap.fitBounds(results[0].geometry.bounds);
            }
        });
    });
    gmap.controls[google.maps.ControlPosition.TOP_RIGHT].push(controlDiv);
});