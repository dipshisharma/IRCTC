


<%@include file="publicHeaderTrains.jsp" %> 
        <%
            String number = request.getParameter("number");
            String source = request.getParameter("source");
            source=source.replace(',',' ');
            String destination = request.getParameter("destination");
            destination = destination.substring(0, 1) + destination.substring(1).toLowerCase();
        %>
        <script>
            var apikey="v1nyrpw4";
            var xmlHttp = new XMLHttpRequest();
            var valxml = "http://api.railwayapi.com/route/train/" +<%= number%> + "/apikey/"+apikey+"/";
            xmlHttp.open("GET", valxml, true);
            var con = "";
            xmlHttp.onreadystatechange = function ()
            {
                if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
                {
                    var obj = JSON.parse(xmlHttp.responseText);
                    con += "<br><br><table class='table-bordered table-responsive'>";
                    con += "<tr><td colspan='2'><input type='button'  class='btn btn-group-sm btn-primary' value='View Map' onclick='viewMaps(<%= number%>)'></td></tr>";
                    con += "<tr><th >Train Number</th><th><%= number%></th></tr>";
                    for (var i = 0; i < obj.route.length; i++)
                    {
                        con += "<tr><th>Station Number :</th><th>" + (i + 1) + "</th></tr>";
                        con += "<tr><td>Station Name</td><td>" + obj.route[i].fullname + "</td></tr>";
                        con += "<tr><td>Arrival Time</td><td>" + obj.route[i].scharr + "</td></tr>";
                        con += "<tr><td>Departure Time</td><td>" + obj.route[i].schdep + "</td></tr>";
                        con += "<tr><td>State</td><td>" + obj.route[i].state + "</td></tr>";
                        con += "<tr><td>Halt</td><td>" + obj.route[i].halt + "</td></tr>";
                        var dest = obj.route[i].state + "";
                        dest = dest.split(' ');
                        var destination = "<%=destination%>";
                        if (destination == dest[0])
                        {
                            break;
                        }
                    }
                    con += "</table>";
                    document.getElementById("d1").innerHTML = con;
                }
            };
            xmlHttp.send();
            function viewMaps(number)
            {
                var number = number;
                window.location = "viewMap.jsp?number="+number;
            }
        </script>
    </head>
    <body>
        <div id="d1">

        </div>
        <%@include file="publicFooter.jsp" %>
    </body>
</html>
