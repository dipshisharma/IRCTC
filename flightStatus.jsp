
<%@include file="publicHeaderFlights.jsp" %>
<title>Flight Status</title>
<script>
    function go(obj, id)
    {
        var aname = obj.value;
        var id = id;
        var xmlHttp = new XMLHttpRequest();
        var valxml = "flightStatus4.jsp?aname=" + aname + "&id=" + id;
        xmlHttp.open("GET", valxml, true);
        xmlHttp.onreadystatechange = function ()
        {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
            {
                if (id === 'tf1')
                {
                    document.getElementById("d1").innerHTML = xmlHttp.responseText;
                }
            }
        };
        xmlHttp.send();
    }
    function go1(airport_code, id)
    {
        var value = airport_code;
        document.getElementById(id).value = value;
        if (id == 'tf1')
        {
            document.getElementById("d1").innerHTML = "";
        }
    }
    function flightStatus1()
    {
        var place = document.getElementById("tf1").value + "";
        var xmlHttp = new XMLHttpRequest();
        var valxml = "flightStatus2.jsp?place=" + place;
        xmlHttp.open("GET", valxml, true);
        xmlHttp.onreadystatechange = function ()
        {
            var response=xmlHttp.responseText;
            if (xmlHttp.status == 200 && xmlHttp.readyState == 4)
            {
                if (response == "")
                {
                    var msg="<h3 style='color:red'>Server did not respond,Please check the Details entered.</h3>";
                } 
                else
                {
                    document.getElementById("d2").innerHTML = xmlHttp.responseText;
                }
            }
        };
        xmlHttp.send();
    }
    function flightStatus2()
    {
        var place = document.getElementById("tf1").value + "";
        var xmlHttp = new XMLHttpRequest();
        var valxml = "flightStatus3.jsp?place=" + place;
        xmlHttp.open("GET", valxml, true);
        xmlHttp.onreadystatechange = function ()
        {
            var response = xmlHttp.responseText;
            if (xmlHttp.status == 200 && xmlHttp.readyState == 4)
            {
                if (response == "")
                {
                    var msg="<h3 style='color:red'>Server did not respond,Please check the Details entered.</h3>";
                } else
                {
                    document.getElementById("d2").innerHTML = xmlHttp.responseText;
                }

            }
        };
        xmlHttp.send();
    }
</script>
</head>
<body>
    <div class="container">
        <h1 style="color: black">Check Flight Status</h1>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-12">
                    <br/>
                    <label style="color: black">Select City</label>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <input class="form-control" onkeyup="go(this, id)" type='text' id='tf1' required>
                    <div  id="d1" style="color:gray"></div> 
                </div><br/><br/>
                <div class="row">
                    <div class="col-sm-12" >
                        <button type="button"  class="btn btn-info" data-toggle="collapse" onclick="flightStatus1()" data-target="#demo">Departure</button>
                        <button type="button"  class="btn btn-info" data-toggle="collapse" onclick="flightStatus2()" data-target="#demo">Arrival</button>
                    </div>
                </div>
                <div class="row">
                    <div class="text" id="d2"></div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="publicFooter.jsp" %>
</body>
</html>
