
<%@include file="publicHeaderTrains.jsp" %>
<script>
    var apikey = "xe7641l6";
    function pnrStatus()
    {
        document.getElementById("d1").style.display = "block";
        document.getElementById("d1").innerHTML = "<img src='images/loader.gif' height='200px'>";

        var con = "";
        var pnr = document.getElementById("tf1").value;
        var xmlHttp = new XMLHttpRequest();
        var valxml = "http://api.railwayapi.com/pnr_status/pnr/" + pnr + "/apikey/" + apikey + "/";
        xmlHttp.open("GET", valxml, true);
        xmlHttp.onreadystatechange = function ()
        {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
            {
                var obj = JSON.parse(xmlHttp.responseText);
                if (obj.error == false)
                {
                    con += "<br><br><br><center><table style=' color: black' class='table-responsive table-bordered'><tr><th>Name</th><th>Number</th><th>Source</th><th>Destination</th><th>Reservation Upto</th><th>Total Passengers</th></tr>";
                    con += "<tr><td>" + obj.train_name + "</td><td>" + obj.train_num + "</td><td>" + obj.from_station.name + "</td><td>" + obj.to_station.name + "</td><td>" + obj.reservation_upto.code + " , " + obj.reservation_upto.name + "</td><td>" + obj.total_passengers + "</td></tr>";
                    con += "<tr><td colspan='6'><input type='button' class='btn  btn-primary' value='View Passenger Details' onclick='getPassengers()'></td></tr></table></center>";
                }
                else if(obj=="")
                {
                    con+="<span style='color:red'>Server did not respond,please check the details entered or try again later</span>";
                }
                else
                {
                    con+="<span style='color:red'>Server did not Respond,Please check the details entered.</span>";
                }
                document.getElementById("d1").innerHTML = con;
            }
        };
        xmlHttp.send();
    }
    function getPassengers()
    {
        var con = "";
        var pnr = document.getElementById("tf1").value;
        var xmlHttp = new XMLHttpRequest();
        var valxml = "http://api.railwayapi.com/pnr_status/pnr/" + pnr + "/apikey/" + apikey + "/";
        xmlHttp.open("GET", valxml, true);
        xmlHttp.onreadystatechange = function ()
        {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
            {
                var obj = JSON.parse(xmlHttp.responseText);
                if (obj.error == false)
                {
                    con += "<br><h3>Passenger Details</h3>";
                    con += "<br><table class='table-bordered' 'table-responsive'><tr><th>S.No</th><th>Booking Status</th><th>Current Status</th><th>Coach Position</th></tr>";
                    for (var i = 0; i < obj.passengers.length; i++)
                    {
                        con += "<tr><td>" + obj.passengers[i].no + "</td><td>" + obj.passengers[i].booking_status + "</td><td>" + obj.passengers[i].current_status + "</td><td>" + obj.passengers[i].coach_position + "</td></tr>";
                    }
                    con += "</table>";
                }
                else if(obj=="")
                {
                    con+="Server did not respond,please check the details entered or try again later";
                }
                else
                {
                    con+="Server did not respond,please check the details entered or try again later";
                }
                document.getElementById("d2").innerHTML = con;
            }
        };
        xmlHttp.send();
    }
</script>
</head>
<body>
<center>
    <h1>Get PNR Status</h1><br>
    <input type="text" class="bg-info" id="tf1" placeholder="Enter PNR Number">
    <input type="button" class="btn btn-primary btn-group-sm" value="Get PNR" onclick="pnrStatus()">
    <div id="d1"></div>
    <div id="d2"></div>
</center>
<br>
<br>
<br>
<%@include file="publicFooter.jsp" %> 
</body>
</html>
