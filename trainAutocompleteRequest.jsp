

<%@include file="publicHeaderTrains.jsp" %>
<title>Live Tracking </title>
<script>
    var apikey = "xe7641l6";
    function go(bal)
    {
        var pname = bal.value;
        var xmlHttp = new XMLHttpRequest();
        var valxml = "http://api.railwayapi.com/suggest_train/trains/" + pname + "/apikey/" + apikey + "/";
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
                    var obj = JSON.parse(xmlHttp.responseText);


                    var train = obj.trains;
                    var con = "";

                    for (var i = 0; i < train.length; i++)
                    {

                        con += "<span onclick=go3(this,id) style='cursor : pointer' >" + train[i].number + "," + train[i].name + "</span> <br/>";
                    }
                    document.getElementById("d1").innerHTML = con;


                }
            };
            xmlHttp.send();
        }
    }
    function go3(obj, id)
    {
        var value = obj.innerHTML;
        document.getElementById("tnumber").value = value;
        document.getElementById("d1").innerHTML = "";
    }
    function createTable()
    {
        document.getElementById("d1").style.display = "block";
        document.getElementById("d1").innerHTML = "<img src='images/loader.gif' height='100px'>";

        var tnumber = document.getElementById("tnumber").value;
        tnumber = tnumber.split(',');
        tnumber = tnumber[0];
        var con = "";
        var date = new Date();
        var dd = date.getDate();
        var mm = date.getMonth() + 1; //January is 0!
        var yyyy = date.getFullYear();

        if (dd < 10) {
            dd = '0' + dd
        }

        if (mm < 10) {
            mm = '0' + mm
        }

        date = yyyy + mm + dd;
        var xmlHttp = new XMLHttpRequest();
        var valxml = "http://api.railwayapi.com/live/train/" + tnumber + "/doj/" + date + "/apikey/" + apikey + "/";
        xmlHttp.open("GET", valxml, true);
        xmlHttp.onreadystatechange = function ()
        {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
            {
//                alert(xmlHttp.responseText);
                if (xmlHttp.responseText == "")
                {
                    con += "<br><br><h4 style='color:black '>Please Check The Details Entered</h4> ";
                } else
                {
                    var obj = JSON.parse(xmlHttp.responseText);
                    if (obj.error == "Train is not scheduled to run on this day")
                    {
                        con += "<span style='color:black'>Train is not scheduled to run on this day</span>";
                    } else if (obj.response_code == 204)
                    {
                        con += "<h4 style='color:black'>Please Check the Details Entered.</span>"
                    } else
                    {
                        var route = obj.route;
                        con += "<br><br><br><table style='color: black' class='table-bordered table-responsive'><tr><th>Station Name</th><th>Has Arrived </th><th>Has Departed </th><th>Late By </th></tr>";
                        for (var i = 0; i < route.length; i++)
                        {
                            con += "<tr><td>" + route[i].station_.name + "</td><td>" + route[i].has_arrived + "</td><td>" + route[i].has_departed + "</td><td>" + route[i].latemin + " minutes</td></tr>";
                        }
                        con += "</table>";
                    }
                }
                document.getElementById("d1").innerHTML = con;
            }
        };
        xmlHttp.send();
    }
</script>
</head>
<body>
    <br>
    <br>
    <br>
<center>
    <table>
        <tr>
            <td><span ><b>Train Number :</b></span></td>
            <td><input type="text" id="tnumber" class="bg-info" size="40" autofocus onkeyup="go(this)"></td>&nbsp;&nbsp;
            <td><input type="button" class="btn btn-primary btn-group-sm" value="View Live Status" onclick="createTable()"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <div id="d1">

                </div>
            </td>
        </tr>
    </table>
</center>
<br>
<br>
<br>
<%@include file="publicFooter.jsp" %>
</body>
</html>
