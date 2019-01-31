<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <%
            String s=request.getParameter("msg");
            if(s==null)
            {
                s="";
            }
        %>
    </head>
    
    <body>
        <center>
        <h1>Admin Login</h1>
        <form action="adminLogin1.jsp" method="post">
            <table>
                <tr>
                    <td> <span>Email</span></td>
                    <td><input type="text" name="email" placeholder="Enter Email" ></td>
                </tr>
                <tr>
                    <td> <span>Password</span></td>
                    <td><input type="password" name="password" placeholder="Enter Password"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><span style="color: red"><%=s%></span></td>
                </tr>

            </table>
        </form>
        </center>        
    </body>
</html>
