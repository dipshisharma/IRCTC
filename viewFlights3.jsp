<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<table cellspacing="2" class="table table-responsive table-striped  table-hover " cellpadding="2">


    <%
        String destination = request.getParameter("to");
        String source = request.getParameter("from");
        String date = request.getParameter("doj");
        String adult = request.getParameter("adult");
        String child = request.getParameter("child");
        String infant = request.getParameter("infant");

        String seatclass = request.getParameter("seatclass");
        System.out.println(seatclass);
        URL url = new URL("http://developer.goibibo.com/api/search/?app_id=fb472132&app_key=d2d5f5f27564e08c3054461aa0a52f2b&format=json&source=" + source + "&destination=" + destination + "&dateofdeparture=" + date + "&seatingclass=" + seatclass + "&adults=" + adult + "&children=" + child + "&infants=" + infant + "&counter=0");
        System.out.println(url + "");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.connect();
        DataInputStream dis = new DataInputStream(conn.getInputStream());
        String buffer = "";
        while (true) {
            String temp = dis.readLine();
            if (temp == null) {
                break;
            }
            buffer += temp;
        }
        JSONParser jp = new JSONParser();

        JSONObject object = (JSONObject) jp.parse(buffer);

        JSONObject jo = (JSONObject) object.get("data");
        JSONArray ja = (JSONArray) jo.get("onwardflights");
        if (ja == null) {
            response.getWriter().println(buffer);
            response.getWriter().println(url.toString());
            return;
        }
        String originfinal1 = "";
        for (int i = 0; i < ja.size(); i++) {
            JSONObject inner = (JSONObject) ja.get(i);
            JSONObject fare = (JSONObject) inner.get("fare");
            JSONArray onward = (JSONArray) inner.get("onwardflights");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
            Statement stmt2 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs11 = stmt2.executeQuery("select cityName from addairport where airportCode='" + inner.get("origin") + "' ");
            if (rs11.next()) {
                originfinal1 = rs11.getString(1);
            }
            rs11.close();
            conn3.close();

    %>

    <div class="row">

        <div class="col-sm-2">
            <img src="images/<%=inner.get("airline")%>.jpg" alt="airline/flight-icon.png" onerror="this.onerror=null;this.src='airline/flight-icon.png';" width="50px" height="50px"/>
            <label><%=inner.get("flightno")%><br><%=inner.get("airline")%></label>
        </div>


        <div class="col-sm-2">
            <label><i class="material-icons">room</i>&nbsp;&nbsp;<%=originfinal1%></label><br>
            <label><%=inner.get("depdate").toString().substring(0, 10)%></label>        
        </div>
        <div class="col-sm-2">
            <label><i class="material-icons">restore</i>&nbsp;&nbsp;Duration</label><br>
            <label><%=inner.get("duration")%></label></div>

        <div class="col-sm-2">
            <label><i class="material-icons">payment</i>&nbsp;&nbsp;Fare</label><br>
            <label>Rs.<%=fare.get("totalfare")%></label></div>



        <div class="col-sm-2">
            <%
                String departureTime = inner.get("deptime").toString();
                System.out.println(departureTime);
                int hours = Integer.parseInt(departureTime.substring(0, departureTime.indexOf(":")));
                int minutes = Integer.parseInt(departureTime.substring(departureTime.indexOf(":") + 1));
                int totalMins = (hours * 60) + minutes;
                System.out.println(totalMins);
                String duration = inner.get("duration").toString();
                System.out.println(duration);
                int hours1 = Integer.parseInt(duration.substring(0, duration.indexOf(" ") - 1));
                int minutes1 = Integer.parseInt(duration.substring(duration.indexOf(" ") + 1, duration.length() - 1));
                int totalMins1 = (hours1 * 60) + minutes1;
                System.out.println(totalMins1);
                int arrtime = totalMins + totalMins1;
                arrtime = arrtime % 1440;
                System.out.println(arrtime);
                String deptime = "";
                String hoursStr = (arrtime) / 60 + "";
                hoursStr = hoursStr.length() == 1 ? "0" + hoursStr : hoursStr;
                String minsStr = (arrtime % 60) + "";
                minsStr = minsStr.length() == 1 ? "0" + minsStr : minsStr;
                deptime = hoursStr + ":" + minsStr;

                String destfinal = "";
                String originfinal = "";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
                Statement stmt = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                ResultSet rs = stmt.executeQuery("select cityName from addairport where airportCode='" + inner.get("destination") + "' ");
                if (rs.next()) {
                    destfinal = rs.getString(1);
                }
                rs.close();
                conn1.close();
                String destfinal1 = "";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn6 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
                Statement stmt5 = conn6.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                ResultSet rs6 = stmt5.executeQuery("select cityName from addairport where airportCode='" + destination + "' ");
                if (rs6.next()) {
                    destfinal1 = rs6.getString(1);
                }
                rs6.close();
                conn6.close();
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
                Statement stmt1 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                ResultSet rs1 = stmt1.executeQuery("select cityName from addairport where airportCode='" + inner.get("origin") + "' ");
                if (rs1.next()) {
                    originfinal = rs1.getString(1);
                }
                rs1.close();
                conn2.close();

            %>
            <label><i class="material-icons">room</i>&nbsp;&nbsp;<%= destfinal1%></label><br>    

            <%
                String abc = "";
                try {
                    JSONObject onwardob = (JSONObject) onward.get(onward.size() - 1);
                    abc = onwardob.get("arrdate").toString().substring(0, onwardob.get("arrdate").toString().indexOf("t"));
                } catch (Exception ex) {
                    abc = inner.get("arrdate").toString().substring(0, 10);
                }
            %>
            <label><%=abc%></label>
        </div> 
        <div class="col-sm-2">
            <input type="button" onclick="bookflight(<%=fare.get("totalfare")%>,<%=inner.get("flightno")%>)" class="btn btn-primary btn-group-sm" value="Book Now"/> 
        </div>
    </div>    
</div>
<center><a style="cursor: pointer" onclick="godisplay('<%=i%>')" >Details</a>
    <ul style="display:none" id='<%=i%>details' class="nav nav-tabs">


        <li onclick="flight('<%=i%>')"><a style="cursor: pointer">Flight details</a></li>
        <li onclick="baggage('<%=i%>')"><a style="cursor: pointer">Baggage Details</a></li>
        <li onclick="fare('<%=i%>')"><a style="cursor: pointer">Fare Details</a></li>
    </ul></center>
<tr>
    
 <!--insert here-->
 <div style="display:none" id="<%=i%>flight" >
    <div class="row">


        <div class="col-sm-1">
            <img src="images/<%=inner.get("airline")%>.jpg" style="float: right" alt="airline/flight-icon.png" onerror="this.onerror=null;this.src='airline/flight-icon.png';" width="50px" height="50px"/>
        </div>
        <div class="col-sm-2">
            <label><%=inner.get("flightno")%><br><%=inner.get("airline")%></label>
        </div>

        <div class="col-sm-2">
            <br/>


            <%
                String color = "";
                String status = "";
                String refund = inner.get("warnings").toString();
                if (refund.equals("Refundable")) {
                    color = "green";
                    status = "Refundable";
                } else {
                    color = "red";
                    status = "Non-Refundable";
                }
            %>
            <span style="font-size: 14px;color: <%=color%>" >
                <%=status%>
            </span>
        </div>

        <div class="col-sm-2">

            <span style="font-size: 20px;"> <i class="material-icons">room</i>&nbsp;&nbsp;<%=originfinal%></span>
            <br/>
            <span style="font-size: 16px">
                <%=inner.get("deptime")%>

            </span>
        </div>

        <div class="col-sm-3">
            <img src="images/connect-flight.jpg"/>
        </div>

        <div class="col-sm-2">
            <span style="font-size: 20px;">  
                <i class="material-icons">room</i>&nbsp;&nbsp;<%=destfinal%>
            </span>
            <br/>
            <span style="font-size: 16px">
                <%=inner.get("arrtime").toString()%>
            </span>
        </div>


    </div>
    <%
        for (int j = 0; j < onward.size(); j++) {
            JSONObject f = (JSONObject) onward.get(j);
            String ndestfinal = "";
            Connection conn4 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
            Statement stmt3 = conn4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs3 = stmt3.executeQuery("select cityName from addairport where airportCode='" + f.get("destination") + "' ");
            if (rs3.next()) {
                ndestfinal = rs3.getString(1);
            }
            rs3.close();
            conn4.close();
            String norigfinal = "";
            Connection conn5 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
            Statement stmt4 = conn5.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs4 = stmt4.executeQuery("select cityName from addairport where airportCode='" + f.get("origin") + "' ");
            if (rs4.next()) {
                norigfinal = rs4.getString(1);
            }
            rs4.close();
            conn5.close();
    %>
    
    <div class="row">


        <div class="col-sm-1">
            <img src="images/<%=f.get("airline")%>.jpg" style="float: right" alt="airline/flight-icon.png" onerror="this.onerror=null;this.src='airline/flight-icon.png';" width="50px" height="50px"/>
        </div>
        <div class="col-sm-2">
            <label><%=f.get("flightno")%><br><%=f.get("airline")%></label>
        </div>

        <div class="col-sm-2">
            <br/>


            <%
                String color1 = "";
                String status1 = "";
                String refund1 = f.get("warnings").toString();
                if (refund1.equals("Refundable")) {
                    color1 = "green";
                    status1 = "Refundable";
                } else {
                    color1 = "red";
                    status1 = "Non-Refundable";
                }
            %>
            <span style="font-size: 14px;color: <%=color1%>" >
                <%=status1%>
            </span>
        </div>

        <div class="col-sm-2">

            <span style="font-size: 20px;">  <i class="material-icons">room</i>&nbsp;&nbsp;      <%= norigfinal%></span>
            <br/>
            <span style="font-size: 16px">
                <%=f.get("deptime")%>

            </span>
        </div>

        <div class="col-sm-3">
            <img src="images/connect-flight.jpg"/>
        </div>

        <div class="col-sm-2">
            <span style="font-size: 20px;">  
                <i class="material-icons">room</i>&nbsp;&nbsp;<%= ndestfinal%>
            </span>
            <br/>
            <span style="font-size: 16px">
                <%=f.get("arrtime")%>
            </span>
        </div>

    </div>

    <% }
    %>
</div>
</tr>
<tr>

<div style="display:none" id='<%=i%>baggage' >
    <div  class='table table-hover'>
        <% JSONObject bag = (JSONObject) inner.get("baggage_info");
            try {
                String bag1 = bag.get("FreeAllowance").toString();


        %>
        <i class="material-icons">work</i>&nbsp;&nbsp;<br>
        Check-In Baggage:<%=bag1%><br/>
        Hand Baggage:7 Kgs
        <%
        } catch (Exception ex) {
        %>
        <i class="material-icons">work</i>&nbsp;&nbsp;<br>
        Check-In Baggage 25   <br/>
        Hand Baggage:7 Kgs

        <%              }

        %>
    </div>



</div>
</tr>
<tr>
<div style="display:none" id="<%=i%>fare">
    <div  class="table table-hover">
        <%    JSONObject far = (JSONObject) inner.get("fare");
            int taxes = Integer.parseInt(far.get("totalbasefare").toString()) - Integer.parseInt(far.get("totalbasefare").toString());
        %>
        <i class="material-icons">payment</i>&nbsp;&nbsp;<br>
        BASE FARE:<%=far.get("totalbasefare")%><br>
        TAXES:<%=Integer.parseInt(far.get("totalfare").toString()) - Integer.parseInt(far.get("totalbasefare").toString())%><br>
        TOTAL:<%=far.get("totalfare")%>
    </div>
</div>
</tr>

<hr>
<%

    }

%>
</table>