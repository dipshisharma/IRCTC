
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <%
            String msg=request.getParameter("msg");
            if(msg==null)
            {
                msg="";
            }
            
        %>
    </head>
    <body>
        <center>
            <h1>Admin Change Password</h1>
            <form action="adminChangePassword2.jsp" method="post">
            <table>
                <tr>
                    <td><span>email</span></td>
                    <td><input type="text" id="email" name="email" placeholder="Enter Email" required></td>
                </tr>
                <tr>
                    <td><span>old password</span></td>
                    <td><input type="password" id="oPassword" name="oPassword" placeholder="Enter Old Password" required></td>
                </tr>
                <tr>
                    <td><span>new password</span></td>
                    <td><input type="password" id="nPassword" name="nPassword" placeholder="Enter New Password" required></td>
                </tr>
                <tr>
                    <td><span>confirm password</span></td>
                    <td><input type="password" id="cPassword" placeholder="Confirm Password" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="submit"></td>
                </tr>
                <tr>
                    <td><span><%= msg%></span></td>
                </tr>

            </table>
        </form>
            </center>
    </body>
</html>
