
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    String aname = request.getParameter("aname");
    String id= request.getParameter("id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs=stmt.executeQuery("select * from addairport where cityName like '" + aname + "%'");
        while(rs.next())
        {
            String city_name = rs.getString("cityName");
            String airport_code = rs.getString("airportCode");
            %>
            <label onclick="go1('<%=airport_code%>','<%=id%>')" style="cursor: pointer"> <%=airport_code%>-<%=city_name%></label><br><hr>
            <%
        }
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
%>