-
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>

<html>

    <head>

        <title>Login or SignUp</title>
        <!-- custom-theme -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Simple Login and Signup Form web template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //custom-theme -->
        <link href="css/style_1.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="js/jquery-1.9.1.min.js"></script>
        <!--// js -->
        <link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
        <link href="//fonts.googleapis.com/css?family=Questrial" rel="stylesheet">
    </head>
    <body class="bg agileinfo">
        <!-- top bar -->
        <div class="top-bar">
            <div class="container">
                <ul class="top-contacts">
                    <li class="top-unhover"><p><span class="fa fa-phone-square" aria-hidden="true"></span> +91 9779 15 8813</p></li>
                    <li class="top-hover"><p><span class="fa fa-envelope" aria-hidden="true"></span> <a href="mailto:support@company.com">dipshisharma33@gmail.com</a></p></li>
                </ul>
                <!--                <ul class="top-links">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                </ul>-->
                <div class="clearfix"></div>
            </div>		
        </div>
        <!-- /top bar -->
        <!-- navigation section -->
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
                        <div id="navbar" class="navbar-collapse collapse" style="background: transparent">
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
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- /navigation section -->

        <br/> <br/>
        <br/> <br/>
        <div class="w3layouts_main wrap" style="width: 500px;">
            <!--Horizontal Tab-->
            <div id="parentHorizontalTab_agile">
                <ul class="resp-tabs-list hor_1">
                    <li>LogIn</li>
                    <li>Sign Up</li>
                </ul>
                <div class="resp-tabs-container hor_1">
                    <%
                        String error = "";
                        try {
                            try {
                                error = request.getParameter("er");
                                if (error == null) {
                                    error = "";
                                } else if (error.equals("pass")) {
                                    error = "password invalid";
                                } else {
                                    error = "email invalid";
                                }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                        String error1 = "";
                        try {
                            try {
                                error1 = request.getParameter("er");
                                if (error1 == null) {
                                    error1 = "";
                                } else if (error1.equals("pass")) {
                                    error1 = "Sign Up Successful :)";
                                } else {
                                    error1 = "Email Id Already Exists.";
                                }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                    <div class="w3_agile_login">
                        <form action="userLogin1.jsp" method="post" class="agile_form">
                            <p>Email</p>
                            <input type="email" name="email" required="required" />
                            <p>Password</p>
                            <input type="password" name="password" required="required" class="password" /> 
                            <div class="check">
                                <label class="checkbox w3l"><input type="checkbox" name="checkbox" required="required"><i> </i>I accept the terms and conditions</label>
                            </div>
                            <input type="submit" value="LogIn" class="agileinfo" />
                        </form>
                        <div class="login_w3ls">
                            <a href="userForgotPassword.jsp">Forgot Password</a>
                            <br/>
                            <a href="changePassword.jsp">Change Password</a>
                        </div>
                        <div>
                            <span style="color:white"><%=error%></span>
                        </div>

                    </div>
                    <div class="agile_its_registration">
                        <form action="userSignUp1.jsp" method="post" class="agile_form">
                            <p>Username</p>
                            <input type="text" name="username" required="required" />
                            <p>Email</p>
                            <input type="email" name="email" required="required" />
                            <p>Password</p>
                            <input type="password" name="password" id="password1"  required="required">
                            <p>Confirm Password</p>
                            <input type="password" name="Confirm Password" id="password2"  required="required">
                            <p>Phone Number</p>
                            <input type="text" name="phoneNo" required="required">
                            <p>Security Question</p>
                            <select name="secQuestion">
                                <option>What was your school name?</option>
                                <option>what was your first name?</option>
                                <option>whats ur fav sport?</option>
                                <option>whats ur hometown?</option>
                            </select>
                            <p>Security Answer</p>
                            <input type="text" required="required" name="secAnswer">

                            <div class="check w3_agileits">
                                <label class="checkbox w3"><input type="checkbox" name="checkbox" required="required" ><i> </i>I accept the terms and conditions</label>
                            </div>
                            <input type="submit" value="Signup"/>
                            <input type="reset" value="Reset" />
                        </form> 
                        <div>
                            <span style="color:white"><%=error1%></span>
                        </div>

                    </div>
                </div>
            </div>
            <!-- //Horizontal Tab -->
        </div>
        <div class="agileits_w3layouts_copyright text-center">
            <p>© 2017 Login and Signup Form. All rights reserved | Design by <a href="//irctc.com/">Dipshi Sharma</a></p>
        </div>
        <!--tabs-->
        <script src="js/easyResponsiveTabs.js"></script>
        <script type="text/javascript">
                                    $(document).ready(function ()
                                    {
                                        //Horizontal Tab
                                        $('#parentHorizontalTab_agile').easyResponsiveTabs({
                                            type: 'default', //Types: default, vertical, accordion
                                            width: 'auto', //auto or any width like 600px
                                            fit: true, // 100% fit in a container
                                            tabidentify: 'hor_1', // The tab groups identifier
                                            activate: function (event) { // Callback function if tab is switched
                                                var $tab = $(this);
                                                var $info = $('#nested-tabInfo');
                                                var $name = $('span', $info);
                                                $name.text($tab.text());
                                                $info.show();
                                            }
                                        });
                                    });
        </script>
        <script type="text/javascript">
            window.onload = function () {
                document.getElementById("password1").onchange = validatePassword;
                document.getElementById("password2").onchange = validatePassword;
            }
            function validatePassword() {
                var pass2 = document.getElementById("password2").value;
                var pass1 = document.getElementById("password1").value;
                if (pass1 != pass2)
                    document.getElementById("password2").setCustomValidity("Passwords Don't Match");
                else
                    document.getElementById("password2").setCustomValidity('');
                //empty string means no validation error
            }

        </script>
        <!--//tabs-->
    </body>
</html>

