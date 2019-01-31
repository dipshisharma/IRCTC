<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="jquery-1.12.2.min.js" type="text/javascript"></script>
<script src="bootstrap.min.js" type="text/javascript"></script>
<%
    String place=request.getParameter("place");
    URL url = new URL("https://api.flightstats.com/flex/fids/rest/v1/json/"+place+"/arrivals?appId=668c3ffd&appKey=0af05f95976444ad12c5435935a6221f&requestedFields=airlineCode%2CflightNumber%2Ccity%2CcurrentTime%2Cgate%2Cremarks&lateMinutes=15&useRunwayTimes=false&excludeCargoOnlyFlights=false");
        HttpURLConnection urlcon = (HttpURLConnection) url.openConnection();

        urlcon.connect();

        DataInputStream dis = new DataInputStream(urlcon.getInputStream());
        String Buffer = "";
        while (true) 
        {

            String s = dis.readLine();
            if (s == null) {
                break;
            }
            Buffer += s;
        }
         JSONParser jparser = new JSONParser();
    JSONObject object = (JSONObject) jparser.parse(Buffer);
    JSONArray jsonarray = (JSONArray) object.get("fidsData");
%>
<br><br><br><table class="table-responsive table-striped table-bordered col-sm-9">
    <caption style="color:black"><b>Arrivals</b></caption>
    <tr>
        <th>Flight Number</th>
        <th>Airline Code</th>
        <th>Source</th>
        <th>Destination</th>
        <th>Status</th>
        <th>Current Time</th>
    </tr>
    
        <%
            for(int i=0;i<jsonarray.size();i++)
            {
                JSONObject obj1=(JSONObject)jsonarray.get(i);
                String flightNo=obj1.get("flightNumber").toString();
                String airlineCode = obj1.get("airlineCode").toString();
                String dest = place;
                String src = obj1.get("city").toString();
                String status= obj1.get("remarks").toString();
                String currentTime= obj1.get("currentTime").toString();
            
        %>
        <tr>
            <td><%= flightNo%></td>
            <td><%= airlineCode %></td>
            <td><%= src%></td>
            <td><%= dest%></td>
            <td><%= status %></td>
            <td><%= currentTime %></td>
        </tr>
        <%
            }
        %>
</table>
    