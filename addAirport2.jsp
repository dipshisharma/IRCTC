
<%@page import="java.sql.*" %>
<%
    String msg=request.getParameter("msg");
    if(msg==null)
    {
        msg="";
    }
    String airportCode = request.getParameter("airportCode");
    String cityName = request.getParameter("cityName");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
    Connection conn = DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc", "root", "system");
    System.out.println("Connection created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from addAirport where airportCode=\'" + airportCode + "\' and cityName=\'"+cityName+"\'");
    System.out.println("Result Set Created");
    if (rs.next()) 
    {
        response.sendRedirect("addAirport.jsp?msg=Already Exists");
    } 
    else 
    {
        rs.moveToInsertRow();
        rs.updateString("airportCode",airportCode);
        rs.updateString("cityName",cityName);
        rs.insertRow();
    }
    ResultSet rs1=stmt.executeQuery("select * from addAirport");
    %>
    <table border="2px">
        <tr>
                 <th>Airport Id</th>
                 <th>Airport Code</th>
                 <th>City Name</th>
                 <th></th>
                 <th></th>
             </tr>
    <%
    while(rs1.next())
    {
         int airportId=rs1.getInt("airportId");
         String nairportCode=rs1.getString("airportCode");
         String ncityName=rs1.getString("cityName");
         %>
        
             <tr>
                 <td><%= airportId%></td>
                 <td><%= nairportCode%></td>
                 <td><%= ncityName%></td>
                 <td><a href="editAirport.jsp?id=<%=airportId%>">edit</a></td>
                 <td><a href="deleteAirport.jsp?=<%=airportId%>">delete</a></td>
             </tr>
             
         <%
    }
%>
    </table>
    <span><%= msg%></span>
