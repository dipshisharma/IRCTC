
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <title>Change Password</title>
        <%
            String msg = request.getParameter("msg");
            if (msg == null) {
                msg = "";
            }

        %>
    </head>
    <body style="background-image: url(images/banner1.jpg)">
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
        <!--top bar--> 
        <!--navigation section--> 
        <div class="navbar-wrapper">
            <div class="container">
                <nav class="navbar navbar-inverse navbar-static-top cl-effect-4" style="">
                    <div class="container" style="background: transparent">
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
                                <li class="active"><a href="index_1.html">Home</a></li>
                                <li><a href="index_1.html#service" onclick="return checkLogin()">Services</a></li>
                                <li><a href="index_1.html#work">Gallery</a></li>
                                <li><a href="index_1.html#testimonial">Contact</a></li>
                                <li><a href="Index_2.jsp">Sign Up</a></li>
                                <li><a href="Index_2.jsp">Login</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
        <br/><br/>
    <center>
        <h1>User Change Password</h1><br/>
        <form action="changePassword2.jsp" method="post">
            <table>
                <tr>
                    <td><span style="color: white">Email</span></td>
                    <td><input type="text" id="email" name="email" placeholder="Enter Email" required></td>
                </tr>
                <tr>
                    <td><span style="color: white">Old Password</span></td>
                    <td><input type="password" id="oPassword" name="oPassword" placeholder="Enter Old Password" required></td>
                </tr>
                <tr>
                    <td><span style="color: white">New Password</span></td>
                    <td><input type="password" id="nPassword" name="nPassword" placeholder="Enter New Password" required=></td>
                </tr>
                <tr>
                    <td><span style="color: white">Confirm Password</span></td>
                    <td><input type="password" id="cPassword" placeholder="Confirm Password" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" class="btn btn-primary " value="submit"></td>
                </tr>
               
            </table>
            <br/>
                <div><span style="color: white"><h3><%= msg%></h3></span></div>
        </form>
    </center>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <%@include file="publicFooter.jsp" %>