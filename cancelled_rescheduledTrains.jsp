
<%@include file="publicHeaderTrains.jsp" %>
        <script>
            var apikey = "v1nyrpw4";
            function cancelledTrains()
            {
                var date1 = document.getElementById("date").value + "";
                var date = date1.split('-');
                date = date[2] +"-"+ date[1] +"-"+ date[0];
                var con = "";
                var xmlHttp = new XMLHttpRequest();
                var valxml = "http://api.railwayapi.com/cancelled/date/" + date + "/apikey/" + apikey + "/";
                xmlHttp.open("GET", valxml, true);
                xmlHttp.onreadystatechange = function ()
                {

                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
                    {
                        var obj = JSON.parse(xmlHttp.responseText);
                        var trains = obj.trains;
                        if (trains == "")
                        {
                            con += "<br><br><h3 style='color:red'>No Trains Cancelled</h3><br><br>";
                        } 
                        else
                        {
                            con += "<br><br><table class='table-responsive table-bordered'><tr><th>Number</th><th>Name</th><th>Source</th><th>Destination</th></tr>";
                            for (var i = 0; i < trains.length; i++)
                            {
                                con += "<tr><td>" + trains[i].train.number + "</td>";
                                con += "<td>" + trains[i].train.name + "</td>";
                                con += "<td>" + trains[i].source.name + "</td>";
                                con += "<td>" + trains[i].dest.name + "</td></tr>";
                            }
                            con += "</table><br><br>";
                        }
                        document.getElementById("d1").innerHTML = con;
                    }
                };
                xmlHttp.send();
            }
            function rescheduledTrains()
            {
                var date1 = document.getElementById("date").value + "";
                var date = date1.split('-');
                date = date[2] +"-"+ date[1] +"-"+ date[0];
                var con = "";
                var xmlHttp = new XMLHttpRequest();
                var valxml = "http://api.railwayapi.com/rescheduled/date/"+date+"/apikey/"+apikey+"/";
                xmlHttp.open("GET", valxml, true);
                xmlHttp.onreadystatechange = function ()
                {

                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
                    {
                        var obj = JSON.parse(xmlHttp.responseText);
                        var trains = obj.trains;
                        if (trains == "")
                        {
                            con += "<br><br><h3 style='color:red'>No Trains Rescheduled</h3><br><br>";
                        } 
                        else
                        {
                            con += "<br><br><table class='table-responsive table-bordered'><tr><th>Number</th><th>Name</th><th>Source</th><th>Destination</th><th>Rescheduled Date </th><th>Rescheduled Time </th><th>Time Difference </th></tr>";
                            for (var i = 0; i < trains.length; i++)
                            {
                                con += "<tr><td>" + trains[i].number + "</td>";
                                con += "<td>" + trains[i].name + "</td>";
                                con += "<td>" + trains[i].from.name + "</td>";
                                con += "<td>" + trains[i].to.name + "</td>";
                                con += "<td>" + trains[i].rescheduled_date + "</td>";
                                con += "<td>" + trains[i].rescheduled_time + "</td>";
                                con += "<td>" + trains[i].time_diff + "</td></tr>";
                            }
                            con += "</table><br><br><br>";
                        }
                        document.getElementById("d1").innerHTML = con;
                    }
                };
                xmlHttp.send();
            }
        </script>
    </head>
    <body>
    <center>
        <br>
        <br>
        <br>
        <input type="button" class="btn btn-primary btn-group-sm" value="Cancelled Trains" onclick="cancelledTrains()">&nbsp;&nbsp;
        <input type="button" class="btn btn-primary btn-group-sm" value="Rescheduled Trains" onclick="rescheduledTrains()">&nbsp;&nbsp;
        <input type="date" class="bg-info" id="date">
        <br/><br/>
        <br/><br/>
        <div id="d1"></div>
    </center>
    <%@include file="publicFooter.jsp" %>
</body>
</html>
