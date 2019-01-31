
<%@page import="Mail.SimpleMailDemo" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email=session.getAttribute("login")+"";
            SimpleMailDemo obj = new SimpleMailDemo(email,"hello","Thank You for visiting us.Your order has been placed successfully.");
        %>
        <h1>Payment Successful </h1>
        
        <h2>Thank you  for Shoppping with us</h2>
        <h3>Your Order no is 1234</h3>
        <h3>Your Payment ID is <%= request.getParameter("razorpay_payment_id") %></h3>
        <h3>An email has been sent to your E-Mail Id on your E-Mail-Id : <%=email%>.</h3>
    </body>
</html>
