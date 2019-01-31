
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Airport</title>
        
    </head>
    <body>
        <%
            String msg=request.getParameter("msg");
            if(msg==null)
            {
                msg="";
            }
        %>
        <center>
            <h1>Add Airport</h1>
        <form action="addAirport2.jsp" method="post">
            <table>
                
                <tr>
                    <td><span>Airport Code</span></td>
                    <td><input type="text" placeholder="Enter Airport Code" name="airportCode"></td>
                </tr>
                <tr>
                    <td><span>City Name</span></td>
                    <td><input type="text" placeholder="Enter City Name" name="cityName"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><span><%= msg%></span></td>
                </tr>
            </table>
                
        </form>
        </center>
    </body>
</html>
