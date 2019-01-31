<%@page import="java.sql.*" %>

<%
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    int flag;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

        ResultSet rs;
        if (from == null && to != null) {
            rs = stmt.executeQuery("select * from addairport where cityName like '" + to + "%' or airportName like '" + to + "%'");
            flag = 2;
        } else {
            rs = stmt.executeQuery("select * from addairport where cityName like '" + from + "%' or airportName like '" + from + "%'");
            flag = 1;
        }
%>

<%
        while (rs.next()) {
            String airport_name = rs.getString("airportCode");
            String city_name = rs.getString("cityName");
%>
<label onclick="fill('<%=airport_name%>',<%=flag%>)" style="cursor: pointer"><%=airport_name%> <%=city_name%></label><br><hr>
<%
    }

%>

<%
} catch (Exception ex) {
%>
<label> <%= ex.getMessage()%> </label>
<%
    }
%>