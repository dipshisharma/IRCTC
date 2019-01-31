
<%@page import="java.util.StringTokenizer"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
    String ac = request.getParameter("ac");
    String fn = request.getParameter("fn");
    String date = request.getParameter("date");
    StringTokenizer st= new StringTokenizer(date,"-");
    String abc="";
    while(st.hasMoreTokens())
    {
        abc+=st.nextToken()+"/";
    }
    abc=abc.substring(0,abc.length()-1);
    
    URL url = new URL("https://api.flightstats.com/flex/flightstatus/rest/v2/json/flight/tracks/"+ac+"/"+fn+"/dep/"+abc+"?appId=f07dc1e2&appKey=6390d1fedf262c3bd0bf104bbceafd98&utc=false&includeFlightPlan=false");
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
  
 response.getWriter().println(buffer);
    
    
%>