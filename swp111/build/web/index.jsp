<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
%>

<html lang="zxx" class="no-js">

    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>SCLC</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!--
                CSS
                ============================================= -->
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/popup/PopupLogin.css">
        <style>
            .ordertable {
                margin-left: 0%;
                margin-right: 15%;
            }

            table {
                width: 140%;
                margin-left: 10%;
            }
            .navbar-brand img {
                width: 150px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }


            .login_popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 40%;
                height: 75%;
                z-index: 999;
            }

            .login_form_inner {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 30px;
                border-radius: 5px;
                position: relative;
            }

            .background_overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 998;
                display: none;
            }
            .close_button {
                position: absolute;
                top: 10px;
                right: 10px;
                border: none;
                background: none;
                cursor: pointer;
                font-size: 20px;
                color: #000;
            }

            .close_button:hover {
                color: #555;
            }

        </style>
    </head>

    <body>

        <!-- Start Header Area -->
        <%@ include file="Component/Header.jsp" %>
        <!-- End Header Area -->

        <!-- start banner Area -->
        <section class="banner-area">
            <div class="container">
                <div class="row fullscreen align-items-center justify-content-start">
                    <div class="col-lg-12">
                        <div class="active-banner-slider owl-carousel">
                            <!-- single-slide -->
                            <div class="row single-slide align-items-center d-flex">
                                <div class="col-lg-5 col-md-6">
                                    <div class="banner-content">
                                        <h1>SCLC<br>Welcome <span style="color: orange;">SCLC !</span></h1>
                                    </div>
                                </div>
                            </div>
                            <!-- single-slide -->
                            <div class="row single-slide align-items-center d-flex">
                                <div class="col-lg-5 col-md-6">
                                    <div class="banner-content">
                                        <h1>SCLC<br>Welcome <span style="color: orange;">SCLC !</span></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->
        <!-- End banner Area -->
        <div class="ordertable">
            <table  class="table table-striped table-hover">
                <thead>
                <th>id</th>
                <th>Status</th>
                <th>Seller</th>
                <th>Product</th>
                <th>Contact method</th>
                <th>Public/Private</th>
                <th>Price(VND)</th>
                <th>Bearing transaction fees</th>
                <th>Transaction fees</th>
                <th>Total pay</th>
                </thead>
                <tbody>
                    <c:forEach items="${ListProductI}" var="p">
                        <tr>
                            <th>${p.product_id}</a></th>
                            <th>${p.status}</th>
                            <th>${p.sellerName}</th>
                            <th>${p.topic}</th>
                            <th>${p.contactmethod}</th>
                            <th>${p.publicprivate}</th>
                            <th>${p.price}</th>
                            <th>${p.bearingtransactionfees}</th>
                            <th>${p.transactionfees}</th>
                            <th>${p.actualreceived}</th>
                        </tr>
                    </c:forEach>
                </tbody>    
            </table>
        </div>

        <!-- start footer Area -->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>About Us</h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore
                                magna aliqua.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Newsletter</h6>
                            <p>Stay update with our latest</p>
                            <div class="" id="mc_embed_signup">

                                <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                      method="get" class="form-inline">

                                    <div class="d-flex flex-row">

                                        <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '"
                                               required="" type="email">


                                        <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                                        <div style="position: absolute; left: -5000px;">
                                            <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                                        </div>

                                        <!-- <div class="col-lg-4 col-md-4">
                                                                <button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
                                                        </div>  -->
                                    </div>
                                    <div class="info"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget mail-chimp">
                            <h6 class="mb-20">Instragram Feed</h6>
                            <ul class="instafeed d-flex flex-wrap">
                                <li><img src="img/i1.jpg" alt=""></li>
                                <li><img src="img/i2.jpg" alt=""></li>
                                <li><img src="img/i3.jpg" alt=""></li>
                                <li><img src="img/i4.jpg" alt=""></li>
                                <li><img src="img/i5.jpg" alt=""></li>
                                <li><img src="img/i6.jpg" alt=""></li>
                                <li><img src="img/i7.jpg" alt=""></li>
                                <li><img src="img/i8.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Follow Us</h6>
                            <p>Let us be social</p>
                            <div class="footer-social d-flex align-items-center">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
                    <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </footer>
        <script>
            function refreshCaptcha() {
                // Perform AJAX request to refresh captcha
                $.ajax({
                    type: "GET",
                    url: "captchaGenerate",
                    success: function (response) {
                        // Update the captcha image source
                        $("#captchaImage").attr("src", "captchaGenerate");
                    },
                    error: function () {
                        // Handle error
                        console.error("Error refreshing captcha");
                    }
                });
            }
            function login() {
                var username = $("#username").val();
                var password = $("#password").val();
                var captcha = $("#captcha").val();

                // Perform AJAX request
                $.ajax({
                    type: "POST",
                    url: "logincontroller",
                    data: {
                        username: username,
                        password: password,
                        captchaEntered: captcha
                    },
                    success: function (response) {
                        if (response.trim() === "success") {
                            window.location.href = "getallproduct";
                        } else if (response.trim() === "error") {
                            // Display message for a banned account
                            $("#error").text("Your Account has been banned!");
                        } else {
                            // Display general error message
                            $("#error").text("Invalid username, password, or captcha");
                        }
                    },
                    error: function () {
                        // Handle error
                        $("#error").text("An error occurred during login");
                    }
                });
            }


        </script>
        <!-- End footer Area -->

        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>