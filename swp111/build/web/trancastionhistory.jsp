<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!--
                CSS
                ============================================= -->
        <style>
            .navbar-brand img {
                width: 150px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }
            .btn-view-detail,
            .btn-send-feedback {
                text-decoration: none;
                padding: 8px;
                border: 1px solid #dddddd;
                transition: background-color 0.3s ease;
                font-size: 16px;
                font-weight: bold;
                color: #333333;
                background-color: orange;
                border-radius: 5px;
            }

            .btn-view-detail:hover,
            .btn-send-feedback:hover {
                background-color: #007bff;
                color: #ffffff;
            }

        </style>
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
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

                                <li class="nav-item active"><a class="nav-link" href="getallproduct">Home</a></li>
                                    <c:if test="${sessionScope.user.is_admin == 1}">

                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                           aria-expanded="false">Management</a>
                                        <ul class="dropdown-menu">                                         
                                            <li class="nav-item"><a class="nav-link" href="LoadAccount">Manage account</a></li>
                                            <li class="nav-item"><a class="nav-link" href="load_all_requests_for_admin">Manage Conflict</a></li>
                                        </ul>
                                    </li>

                                </c:if>

                                <c:if test="${sessionScope.user != null}">
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                           aria-expanded="false">Payment</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" onclick="openDepositPopup()">Deposit</a></li>
                                                <c:if test="${sessionScope.user.is_admin == 1}">
                                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/withdrawListAdmin">Withdrawal Request</a></li>
                                                </c:if>
                                                <c:if test="${sessionScope.user.is_admin==0}">
                                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/withdrawList">Withdrawal Request</a></li>
                                                </c:if>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                           aria-expanded="false">Shop</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" href="getorderbyuserid">My Products</a></li>
                                            <li class="nav-item"><a class="nav-link" href="cart">My Orders</a></li>
                                            <li class="nav-item"><a class="nav-link" href="productSold">Products Sold</a></li>
                                        </ul>
                                    </li>                       
                                </c:if>
                                <c:if test="${sessionScope.user == null}">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="javascript:void(0)" onclick="openLoginPopup()">Login</a>
                                    </li>
                                </c:if>

                                <c:if test="${sessionScope.user!=null}">
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                           aria-expanded="false">Account</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                                            <li class="nav-item"><a class="nav-link" href="newscontroll">News</a></li>
                                            <li class="nav-item"><a class="nav-link" href="history">Transaction History</a></li>
                                            <li class="nav-item"><a class="nav-link" href="changepassword.jsp">Change Password</a></li>
                                            <li class="nav-item"><a class="nav-link" href="UpdateProfile.jsp">Update Profile</a></li>
                                        </ul>
                                    </li>                         
                                    <li style="padding-top: 10px">${balance}</li> 
                                    </c:if> 


                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <c:if test="${sessionScope.user!=null}">
                                    <li style="margin-top: 2px" class="nav-item"><a href="cart" class="cart"><span class="ti-bag"></span></a></li>
                                        </c:if> 
                                <li class="nav-item">
                                    <button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <!-- End Header Area -->

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Transaction History</h1>
                        <nav class="d-flex align-items-center">
                            <a href="history"Purchase History<span class="lnr lnr-arrow-right"></span></a>
                            <a href="soldhistory">Transaction History</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <!--================Cart Area =================-->
        <section class="cart_area">
            <div class="container" style="text-align: center; margin-top: -50px; margin-left: 4%">
                <h3 style="margin-left: 20%">Transaction History</h3>
                <div class="cart_inner">
                    <div class="table-responsive" style="width: 1400px">
                        <table class="table" style ="border-collapse: collapse; ">
                            <thead>
                                <tr>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Code</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Seller</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Status</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Topic</th>                                  
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Contact Method</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Price</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Bearing Transaction Fee</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Transaction Fee</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Actual Receive</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;">Purchase Time</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;width: 100px">Action</th>
                                    <th style="padding: 8px; border: 1px solid #dddddd;width: 100px">Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${history}">
                                    <tr>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.product_id}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.username}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.status}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.topic}</td>                                       
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.contactmethod}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.price}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.bearingtransactionfees}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.transactionfees}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.price+c.transactionfees}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;">${c.create_at}</td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;width: 150px"><a href="viewdetail?id=${c.product_id}" class="btn-view-detail">View Detail</a></td>
                                        <td style="padding: 8px; border: 1px solid #dddddd;width: 150px "><a href="sendfeedback?uid=${c.seller_id}&pid=${c.product_id}" class="btn-send-feedback">Send Feedback</a></td> 
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>


        <!--================End Cart Area =================-->

        

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
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>