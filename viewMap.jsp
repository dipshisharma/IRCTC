

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Route on Google Map</title>
        <style>
            /* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
            #map {
                height: 100%;
            }
            /* Optional: Makes the sample page fill the window. */
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
        </style>
        <script>
            var apikey="v1nyrpw4";
            function initMap()
            {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 8,
                    center: {lat: 31.6071, lng: 74.8493}
                });
            <%
                String number = request.getParameter("number");
                String destination = request.getParameter("destination");
            %>

                var xmlhttp = new XMLHttpRequest();
                var valxml = "http://api.railwayapi.com/route/train/<%= number%>/apikey/"+apikey+"/";

                xmlhttp.open("GET", valxml, true);
                var con = "";
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                        var optext = xmlhttp.responseText;
                        var obj = JSON.parse(optext);
                        var flightPlanCoordinates = new Array();

                        for (var j = 0; j < obj.route.length; j++)
                        {
                            if (obj.route[j].lat === 0)
                            {
                                flightPlanCoordinates[j] = flightPlanCoordinates[j - 1];
                            } else
                            {
                                flightPlanCoordinates[j] = new google.maps.LatLng(parseFloat(obj.route[j].lat), parseFloat(obj.route[j].lng));
                            }
                        }
                        var marker1 = new google.maps.Marker(
                                {
                                    position: flightPlanCoordinates[0],
                                });
                        marker1.setMap(map);
                        var marker2 = new google.maps.Marker(
                                {
                                    position: flightPlanCoordinates[obj.route.length - 1]
                                });
                        marker2.setMap(map);

                        var flightPath = new google.maps.Polyline({
                            path: flightPlanCoordinates,
                            geodesic: true,
                            strokeColor: '#FF0000',
                            strokeOpacity: 1.0,
                            strokeWeight: 2
                        });

                        flightPath.setMap(map);


                    }
                };

                xmlhttp.send();
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCispkR970Y5Tdwq3b384WWfluQBonqrkM&callback=initMap">
        </script>

    </head>

    <body>
        <div id="map"></div>    
    </body>
</html>
