
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%
        String ac = request.getParameter("ac");
        String[] nac=ac.split("-");
        ac=nac[0];
        String fn = request.getParameter("fn");
        String date = request.getParameter("date");

    %>
    <body>
        <div id="map"></div>
        <script>
            var map;

            function initMap()
            {
                map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 5,
                    center: {lat: 20.5937, lng: 78.9629},
                    mapTypeId: 'satellite'


                }
                );
                checkmap();




            }
            function checkmap()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var buffer = xml.responseText;
                        var json = JSON.parse(buffer);

                        var position = json.flightTracks[0].positions;
//                        alert(position.length);
                        var array = new Array(position.length);

                        for (var i = 0; i < position.length; i++) {

                            if (position[i].lat === 0.0)
                            {

                                array[i] = array[i - 1];
                            } else
                            {
                                alert(position[i].lat + ":" + position[i].lon);
                                array[i] = new google.maps.LatLng(parseFloat(position[i].lat), parseFloat(position[i].lon));
                            }


                        }

                        var flightPath = new google.maps.Polyline({
                            path: array,
                            geodesic: true,
                            strokeColor: '#FF0000',
                            strokeOpacity: 1.0,
                            strokeWeight: 2
                        });
                        alert(array.length);
                        var iconn = {
                            url: "images/plane.png",
                            scaledSize: new google.maps.Size(50, 50),
                            origin: new google.maps.Point(0, 0),
                            anchor: new google.maps.Point(0, 0)
                        };
                        flightPath.setMap(map);
                        for (var i = 0; i < array.length; i++)
                        {
                            //                            if (routes[i].code == src || routes[i].code == dst)
                            //                            {
                            //                                var marker = new google.maps.Marker({position: array[i], animation: google.maps.Animation.BOUNCE, label: routes[i].code, icon: iconn});
                            //
                            //                                marker.setMap(map);
                            //
                            //                            }
                            //                            else if (i == 0 || i == array.length - 1)
                            //                            {
                            //                                var marker = new google.maps.Marker({position: array[i]});
                            //
                            //                                marker.setMap(map);
                            //
                            //                            }

                        }

                        var marker = new google.maps.Marker({position: array[1], icon: iconn});

                        marker.setMap(map);

                        //                            marker.setMap(map);
                        //  drawpolyline(array);



                    }

                };
                var ac = '<%=ac%>';
                var fn = '<%=fn%>';
                var date = '<%=date%>';
                xml.open("GET", "trackflights1.jsp?ac=" + ac + "&fn=" + fn + "&date=" + date, true);
                xml.send();
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9o7asv3TyRKef_DsBN5grEvaBw12V0IQ&callback=initMap">
        </script>

    </body>

</html>
