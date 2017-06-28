$(document).ready(function ($) {
    var map = new L.Map('map-canvas', {
       center: new L.LatLng(-24, -57),
       zoom: 7,
       layers: new L.TileLayer("http://a.tiles.mapbox.com/v3/agimenez.map-eb2q2546/{z}/{x}/{y}.png"),
       maxZoom: 14
    });

    var markerIcon = L.icon({
        iconUrl: iconField,
        iconSize: [32, 37],
        iconAnchor: [16, 37],
        popupAnchor: [0, -28]
    });


    $("#map-canvas").on("loadData", function(event, data) {
        L.geoJson(data, {
            onEachFeature: function(feature, layer) {
                if (feature.properties) {
                    layer.bindPopup("<h1>Datos del beneficiario:</h1>" +
                                    "<p>Cedula: " + feature.properties.cedula + "</p>" +
                                    "<p>Nombres y Apellidos: " + feature.properties.nombre + "</p>" +
                                    "<p>Microcuenca: " + feature.properties.microcuenca + "</p>");
                }
            },
            pointToLayer: function (feature, latlng) {
                var marker = L.marker(latlng, {icon: markerIcon});
                marker.on("click", function() {
                    map.fitBounds(L.latLngBounds([latlng]));
                });
                return marker;
            }
        }).addTo(map);
    });
})
