
<%@page import="java.sql.*" %>
<%
    int airportId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
    Connection conn = DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc", "root", "system");
    System.out.println("Connection created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from addAirport where airportId=\'" + airportId+"\'");
    System.out.println("Result Set Created");
    if (rs.next()) 
    {
        rs.deleteRow();
    }
    else
    {
        response.sendRedirect("addAirport2.jsp?msg=Does Not Exist");
    }
    
%>