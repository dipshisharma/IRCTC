
<%@include file="publicHeaderFlights.jsp" %>
<title>Track Flights</title>
<script>
    function suggestions()
    {
        var ar = document.getElementById("ac").value+"";
        
        if (ar == "")
        {
            document.getElementById("d1").innerHTML="";
        } 
        else
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("GET", "getairline?ar=" + ar, true);
            xmlHttp.onreadystatechange = function ()
            {
                if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
                {
                    document.getElementById("d1").innerHTML = xmlHttp.responseText;
                }
            }
            xmlHttp.send();
        }
    }
    function set1(name)
    {
        var name = name;
        document.getElementById("ac").value = name;
        document.getElementById("d1").innerHTML = "";
    }
</script>

</head>
<body>
    <form action="trackflights2.jsp" method="get" >
        <div class="container">

            <h1 style="color: black">Track Flights</h1>
            <br/>
            <div class=" col-sm-4">
                <label style="color: black">Airline Name</label><br>
                <input type="text" class="form-control" id="ac" name="ac" onkeyup="suggestions()" required/><br>
                <div id="d1"></div>
            </div>
            <div class="col-sm-4">
                <label style="color: black">Flight Number</label><br>
                <input type="text" class="form-control" id="fn" name="fn" required/>
            </div>
            <div class="col-sm-2">
                <label style="color: black">Date</label>
                <input type="date" name="date" id="date" required/>
            </div>

            <div class="col-sm-2">
                <br>
                <button class="btn btn-primary center-block" value="track">Track</button> 
            </div>
            <br/>
        </div>
    </form>
    <br>
    <br>
    <br>
    <%@include file="publicFooter.jsp" %>
</body>
</html>
