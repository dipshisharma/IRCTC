
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Procesing </title>
    </head>
    <body>
        <h1></h1>
        <%
            String email=request.getParameter("email");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded");
            Connection conn=DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc","root","system");
            System.out.println("Connection created");
            Statement stmt=conn.createStatement();
            System.out.println("Statement Created");
           ResultSet rs= stmt.executeQuery("select * from admin where email=\'"+email+"\'");
            System.out.println("Result Set Created");
            String s=request.getParameter("password");
            if(rs.next())
            {
                String password=rs.getString("password");
                if(s.equals(password))
                {
                    response.sendRedirect("adminHome.jsp");
                }
                else
                {
                    response.sendRedirect("adminLogin.jsp?msg=invalid password");
                }
            }
            else
            {
                response.sendRedirect("adminLogin.jsp?msg=invalid email");
            }   
            
        %>
    </body>
</html>
