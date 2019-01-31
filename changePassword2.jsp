
<%@page import="java.sql.*" %>
<%
    String email=request.getParameter("email");
    String oPassword=request.getParameter("oPassword");
    String nPassword=request.getParameter("nPassword");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
    Connection conn = DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc", "root", "system");
    System.out.println("Connection created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from user where email=\'" + email + "\' and password=\'"+oPassword+"\'");
    if (rs.next())
    {
        rs.updateString("password", nPassword);
        rs.updateRow();
        response.sendRedirect("changePassword.jsp?msg=UPDATED :)");
    }
    else
    {
        response.sendRedirect("changePassword.jsp?msg=INVALID ID OR PASSWORD :/");
    }
%>