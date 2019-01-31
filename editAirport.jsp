
<%@page import="java.sql.*" %>
<%
    String msg=request.getParameter("msg");
    if(msg==null)
    {
        msg="";
    }
    int airportId =Integer.parseInt(request.getParameter("id"));
    %>
    <form action="editAirport2.jsp ">
        <table>
            <tr>
                <td><span>Airport Id</span></td>
                <td><%= airportId%></td>
                <td><input type="hidden" name="airportId" value="<%= airportId%>"></td>
            </tr>
            <tr>
                <td><span>Airport Name</span></td>
                <td><input type="text" name="airportName" placeholder="Enter Airport Name"></td>
            </tr>
            <tr>
                <td><span>City Name</span></td>
                <td><input type="text" name="cityName" placeholder="Enter City Name"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update"></td>
            </tr>
            <tr>
                <td></td>
                <td><span><%= msg%></span></td>
            </tr>
        </table>
    </form>
    