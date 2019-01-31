

<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>IRCTC</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Capitalist Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <!-- font files -->
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!-- /font files -->
        <!-- css files -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- /css files -->
        <!-- js files -->
        <script src="js/modernizr.custom.js"></script>
        <!-- /js files -->
        <script>
            function checkLogin()
            {
                if (session.getAttribute("login") == "loggedIn")
                {
                    return true;
                } else
                {
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <!-- top bar -->
        <div class="top-bar">
            <div class="container">
                <ul class="top-contacts">
                    <li class="top-unhover"><p><span class="fa fa-phone-square" aria-hidden="true"></span> +91 9779 15 8813</p></li>
                    <li class="top-hover"><p><span class="fa fa-envelope" aria-hidden="true"></span> <a href="mailto:support@company.com">dipshisharma33@gmail.com</a></p></li>
                </ul>
                <div class="clearfix"></div>
            </div>		
        </div>
        <!-- /top bar -->
        <!-- navigation section -->
        <div class="navbar-wrapper">
            <div class="container">
                <nav class="navbar navbar-inverse navbar-static-top cl-effect-4">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#"><h1>IRCTC</h1></a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="active"><a href="index_1.jsp">Home</a></li>
                                <li><a href="index_1.jsp#service" onclick="return checkLogin()">Services</a></li>
                                <li><a href="index_1.jsp#work">Gallery</a></li>
                                <li><a href="index_1.jsp#testimonial">Contact</a></li>
                                    <%
                                        String action = request.getParameter("action");
                                        if (action != null) {
                                            session.removeAttribute("login");
                                        }
                                        if (session.getAttribute("login") != null) {
                                    %>
                                <li><a href="Index_2.jsp">Sign Up</a></li>
                                <li><a href="Index_2.jsp?action=logout">LogOut</a></li>
                                    <%
                                    } else {
                                    %>
                                <li><a href="Index_2.jsp">Sign Up</a></li>
                                <li><a href="Index_2.jsp">Login</a></li>
                                <%
                                    }
                                %>
                                <li><a href="admin_1.jsp">Admin</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- /navigation section -->
<title>Admin Section</title>
    </head>
    <body style="background-image: url(images/banner1.jpg)">
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <center>
        <h1 style="color:white">Choose Option</h1>
        <a href="adminLogin.jsp" style="color:white">Login</a><br>
        <a href="addAirport.jsp" style="color:white">Add Airport</a><br>
        <a href="deleteAirport.jsp" style="color:white">Delete Airport</a><br>
        <a href="adminChangePassword.jsp" style="color:white">Change Password</a><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        </center>
        <%@include file="publicFooter.jsp" %>
    </body>
</html>
