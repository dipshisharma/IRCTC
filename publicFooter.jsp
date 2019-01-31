   <!-- footer section -->
        <div class="footer">
            <div class="container">
                <p>&copy; 2017 Capitalist. All Rights Reserved | Design by <a href="http://w3layouts.com/"> W3layouts </a></p>
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