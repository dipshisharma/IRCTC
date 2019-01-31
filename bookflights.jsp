<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-image: url(images/banner1.jpg)">
        <%
            String src = request.getParameter("src");
            String dest = request.getParameter("des");
            String fare = request.getParameter("fare");
            String flightNo = request.getParameter("flightNo");
            int children = Integer.parseInt(request.getParameter("child"));
            int adults = Integer.parseInt(request.getParameter("adults"));
            String origin = "", destination = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
            Statement stmt2 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs11 = stmt2.executeQuery("select cityName from addairport where airportCode='" + src + "' ");
            if (rs11.next()) {
                origin = rs11.getString(1);
            }
            rs11.close();
            conn3.close();

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");

            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs = stmt.executeQuery("select cityName from addairport where airportCode='" + dest + "' ");
            if (rs.next()) {
                destination = rs.getString(1);
            }
            rs.close();
            conn.close();

        %>
        <a type="button" class="btn btn-group-sm btn-lg" href="viewFlights.jsp" style="color: white;">Back</a>
        <br/>
        <br/>
    <center>
        <h1 style="color: white">VMM Payment Gateway Demo</h1>

        <form action="success.jsp" method="post">

            <!-- receive ur normal text data on next page , like we do regularly -->

            <!--<input type="text"  name="t1" />-->
            <div class="row">
                <div class="col-sm-3" style="color: white"><h3>Source : <%= origin%></h3></div>
                <div class="col-sm-3" style="color: white"><h3>Destination : <%= destination%></h3></div>
                <div class="col-sm-3" style="color: white"><h3>Fare : <%= fare%></h3></div>
                <div class="col-sm-3" style="color: white"><h3>Flight Number : <%= flightNo%></h3></div>
            </div>
            <br/>
            <br/>
            <div class="row">
                <%
                    for (int i = 0; i < adults; i++) {
                %>
                Enter Name : <input type="text" class="bg-primary"  placeholder="Adult Name"><br/><br/>
                <%
                    }
                %>
                <%
                    for (int j = 0; j < children; j++) {
                %>
                Enter Name : <input type="text" class="bg-primary" placeholder="Child Name"><br/><br/>
                <%
                    }
                %>
            </div>
            </div>
            <input type="text"  name="t1" />



            <!-- Note that the amount is in paise = 500 INR -->
            <!-- This script will show payment screen and block form submit until, payment is successful -->
            <script
                src="https://checkout.razorpay.com/v1/checkout.js"
                data-key="rzp_test_96HeaVmgRvbrfT"
                data-amount="50000"
                data-buttontext="Pay with Razorpay"
                data-name="VMM Education"
                data-description="Thank You for purchaing Silver Package."
                data-image="http://vmmeducation.com/images/newlogo.png"
                data-prefill.name="Amrinder Singh"
                data-prefill.email="amrinder@vmmeducation.com"
                data-theme.color="#FF3254"
            ></script>
            <input type="hidden" value="Hidden Element" name="hidden">


        </form>

    </center>
</body>
</html>
