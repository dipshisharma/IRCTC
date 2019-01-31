
<%-- 
    Document   : viewFlights
    Created on : Apr 8, 2017, 3:35:07 PM
    Author     : Dipshi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Object obj = session.getAttribute("login");
            String str = (obj == null) ? "" : obj.toString();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Flights</title>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https:\\fonts.googleapis.com\icon?family=Material+Icons" rel="stylesheet">
        <%@include file="publicHeaderFlights.jsp" %>
        <script>
            var xmlhttp = new XMLHttpRequest();

            function fromplace()
            {

                var from = document.getElementById("from").value;
                if (from !== "")
                {
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            document.getElementById("div2").style.display = "block";
                            document.getElementById("div2").innerHTML = xmlhttp.responseText;
                        }
                    };
                    xmlhttp.open("GET", "viewFlights2.jsp?from=" + from, true);
                    xmlhttp.send();
                } else
                {
                    document.getElementById("div2").innerHTML = "";
                    document.getElementById("div2").style.display = "none";
                }
            }

            function toplace()
            {
                var to = document.getElementById("to").value;

                if (to !== "")
                {
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            document.getElementById("div3").style.display = "block";
                            document.getElementById("div3").innerHTML = xmlhttp.responseText;
                        }
                    };
                    xmlhttp.open("GET", "viewFlights2.jsp?to=" + to, true);
                    xmlhttp.send();
                } else
                {
                    document.getElementById("div3").innerHTML = "";
                    document.getElementById("div3").style.display = "none";
                }
            }

            function fill(val, a)
            {
                if (a === 1)
                {
                    document.getElementById("from").value = val;
                    document.getElementById("div2").innerHTML = "";
                    document.getElementById("div2").style.display = "none";
                } else
                {
                    document.getElementById("to").value = val;
                    document.getElementById("div3").innerHTML = "";
                    document.getElementById("div3").style.display = "none";
                }
            }

            function view()
            {
                document.getElementById("data").style.display = "block";
                            document.getElementById("data").innerHTML = "<img src='images/loader.gif' height='200px'>";
                if (document.getElementById("dt").value === "" || document.getElementById("from").value === "" || document.getElementById("to").value === "" || document.getElementById("adult").value === "" || document.getElementById("child").value === "" || document.getElementById("infant").value === "")
                {
                    alert("Please fill all fields!!");
                } else if (parseInt(document.getElementById("adult").value) < 0 || parseInt(document.getElementById("child").value) < 0 || parseInt(document.getElementById("infant").value) < 0)
                {
                    alert("Please fill valid no of Passengers!!");
                } else
                {
                    var flag = "";
                    var from = document.getElementById("from").value;
                    var to = document.getElementById("to").value;
                    var doj = document.getElementById("dt").value;
                    var adult = document.getElementById("adult").value;
                    var child = document.getElementById("child").value;
                    var infant = document.getElementById("infant").value;
                    var seatclass = document.getElementById("seatclass").value;
                    var yr = doj.substr(0, 4);
                    var b = doj.substr(doj.indexOf('-') + 1, doj.lastIndexOf('-') - 5);
                    var d = doj.substr(doj.lastIndexOf('-') + 1, doj.length - 1);
                    doj = yr + "" + b + "" + d;

                    xmlhttp.onreadystatechange = function ()
                    {

                        flag = xmlhttp.responseText;
                        if (flag !== "")
                        {
                            document.getElementById("data").innerHTML = flag;
                        }
                        else
                        {
                            var msg="Server did not Respond";
                            document.getElementById("data",msg);
                        }
                    };
                    xmlhttp.open("GET", "viewFlights3.jsp?from=" + from + "&&to=" + to + "&&doj=" + doj + "&&adult=" + adult + "&&child=" + child + "&&infant=" + infant + "&&seatclass=" + seatclass, true);
                    xmlhttp.send();
                }
            }

            function flight(i)
            {

                document.getElementById(i + "baggage").style = "display:none";
                document.getElementById(i + "fare").style = "display:none";


                document.getElementById(i + "flight").style = "display:block";
            }

            function fare(i)
            {
                document.getElementById(i + "baggage").style = "display:none";
                document.getElementById(i + "flight").style = "display:none";

                document.getElementById(i + "fare").style = "display:block";
            }
            function baggage(i)
            {
                document.getElementById(i + "flight").style = "display:none";
                document.getElementById(i + "fare").style = "display:none";

                document.getElementById(i + "baggage").style = "display:block";
            }
            function godisplay(i)
            {

                var h = document.getElementById(i + "details").offsetHeight;
                if (parseInt(h) > 0)
                {

                    document.getElementById(i + "details").style = "display:none";
                    document.getElementById(i + "flight").style = "display:none";
                    document.getElementById(i + "fare").style = "display:none";
                    document.getElementById(i + "baggage").style = "display:none";

                } else
                {

                    document.getElementById(i + "details").style = "display:block";
                }

            }
            function bookflight(fare, flightNo)
            {
                var str = '<%=str%>';
                if (str === '')
                {
                    alert('Login First!!');
                    window.location = 'Index_2.jsp';
                } else
                {
                    var fare = fare;
                    var flightNo = flightNo;
                    var src = document.getElementById("from").value;
                    var des = document.getElementById("to").value;
                    var children = document.getElementById("child").value;
                    var adults = document.getElementById("adult").value;
                    window.location = "bookflights.jsp?src=" + src + "&des=" + des + "&fare=" + fare + "&flightNo=" + flightNo + "&child=" + children + "&adults=" + adults;
                }
            }
        </script>
    </head>
    <body>
    <center>
        <table class="table table- table-responsive">
            <tr>
                <th colspan="8"><center><h1>View Flights</h1></center></th>
            </tr>
            <tr>
                <th><label>From: </label><br><input type="text" name="from" id="from" required  autofocus onkeyup="fromplace()"/><br><div id="div2" style="display: none;overflow: auto;z-index: 5;height: 200px;"></div></th>
                <th><label>To: </label><br><input type="text" name="to" id="to"  required onkeyup="toplace()"/><br><div id="div3" style="display: none;overflow: auto;z-index: 5;height: 200px;"></div></th>
                <th><label>No of Adults:</label><br><input type="number" name="adult" value="0" id="adult" placeholder="12+ years" required/></th>
                <th><label>No of Children:</label><br><input type="number" name="child" value="0" id="child" placeholder="2-12 years" required/></th>
                <th><label>No of Infants:</label><br><input type="number" name="infant" value="0" id="infant" placeholder="below 2 years" required/></th>
                <th><label>Seating Class:</label><br>
                    <select name="seatclass" id="seatclass">
                        <option value="E">Economy</option>
                        <option value="B">Business</option>
                        <option value="F">First Class</option>
                        <option value="W">Premium Economy</option>
                    </select>
                </th>
                <th><label>Date: </label><br><input type="date" id="dt" required/></th>
            </tr>
            <tr><th><br/><input type="submit" value="Search" onclick="view()" class="btn btn-primary" /></th></tr>
            </tr>
        </table>
        <div id="data" class="container" style="display: none;z-index: 1"><img src='images/loader.gif' height="200px"></div><br>
    </center>
</body>
<%@include file="publicFooter.jsp" %>
</html>
