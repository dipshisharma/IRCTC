
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login Processing</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded");
            Connection conn = DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc", "root", "system");
            System.out.println("Connection created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from user where email=\'" + email + "\'");
            if (rs.next()) {
                String pass = rs.getString("password");
                if (password.equals(pass)) {
                    session.setAttribute("login", email);
                    response.sendRedirect("index_1.jsp");
                } else {
                    response.sendRedirect("Index_2.jsp?er=pass");
                }
            } else {
                response.sendRedirect("Index_2.jsp?er=" + email);
            }
        %>
        <h3>Login Successful</h3>
    </body>
</html>
