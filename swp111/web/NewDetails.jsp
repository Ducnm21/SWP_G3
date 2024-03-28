<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
        <title>Karma Shop</title>
        <style>
            .message{
                border: 5px solid #FF6600;
                border-radius: 20px;
                margin-top: 20px;
            }
            .message h2{
                text-align: center;
            }
            .hl{
                padding: 15px;
                font-size: 110%;
                font-family: sans-serif;
            }
            .highlight{
                color: #32CD32;
            }
            .button-area{
                margin-top: 20px;
            }
            .matchesbutton{
                border-radius: 10px;
                background-color: #32CD32;
                padding: 15px;
                color: white;
            }
            .requestadminbutton{
                border-radius: 10px;
                background-color: #FF6600;
                padding: 15px;
                color: white;
            }
            .ordertable {
                margin-left: 0%;
                margin-right: 15%;
            }

            table {
                width: 140%;
                margin-left: 10%;
            }
            .navbar-brand img {
                width: 100px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }
        </style>
        <!--
                CSS
                ============================================= -->
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/viewdetail.css"/>
    </head>

    <body>

        <!-- Start Header Area -->
        <header class="header_area sticky-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="getallproduct"><img src="img/logosclc.png" alt=""></a>                       

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <c:if test="${sessionScope.user.is_admin == 1}">
                                    <li class="nav-item active"><a class="nav-link" href="LoadAccount">Manage account</a></li>
                                    </c:if>
                                <li class="nav-item active"><a class="nav-link" href="getallproduct">Home</a></li>
                                <li class="nav-item submenu dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">Payment</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item"><a class="nav-link" href="Deposit.jsp">Deposit</a></li>
                                        <li class="nav-item"><a class="nav-link" href="single-blog.html"></a></li>
                                    </ul>
                                </li>


                                <li class="nav-item submenu dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">Shop</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item"><a class="nav-link" href="getallproduct">Public Market</a></li>
                                        <li class="nav-item"><a class="nav-link" href="getorderbyuserid">My Products</a></li>
                                        <li class="nav-item"><a class="nav-link" href="cart">My Orders</a></li>
                                    </ul>
                                </li>                       

                                <c:if test="${sessionScope.user == null}">
                                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                                    </c:if>



                                <c:if test="${sessionScope.user!=null}">
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                           aria-expanded="false">Account</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                                            <li class="nav-item"><a class="nav-link" href="newscontroll">News</a></li>
                                            <li class="nav-item"><a class="nav-link" href="changepassword.jsp">Change Password</a></li>
                                            <li class="nav-item"><a class="nav-link" href="UpdateProfile.jsp">Update Profile</a></li>
                                        </ul>
                                    </li>
                                    <li style="padding-top: 10px">${balance}</li> 
                                    </c:if>

                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="nav-item"><a href="cart" class="cart"><span class="ti-bag"></span></a></li>
                                <li class="nav-item">
                                    <button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>

        </header>
        <!-- End Banner Area -->

        <!--================Checkout Area =================-->
        <section class="checkout_area section_gap" >
            <div class="container" >

                <div class="billing_details">
                    <div class="row">
                        <div class="col-lg-7">
                            <h3>Product Details</h3>
                            <form class="row contact_form" novalidate="novalidate">
                                <c:set var="v" value="${viewdetail}" />

                                <div class="col-md-6 form-group p_star">
                                    Topic: <input type="text" class="form-control" id="first" name="name" value="${v.topic}" readonly>

                                </div>

                                <div class="col-md-6 form-group p_star">
                                    Contact Method: <input type="text" class="form-control" id="number" name="number"  value="${v.contactmethod}" readonly>

                                </div>

                                <div class="col-md-12 form-group p_star">
                                    Transaction Fee: <input type="text" class="form-control" id="add1" name="add1" value="${v.transactionfees}" readonly>

                                </div>
                                <div class="col-md-12 form-group p_star">
                                    Price: <input type="text" class="form-control" id="add1" name="add1" value="${v.price}" readonly>

                                </div>
                                <div class="col-md-12 form-group p_star">
                                    Purchase Time<input type="text" class="form-control" id="add1" name="add1" value="${v.created_at}" readonly>

                                </div>

                                <div class="col-md-12 form-group p_star">
                                    Description: <input type="text" class="form-control" id="add1" name="add1" value="${v.description}" readonly>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    Hidden Content: <input type="text" class="form-control" id="add1" name="add1" value="${v.hiddencontent}" readonly>

                                </div>
                            </form>

                        </div>
                        
                    </div>                    
                </div>
                
            </div>

        </section>

        <!--================End Checkout Area =================-->

        <!-- start footer Area -->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>About Us</h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                                ut labore dolore
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

                                        <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''"
                                               onblur="this.placeholder = 'Enter Email '" required="" type="email">


                                        <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right"
                                                                                     aria-hidden="true"></i></button>
                                        <div style="position: absolute; left: -5000px;">
                                            <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value=""
                                                   type="text">
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
        <!-- End footer Area -->


        <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>
        <script src="assets/js/jquery.ajaxchimp.min.js"></script>
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <script src="assets/js/jquery.sticky.js"></script>
        <script src="assets/js/nouislider.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="assets/js/gmaps.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>