
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Processing</title>
    </head>
    <body>
        <%
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String phoneNo=request.getParameter("phoneNo");
            String secQuestion=request.getParameter("secQuestion");
            String secAnswer=request.getParameter("secAnswer");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded");
            Connection conn=DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc","root","system");
            System.out.println("Connection created");
            Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
           ResultSet rs= stmt.executeQuery("select * from user where email=\'"+email+"\'");
            System.out.println("Result Set Created");
            if(rs.next())
            {
                response.sendRedirect("userSignUp.jsp?msg=invalid Email");
            }
            else
            {
                rs.moveToInsertRow();
                rs.updateString("email",email);
                rs.updateString("password",password);
                rs.updateString("secQues",secQuestion);
                rs.updateString("secAnswer",secAnswer);
                rs.updateString("phoneNo",phoneNo);
                rs.insertRow();
         %>
         <h1>Added Successfully</h1>
         <%
            }
        %>
    </body>
</html>
