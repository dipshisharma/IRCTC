
<%@page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String secQues = request.getParameter("secQues");
    String secAnswer = request.getParameter("secAnswer");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
    Connection conn = DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc", "root", "system");
    System.out.println("Connection created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from user where email=\'" + email + "\' and (secQues=\'" + secQues + "\' and secAnswer=\'" + secAnswer + "\')");
    if (rs.next()) {
        String pass = rs.getString("password");
%>
<span style="color:black">Your Password is <%= pass%></span>
<%
} else {
%>
<span style="color:black">Invalid Security Question or Answer</span>
<%
    }
%>