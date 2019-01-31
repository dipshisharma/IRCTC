<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Travel Yaari</title>
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
    </head>
    <body>
        <!-- top bar -->
        <div class="top-bar">
            <div class="container">
                <ul class="top-contacts">
                    <li class="top-unhover"><p><span class="fa fa-phone-square" aria-hidden="true"></span> +91 9779 15 8813</p></li>
                    <li class="top-hover"><p><span class="fa fa-envelope" aria-hidden="true"></span> <a href="mailto:support@company.com">dipshisharma33@gmail.com</a></p></li>
                </ul>
                <ul class="top-links">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
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
                            <a class="navbar-brand" href="#"><h1>Travel Yaari</h1></a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="active"><a href="index_1.jsp">Home</a></li>
                                <li><a href="index_1.jsp#service">Services</a></li>
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
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="img-responsive" data-transition="shrinkReveal" data-duration="1000"  style="background-image:url(images/publicHeaderFlights.jpg); height: 350px"></div>