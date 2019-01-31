<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script>
            function go()
            {
                var xmlHttp = new XMLHttpRequest();

                var email = document.getElementById("email").value;

                xmlHttp.open("GET", "userForgotPassword2.jsp?email=" + email, true);
                xmlHttp.onreadystatechange = function ()
                {

                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
                    {
                        document.getElementById("d1").innerHTML = xmlHttp.responseText;
                    }
                };
                xmlHttp.send();
            }
            function go1()
            {
                var xmlHttp = new XMLHttpRequest();
                var email = document.getElementById("email").value;
                var secQues = document.getElementById("secQues").value;
                var secAnswer = document.getElementById("secAnswer").value;
                xmlHttp.onreadystatechange = function ()
                {

                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
                    {

                        document.getElementById("d2").innerHTML = xmlHttp.responseText;
                    }
                };
                xmlHttp.open("GET", "userForgotPassword3.jsp?email=" + email + "&secQues=" + secQues + "&secAnswer=" + secAnswer, true);

                xmlHttp.send();
            }
        </script>
    </head>
    <body class="bg agileinfo" style="background-image: url(images/banner1.jpg)">
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
        <h1 style="color: white">Enter Details</h1>  
        <br>
        <table>
            <tr>
                <td><span style="color: white">Email&nbsp;</span></td>
                <td><input type="text" class="bg-info" placeholder="Enter Email" id="email" required="required"></td>
            </tr>

        </table>
        <div id="d1">
            <br>
            <input type="button" class="btn btn-primary btn-group-sm"  value="Submit" onclick="go()">
        </div>
        <div id="d2">

        </div>
    </center>
    <br><br>
    <br><br>
    <br><br>
    <br><br>
    <br><br>
    <br><br>
    <%@include file="publicFooter.jsp" %>
</body>
</html>
