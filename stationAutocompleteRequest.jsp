
<%@include file="publicHeaderTrains.jsp" %>
<script>
    var apikey = "v1nyrpw4";
    function go(bal)
    {
        var pname = bal.value;
        var xmlHttp = new XMLHttpRequest();
        var valxml = "http://api.railwayapi.com/suggest_station/name/" + pname + "/apikey/" + apikey + "/";
        if (pname == "")
        {
            document.getElementById(bal.id).innerHTML = "";
        } else
        {
            xmlHttp.open("GET", valxml, true);
            xmlHttp.onreadystatechange = function ()
            {
                if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
                {
                    if (bal.id === "source")
                    {
                        var obj = JSON.parse(xmlHttp.responseText);

                        var station = obj.station;
                        var con = "";

                        for (var i = 0; i < station.length; i++) {

                            con += "<span onclick=go3(this,id) style='cursor : pointer' id='1'>" + station[i].fullname + "," + station[i].code + "</span> <br/>";
                        }
                        document.getElementById("d1").innerHTML = con;
                    } else
                    {
                        var obj = JSON.parse(xmlHttp.responseText);
                        var station = obj.station;
                        var con = "";
                        for (var i = 0; i < station.length; i++)
                        {

                            con += "<span onclick=go3(this,id) style='cursor : pointer' id='2'>" + station[i].fullname + "," + station[i].code + "</span><br/>";

                        }
                        document.getElementById("d2").innerHTML = con;
                    }

                }
            };
            xmlHttp.send();
        }
    }
    function go3(obj, id)
    {
        var value = obj.innerHTML;
        if (id == 1)
        {
            document.getElementById("source").value = value;
            document.getElementById("d1").innerHTML = "";
        } else if (id == 2)
        {
            document.getElementById("destination").value = value;
            document.getElementById("d2").innerHTML = "";
        }
    }
    function createTable()
    {
        document.getElementById("d4").style.display = "block";
        document.getElementById("d4").innerHTML = "<img src='images/loader.gif' height='200px'>";

        var date = document.getElementById("date").value + "";
        var result = date.split('-');
        var xmlHttp = new XMLHttpRequest();
        var src = document.getElementById("source").value + "";
        var result1 = src.split(',');
        var dest = document.getElementById("destination").value + "";
        var result2 = dest.split(',');
        var valxml = "http://api.railwayapi.com/between/source/" + result1[1] + "/dest/" + result2[1] + "/date/" + result[2] + "-" + result[1] + "/apikey/" + apikey + "/";
        xmlHttp.open("GET", valxml, true);
        xmlHttp.onreadystatechange = function ()
        {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
            {
                var text = xmlHttp.responseText;
                if (text !== "")
                {
                    textArray = text.split('-');
                    text = "";
                    for (var m = 0; m < textArray.length; m++)
                    {
                        text = text + textArray[m];
                    }
                    var obj = JSON.parse(text);
                    var train = obj.train;
                    var con = "";
                    if (train == "")
                    {
                        con += "<h5 style='color:red'><br>Server did not Respond,Please Check your Connection or Details entered</h5>";
                    } else
                    {
                        con += "<br><br> <table border=1px style=padding: 5px ; background-color: 'beige'><tr><th>Train No+</th><th>Train Name</th><th>Departure Time</th><th>Arrival Time</th><th>Class Availability</th><th>Runs</th><th colspan='2'></th><th colspan='2'></th></tr>";
                        for (var i = 0; i < train.length; i++)
                        {
                            var classes = train[i].classes;
                            var days = train[i].days;

                            con += "<tr><td>" + train[i].number + "</td><td>" + train[i].name + "</td><td>" + train[i].src_departure_time +
                                    "</td><td>" + train[i].dest_arrival_time + "</td><td>";
                            var number = train[i].number;
                            var name = train[i].name;
                            var cls = new Array();
                            var runday = new Array();
                            var val = 0;
                            for (var j = 0; j < classes.length; j++)
                            {

                                var available = train[i].classes[j].available;
                                if (available == "N")
                                {
                                    con += "<span style='color:red'>" + train[i].classes[j].classcode + "</span><br>";
                                } else
                                {
                                    con += "<span style='color:green'>" + train[i].classes[j].classcode + "</span><br>";
                                    cls[val] = train[i].classes[j].classcode;
                                    val++;
                                }
                            }
                            con += "</td>";
                            con += "<td>";
                            var val = 0;
                            for (var k = 0; k < days.length; k++)
                            {
                                var runs = train[i].days[k].runs;

                                if (runs == "N")
                                {
                                    con += "<span style='color: red'>" + train[i].days[k].daycode + "</span></br>"
                                } else
                                {
                                    con += "<span style='color:green'>" + train[i].days[k].daycode + "</span></br>"
                                    runday[val] = train[i].days[k].daycode;
                                    val++;
                                }
                            }
                            con += "</td>"
                            con += "<td><input type='button' class='btn btn btn-primary btn-group-sm' onclick=\"showDetails('" + number + "','" + name + "','" + cls + "','" + runday + "')\" value='Check Seat and Fare'></td>";
                            con += "<td><input type='button' class='btn btn-primary btn-group-sm' value='View Routes' onclick=\"showRoute('" + number + "','" + src + "','" + result2[0] + "')\"></td></tr>";
                        }
                        con += "</table>";
//                document.getElementById("d1").innerHTML = con;
                    }
                } else
                {
                    con += "<h5 style='color:red'><br>Server did not Respond,Please Check your Connection or Details entered</h5>";
                }
                document.getElementById("d4").innerHTML = con;
            }
        };
        xmlHttp.send();
    }
    function showDetails(number, name, cls, runday)
    {
        cls = cls + "";
        runday = runday + "";
        var clscode = cls.split(',');
        runday = runday.split(',')
        var con = "";
        con += "<table><tr><td> Train Number</td><td id='no'>" + number + "</td></tr><tr><td>Train Name</td><td id='name'>" + name + "</td></tr>";
        con += "<tr><td>Available Classes</td><td><select id='cls'>";
        for (var i = 0; i < clscode.length; i++)
        {
            con += "<option>" + clscode[i] + "</option>";
        }
        con += "</select></td></tr>";
        con += "<tr><td>Available Days</td><td><select id='runday'>";
        for (var i = 0; i < runday.length; i++)
        {
            con += "<option>" + runday[i] + "</option>";
        }
        con += "</select></td></tr>";
        con += "<tr><td>Quota</td><td><select id='quota'><option value='GN'>General</option><option value='LD'>Ladies Quota</option><option value='HO'>Head Quaters\\High official Quota</option><option value='PH'>Parliament house Quota</option><option value=''FT>Foreign Tourist Quota</option>";
        con += "<option value='DP'>Duty Pass Quota</option><option value='TQ'>Tatkal Quota</option><option value='PT'>Premium Tatkal Quota</option><option value='SS'>Female(above 45 Year)/Senior Citizen/Travelling alone</option><option value='HP'>Physically Handicapped Quota</option>";
        con += "<option value='RE'>Railway Employee Staff on Duty for the train</option><option value='GNRS'>General Quota Road Side</option><option value='OS'>Out Station</option><option value='PQ'>Pooled Quota</option><option value='RC(RAC)'>Reservation Against Cancellation</option>";
        con += "<option value='RS'>Road Side</option><option value='YU'>Yuva</option><option value='LB'>Lower Berth</option></select></td></tr>";
        con += "<tr><td>Date</td><td><input type='date' id='date2'></td></tr>"
        con += "<tr><td>Age</td><td><input type='number' id='age'></td></tr></table>";
        con += "<div id='d3'></div>";
        document.getElementById("mb").innerHTML = con;
        $('#myModal1').modal('show');
    }
    function checkFare()
    {
        var number = document.getElementById("no").innerHTML;
        var name = document.getElementById("name").value;
        var cls = document.getElementById("cls").value;
        var runday = document.getElementById("runday").value;
        var date = document.getElementById("date2").value;
        var quota = document.getElementById("quota").value;
        var age = document.getElementById("age").value;
        var src = document.getElementById("source").value + "";
        var dest = document.getElementById("destination").value + "";
        var result1 = src.split(',');
        var result2 = dest.split(',');
        var result = date.split('-');
        var xmlHttp = new XMLHttpRequest();
        date = result[2] + "-" + result[1] + "-" + result[0];
        var valxml = "http://api.railwayapi.com/fare/train/" + number + "/source/" + result1[1] + "/dest/" + result2[1] + "/age/" + age + "/quota/" + quota + "/doj/" + date + "/apikey/" + apikey + "/";
        xmlHttp.open("GET", valxml, true)
        var con = "";
        xmlHttp.onreadystatechange = function ()
        {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
            {
                var obj = JSON.parse(xmlHttp.responseText);
                alert(xmlHttp.responseText);
                var fare = obj.fare;
                for (var i = 0; i < fare.length; i++)
                {
                    con += "<span style='color:green'>Name : &nbsp;" + fare[i].name + "&nbsp;Fare : " + fare[i].fare + "</span>";
                    break;
                }
                document.getElementById("d3").innerHTML = con;
            }
        };
        xmlHttp.send();
    }
    function checkSeatAvailability()
    {
        var number = document.getElementById("no").innerHTML;
        var cls = document.getElementById("cls").value;
        var runday = document.getElementById("runday").value;
        var date = document.getElementById("date2").value;
        var quota = document.getElementById("quota").value;
        var age = document.getElementById("age").value;
        var src = document.getElementById("source").value + "";
        var dest = document.getElementById("destination").value + "";
        var result1 = src.split(',');
        var result2 = dest.split(',');
        var date1 = date.split('-');
        var xmlHttp = new XMLHttpRequest();
        date = date1[2] + "-" + date1[1] + "-" + date1[0];

        var valxml = "http://api.railwayapi.com/check_seat/train/" + number + "/source/" + result1[1] + "/dest/" + result2[1] + "/date/" + date + "/class/" + cls + "/quota/" + quota + "/apikey/" + apikey + "/";
        xmlHttp.open("GET", valxml, true);
        var con = "";
        alert(xmlHttp.responseText);
        xmlHttp.onreadystatechange = function ()
        {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
            {
                var obj = JSON.parse(xmlHttp.responseText);
                var availability = obj.availability;
                date1 = parseInt(date1[2]);
                for (var i = 0; i < availability.length; i++)
                {
                    var resdate = availability[i].date;
                    resdate = resdate.split('-');
                    resdate = parseInt(resdate[0]);
                    if (resdate == date1)
                    {
                        con += "<span style='color:green'> Date :" + availability[i].date + " Status :" + availability[i].status + " Train Code : " + availability[i].code + "</span>";
                        break;
                    }
                }
                document.getElementById("d3").innerHTML = con;
            }
        };
        xmlHttp.send();
    }
    function showRoute(tnumber, src, dest)
    {
        var number = tnumber;
        var source = src;
        var destination = dest;
        window.location = "viewRoute.jsp?number=" + number + "&source=" + source + "&destination=" + destination;
    }
</script>
</head>
<body>
    <br/>
    <br/>
    <h3 style="color: black">Enter Details</h3>
    <br/><br/>
    <table>
        <tr>
            <td><span style="color: black ">Source : </span></td>
            <td><input type="text" class="bg-info" id="source" style="color: black" size="35" autofocus onkeyup="go(this)"></td>
            <td><span style="color: black">Destination : </span></td>
            <td><input type="text" class="bg-info" id="destination" style="color: black" size="35" onkeyup="go(this)"></td>
            <td><span style="color: black"> Date : </span></td>
            <td><input type="date" id="date" class="bg-info"></td>
            <td><input type="button" class="btn btn-primary btn-group-sm" value="View Details" onclick="createTable()"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <div id="d1">

                </div>
            </td>
            <td ></td>
            <td>
                <div id="d2">

                </div>
            </td>
        </tr>
</table>
    <div id="d4">
        
    </div>
<br/>
<br/>
<br/>
<br/>
<div class="modal fade" id="myModal1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="bg-primary">Enter Details</h3>
            </div>
            <div class="modal-body" id="mb">

            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-success btn-sm" value="Check Seat Availability" onclick="checkSeatAvailability()">
                <input type="button" class="btn btn-success btn-sm" value="Check Fare" onclick="checkFare()">
            </div>
        </div>
    </div>
</div>
<br>
<br>
<br>
<%@include file="publicFooter.jsp" %>
</body>
</html>
