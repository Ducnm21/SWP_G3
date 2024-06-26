
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
        <title>SCLC</title>
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
        <style>
            .navbar-brand img {
                width: 150px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }
            /* Center the navbar */
            .navbar-nav.navbar-center {
                position: absolute;
                left: 20%;
                bottom: 50%;
                transform: translateX(-50%);
            }

            /* Style for the search container */
            .search_input {
                display: flex;
                align-items: center;
            }

            /* Style for the search input */
            .search_input input[type="text"] {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-right: 0px;
                width: 300px;
            }

            /* Style for the search button */
            .search_input button {
                padding: 6px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>        

    <body>
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Conflict management</h1>
                        <nav class="d-flex align-items-center">
                            <a href="#">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Conflict management</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
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
                                <li style="padding-top: 10px">${AdminBalance}</li> 

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
            <div class="search_input" id="search_input_box">
                <div class="container">
                    <form class="d-flex justify-content-between">
                        <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                        <button type="submit" class="btn"></button>
                        <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>
        </header>
        <!-- End Header Area -->

        
        <div class="donbanhead" style="text-align: center; margin-left: 20%">
            <div class="row">
                <div class="col-lg-9">
                    <h2>Conflict management</h2>
                </div>
            </div>
        </div>
        <div class="ordertable" style="padding-left: 5%; padding-right: 5%">
            <table class="table table-striped table-hover">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Status</th>
                        <th>Sender</th>
                        <th>right side</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>                    
                    <c:forEach items="${ListConflict}" var="c">
                        <tr>
                            <td>${c.requets_id}</td>
                            <td>${c.status}</td>
                            <td>${c.senderName}</td>
                            <td>${c.right_side}</td>                          
                            <c:if test="${c.status eq 'Pending'}">
                                <td><a href="conflictLoadToSolve?requets_id=${c.requets_id}">Solve</a></td>                                         
                            </c:if>
                            <c:if test="${c.status eq 'Checked'}">
                                <td><a href="nextstep?pid=${c.product_id}">Banking Transfer</a></td>                                         
                            </c:if>
                            <c:if test="${c.status eq 'Done'}">
                                <td><div style="color: green" >Success</div></td>                                         
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div><!--


        <!-- start footer Area -->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>SCLC System</h6>
                            <p>
                                This Online Intermediary Marketplace Project is a website that specializes in intermediating purchases and orders from users, 
                                promoting security and reputation, avoiding cases of fraud when purchasing at other common shopping websites.
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
            </div>
        </footer>
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