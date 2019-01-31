
<%@page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loaded");
    Connection conn = DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc", "root", "system");
    System.out.println("Connection created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from user where email=\'" + email + "\'");
    if (rs.next()) {
%>
<div>
    <table>
        <tr>
            <td><span style="color: black">Security Question</span></td>
            <td>
                <select name="secQues" id="secQues" style="color: black">
                    <option style="color:black">What was your school name?</option>
                    <option style="color:black">what was your first name?</option>
                    <option style="color:black">whats your fav sport?</option>
                    <option style="color:black">whats your hometown?</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><span style="color:black">Security Answer</span></td>
            <td><input type="text" name="secAnswer" id="secAnswer" placeholder="Enter Answer" required></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="button" class="btn btn-primary btn-group-sm" value="Submit" onclick="go1()"></td>
        </tr>
    </table>
</div>
<%
    } 
    else 
    {
%> 
    <input type="button" id="bt2" value="Submit"><br/>
    <span>Invalid Email</span>
<%
    }

%>