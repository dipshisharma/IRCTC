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
                            <a class="navbar-brand" href="#"><h1>Travel Yaari</h1></a>
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
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- /navigation section -->
        <!-- banner section -->
        <div class="pogoSlider" id="js-main-slider">
            <div class="pogoSlider-slide" data-transition="shrinkReveal" data-duration="1000"  style="background-image:url(images/banner1.jpg);">
                <div class="pogoSlider-slide-element">
                    <h3>Travel To Explore</h3>
                </div>		
            </div>
            <div class="pogoSlider-slide " data-transition="shrinkReveal" data-duration="1000"  style="background-image:url(images/banner2.jpg);">
                <div class="pogoSlider-slide-element">
                    <h3>View your Train Route on Google Maps</h3>
                </div>
            </div>
            <div class="pogoSlider-slide " data-transition="shrinkReveal" data-duration="1000"  style="background-image:url(images/banner3.jpg);">
                <div class="pogoSlider-slide-element">
                    <h3>Get Instant Routes and Schedules for Flights</h3>
                </div>
            </div>
            <div class="pogoSlider-slide " data-transition="shrinkReveal" data-duration="1000"  style="background-image:url(images/banner4.jpg);">
                <div class="pogoSlider-slide-element">
                    <h3>One Place for Trains and Flights</h3>
                </div>
            </div>
        </div>
        <!-- /banner section -->
        <div class="agileits"></div>
        <!-- services section -->
        <section class="service-w3ls" id="service"> 
            <div class="container">
                <h3 class="text-center slideanim">Our Services</h3>
                <p class="text-center slideanim">The Website provides one place for both Trains and Flights.</p>
                <div id="myCarousel1" class="carousel slideanim" data-ride="carousel" data-interval="5000" data-pause="hover">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel1" data-slide-to="1"></li>
                        <li data-target="#myCarousel1" data-slide-to="2"></li>
                        <li data-target="#myCarousel1" data-slide-to="3"></li>
                    </ol>
                    <!-- Wrapper for slides -->	
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <div class="col-lg-6 col-md-6 serv-w3ls1">
                                <div class="col-xs-7 serv-agile1">
                                    <a href="stationAutocompleteRequest.jsp"><h4><b>View Trains</b></h4></a>
                                    <p class="serv-p1">Get All the Details of the Trains Running between two Stations on your desired date.Check Out the Exquisite Route of your Train on Google Maps along with the Seat Availability and Fare Amount.</p>
                                </div>
                                <div class="col-xs-5 serv-agile2">
                                    <img src="images/serv-img1.jpg" alt="w3ls" class="img-responsive">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-lg-6 col-md-6 serv-w3ls2">
                                <div class="col-xs-5 serv-agile2">
                                    <img src="images/serv-img2.jpg" alt="w3ls" class="img-responsive">
                                </div>
                                <div class="col-xs-7 serv-agile1">
                                    <a href="trainAutocompleteRequest.jsp"><h4><b>Live Tracking.</b> </h4></a>
                                    <p class="serv-p1">Plug in the Train Number and Track the Train seating at your place.</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="item">
                            <div class="col-lg-6 col-md-6 serv-w3ls1">
                                <div class="col-xs-7 serv-agile1">
                                    <a href="pnr_status.jsp"><h4><b>Exquisite PNR check. </b></h4></a>
                                    <p class="serv-p1">Plug in your PNR Number and view full details of the Train including Reservation, Boarding Details and the Chart Details.</p>
                                </div>
                                <div class="col-xs-5 serv-agile2">
                                    <img src="images/serv-img3.jpg" alt="w3ls" class="img-responsive">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-lg-6 col-md-6 serv-w3ls2">
                                <div class="col-xs-5 serv-agile2">
                                    <img src="images/serv-img4.jpg" alt="w3ls" class="img-responsive">
                                </div>
                                <div class="col-xs-7 serv-agile1">
                                    <a href="cancelled_rescheduledTrains.jsp"><h4><b>View Canceled and Rescheduled Trains.</b></h4></a>
                                    <p class="serv-p1">Exotic Facilities to check the Canceled and Rescheduled Trains sitting at your place by plugging in your Train Nymber or Name.</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div> 
                        <div class="item">
                            <div class="col-lg-6 col-md-6 serv-w3ls1">
                                <div class="col-xs-7 serv-agile1">
                                    <a href="viewFlights.jsp"><h4><b>View Flights </b></h4></a>
                                    <p class="serv-p1">Get All the Details of the Flights between two Places along with special features to view the <b>Details of the Flight, Baggage Details and the Total Fare.</b></p>
                                </div>
                                <div class="col-xs-5 serv-agile2">
                                    <img src="images/serv-img5.jpg" alt="w3ls" class="img-responsive">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-lg-6 col-md-6 serv-w3ls2">
                                <div class="col-xs-5 serv-agile2">
                                    <img src="images/serv-img6.jpg" alt="w3ls" class="img-responsive">
                                </div>
                                <div class="col-xs-7 serv-agile1">
                                    <a href="trackflights.jsp"><h4><b>Track Flights</b></h4></a>
                                    <p class="serv-p1">Plug in the Airline Code and Flight Number on a Specific Date to Track your Flight.</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="item">
                            <div class="col-lg-6 col-md-6 serv-w3ls1">
                                <div class="col-xs-7 serv-agile1">
                                    <a href="flightStatus.jsp"><h4><b>View Canceled and Rescheduled Flights </b></h4></a>
                                    <p class="serv-p1">Better Facilities to check the Canceled and Rescheduled Flights sitting at your place by plugging in your Flight Number or Name.</p>
                                </div>
                                <div class="col-xs-5 serv-agile2">
                                    <img src="images/serv-img7.jpg" alt="w3ls" class="img-responsive">
                                </div>
                                <div class="clearfix"></div>
                            </div>
<!--                            <div class="col-lg-6 col-md-6 serv-w3ls2">
                                <div class="col-xs-5 serv-agile2">
                                    <img src="images/serv-img4.jpg" alt="w3ls" class="img-responsive">
                                </div>
                                <div class="col-xs-7 serv-agile1">
                                    <a href="trackflights.jsp"><h4><b>View Flights on Map </b></h4></a>
                                    <p class="serv-p1">View all your Flights and their Routes on Google Maps.</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>-->
                            <!--<div class="clearfix"></div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /services section -->
        <div class="agileinfo"></div>
        <!-- divider section -->
        <section class="divider slideanim">
            <div class="container">
                <h2 class="text-center slideanim">One Platform for booking both Trains and Flights.</h2>
                <a href="#" data-toggle="modal" data-target="#largeModal" class="slideanim">Read More</a>	
            </div>
            <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">About Us</h4>
                        </div>
                        <div class="modal-body">

                            <div class="col-lg-6 col-md-6">
                                <img src="images/about.jpg" class="img-responsive" alt="w3layouts" title="w3layouts">
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <p class="banner-p1">The Website Provides One Platform for both Trains & Flights along with the prime features including Live Tracking of Trains, Viewing Routes of both Trains and Flights on Google Maps, View Canceled & Rescheduled Trains/Flights and so much more... </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-lg btn-success" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /divider section -->
        <div class="wthree"></div>
        <!-- work section -->
        <section class="work" id="work">
            <h3 class="text-center slideanim">Gallery</h3>
            <p class="text-center slideanim">The Website provides one Platform for both Trains and Flights.</p>
            <div class="gallery-grids">
                <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs cl-effect-4 slideanim" role="tablist">
                        <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">All</a></li>
                        <li role="presentation"><a href="#trade" role="tab" id="trade-tab" data-toggle="tab" aria-controls="trade">Trains</a></li>
                        <li role="presentation"><a href="#business" role="tab" id="business-tab" data-toggle="tab" aria-controls="business">Flights</a></li>
                        <li role="presentation"><a href="#finance" role="tab" id="finance-tab" data-toggle="tab" aria-controls="finance">Stations</a></li>
                        <li role="presentation"><a href="#economics" role="tab" id="economics-tab" data-toggle="tab" aria-controls="economics">Airports</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                            <div class="tab_img">
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work1.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work1.jpg" class="img-responsive" alt="w3ls" />
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Trains</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work2.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work2.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Trains</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work3.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work3.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Trains</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work4.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work4.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Flights</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="tab_img">
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work5.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work5.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Flights</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work6.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work6.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Flights</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work7.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work7.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Stations</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work8.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work8.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Stations</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work9.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work9.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Stations</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work10.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work10.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Airports</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work11.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work11.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Airports</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work12.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="1">
                                        <img src="images/work12.jpg" class="img-responsive" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Airports</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="trade" aria-labelledby="trade-tab">
                            <div class="tab_img">
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work1.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="2">
                                        <img src="images/work1.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Train</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work2.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="2">
                                        <img src="images/work2.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Train</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work3.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="2">
                                        <img src="images/work3.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Train</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>	
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="business" aria-labelledby="business-tab">
                            <div class="tab_img">
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work4.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="3">
                                        <img src="images/work4.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Flights</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work5.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="3">
                                        <img src="images/work5.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Flights</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work6.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="3">
                                        <img src="images/work6.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Flights</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>	
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="finance" aria-labelledby="finance-tab">
                            <div class="tab_img">
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work9.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="4">
                                        <img src="images/work9.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Station</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work7.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="4">
                                        <img src="images/work7.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Station</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work8.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="4">
                                        <img src="images/work8.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Station</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>	
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="economics" aria-labelledby="economics-tab">
                            <div class="tab_img">
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work12.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="5">
                                        <img src="images/work12.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Airports</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work10.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="5">
                                        <img src="images/work10.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Airports</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-6 portfolio-grids slideanim">
                                    <a href="images/work11.jpg" class="b-link-stripe b-animate-go lightninBox" data-lb-group="5">
                                        <img src="images/work11.jpg" class="img-responsive zoom-img" alt="w3ls"/>
                                        <div class="b-wrapper">
                                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                                            <h5>Airports</h5>
                                        </div>
                                    </a>
                                </div>
                                <div class="clearfix"> </div>
                            </div>	
                        </div>
                    </div>
                </div>
            </div>	
        </section>
        <!-- /portfolio section -->
        <div class="w3layout"></div>
        <!-- testimonial section -->
        <section class="test" id="testimonial">
            <div class="container">
                <h3 class="text-center slideanim">Our Testimonials</h3>
                <p class="text-center slideanim">One Platform for both Trains and Flights.</p>
                <div id="myCarousel2" class="carousel slideanim" data-ride="carousel" data-interval="2000" data-pause="hover">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel2" data-slide-to="1"></li>
                        <!--<li data-target="#myCarousel2" data-slide-to="2"></li>-->
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 test-info1">
                                    <div class="test-details">	
                                        <div class="test-w3ls">
                                            <h5>Dipshi Sharma</h5>
                                            <p class="test-p1">Project Lead, applied major efforts in coding and developing most of the logics.Also supervised all major tasks.</p>
                                        </div>
                                        <div class="test-agile">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 test-detail1">
                                                <img src="images/dipshi.jpg" alt="w3layouts" title="w3layouts" class="img-circle img-responsive">
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 test-detail2">
                                                <h4>Dipshi Sharma</h4>
                                                <p class="test-p2">Founder.</p>
                                            </div>
                                            <div class="clearfix"></div>	
                                        </div>
                                    </div>	
                                </div>
                                <div class="col-lg-6 col-md-6 test-info2">
                                    <div class="test-details">
                                        <div class="test-w3ls">
                                            <h5>Akshit Parwal</h5>
                                            <p class="test-p1">Played a major role in testing and debugging all the logics.</p>
                                        </div>
                                        <div class="test-agile">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 test-detail1">
                                                <img src="images/akshit.jpg" alt="w3layouts" title="w3layouts" class="img-circle img-responsive">
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 test-detail2">
                                                <h4>Akshit Parwal</h4>
                                                <p class="test-p2">Senior Associate.</p>
                                            </div>
                                            <div class="clearfix"></div>	
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>	
                        <div class="item">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 test-info1">
                                    <div class="test-details">
                                        <div class="test-w3ls">
                                            <h5>Davleen Mand</h5>
                                            <p class="test-p1">Had an important role to play in Designing of the website.</p>
                                        </div>
                                        <div class="test-agile">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 test-detail1">
                                                <img src="images/davleen.jpg" alt="w3layouts" title="w3layouts" class="img-circle img-responsive">
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 test-detail2">
                                                <h4>Davleen Mand</h4>
                                                <p class="test-p2">Senior Associate.</p>
                                            </div>
                                            <div class="clearfix"></div>	
                                        </div>
                                    </div>
                                </div>	
<!--                                <div class="col-lg-6 col-md-6 test-info2">
                                    <div class="test-details">	
                                        <div class="test-w3ls">
                                            <h5>ut tempus finibus</h5>
                                            <p class="test-p1">In rutrum massa ut tempus finibus. Integer auctor pulvinar libero vitae varius. Phasellus eget placerat mauris. Pellentesque pretium, urna vitae finibus mattis quam nisi.</p>
                                        </div>
                                        <div class="test-agile">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 test-detail1">
                                                <img src="images/test-img4.jpg" alt="w3layouts" title="w3layouts" class="img-circle img-responsive">
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 test-detail2">
                                                <h4>Monica Belucci</h4>
                                                <p class="test-p2">Manager, Munich</p>
                                            </div>
                                            <div class="clearfix"></div>	
                                        </div>
                                    </div>
                                </div>-->
                            </div> 
                        </div>	
<!--                        <div class="item">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 test-info1">
                                    <div class="test-details">	
                                        <div class="test-w3ls">
                                            <h5>Nam convallis augue</h5>
                                            <p class="test-p1">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam convallis augue at auctor mollis. Aliquam sollicitudin accumsan scelerisque. Sed aliquet elit vitae ex posuere.</p>
                                        </div>
                                        <div class="test-agile">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 test-detail1">
                                                <img src="images/test-img5.jpg" alt="w3layouts" title="w3layouts" class="img-circle img-responsive">
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 test-detail2">
                                                <h4>John Doe</h4>
                                                <p class="test-p2">Supervisor, Melbourne</p>
                                            </div>
                                            <div class="clearfix"></div>	
                                        </div>
                                    </div>
                                </div>	
                                <div class="col-lg-6 col-md-6 test-info2">
                                    <div class="test-details">	
                                        <div class="test-w3ls">
                                            <h5>Pellentesque pretium</h5>
                                            <p class="test-p1">In rutrum massa ut tempus finibus. Integer auctor pulvinar libero vitae varius. Phasellus eget placerat mauris. Pellentesque pretium, urna vitae finibus mattis quam nisi.</p>
                                        </div>
                                        <div class="test-agile">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 test-detail1">
                                                <img src="images/test-img6.jpg" alt="w3layouts" title="w3layouts" class="img-circle img-responsive">
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 test-detail2">
                                                <h4>Natasha</h4>
                                                <p class="test-p2">Chairman, Brassels</p>
                                            </div>
                                            <div class="clear-fix"></div>	
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>	
        </section>
        <!-- /testimonial section -->
        <!-- subscribe section -->
        <section class="subs slideanim">
            <div class="container">
                <div class="col-lg-6 col-md-6 subs-w3ls1 slideanim">
                    <h3>Subscribe To Us</h3>
                    <p>Subscribe us to get exclusive Discounts and Coupons along with regular notifications about your trains and Flights.Get exclusive mails regarding your preferred locations and great packages as well.</p>
                </div>
                <div class="col-lg-6 col-md-6 subs-w3ls1 slideanim">
                    <div class="subscribe">
                        <form action="#" method="post">
                            <div class="form-group1">
                                <input class="form-control" id="email" name="email" placeholder="Enter Your Email Address" type="email" required>
                            </div>
                            <div class="form-group2">
                                <button class="btn btn-outline btn-lg" type="submit">Subscribe</button>
                            </div>
                            <div class="clearfix"></div>
                        </form>
                    </div>	
                </div>
                <div class="clearfix"></div>
            </div>
        </section>
        <!-- /subscribe section -->
        <!-- map section -->
        <div class="map slideanim">
            <iframe class="googlemaps" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d380510.6741687111!2d-88.01234121699822!3d41.83390417061058!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1455598377120" style="border:0" allowfullscreen></iframe>
        </div>
        <!-- /map section -->
        <!--         contact section 
                <section class="contact-w3ls" id="contact">
                    <div class="container">
                        <h3 class="text-center slideanim">Follow Us</h3>
                        <ul class="social-icons1">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-whatsapp"></i></a></li>
                            <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>	
                    </div>
                </section>
                 /contact section -->
        <!-- footer section -->
        <div class="footer">
            <div class="container">
                <p>&copy; 2017 Capitalist. All Rights Reserved | Design by Dipshi Sharma </a></p>
            </div>
        </div>
        <!-- /footer section -->
        <a href="#0" class="cd-top">Top</a>
        <!-- js files -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/SmoothScroll.min.js"></script>
        <script src="js/top.js"></script> 
        <script src="js/jQuery.lightninBox.js"></script>
        <script type="text/javascript">
                                    $(".lightninBox").lightninBox();
        </script>
        <script>
            $(document).ready(function () {
                // Add smooth scrolling to all links in navbar + footer link
                $(".navbar li a").on('click', function (event) {

                    // Make sure this.hash has a value before overriding default behavior
                    if (this.hash !== "") {

                        // Store hash
                        var hash = this.hash;

                        // Using jQuery's animate() method to add smooth page scroll
                        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                        $('html, body').animate({
                            scrollTop: $(hash).offset().top
                        }, 900, function () {

                            // Add hash (#) to URL when done scrolling (default click behavior)
                            window.location.hash = hash;
                        });
                    } // End if
                });
            })
        </script>
        <script>
            $(window).scroll(function () {
                $(".slideanim").each(function () {
                    var pos = $(this).offset().top;

                    var winTop = $(window).scrollTop();
                    if (pos < winTop + 600) {
                        $(this).addClass("slide");
                    }
                });
            });
        </script>	
        <script src="js/jquery.pogo-slider.min.js"></script>
        <script src="js/main.js"></script>
        <!-- /js files -->
    </body>
</html>