<%-- 
    Document   : sellerprofile
    Created on : Mar 9, 2024, 3:42:29 PM
    Author     : VIVO-S15
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <link rel="stylesheet" href="css/sellerprofile.css"/>
        <style>
            .navbar-brand img {
                width: 150px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }
        </style>
    </head>
</head>
<body>
    <header class="header_area sticky-header">
        <div class="main_menu">
            <nav class="navbar navbar-expand-lg navbar-light main_box">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <a class="navbar-brand logo_h" href="getallproduct"><img src="img/logosclc.png" alt=""></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <p style="color: orange">${hello}</p>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto">
                            <li class="nav-item active"><a class="nav-link" href="getallproduct">Home</a></li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">MiddleMan</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="pmarket.jsp">Public Market</a></li>
                                    <li class="nav-item"><a class="nav-link" href="getorderbyuserid">My Products</a></li>
                                    <li class="nav-item"><a class="nav-link" href="donmuacuatoi.jsp">My Orders</a></li>
                                </ul>
                            </li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">Shop</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="category.html">Shop Category</a></li>
                                    <li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
                                    <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                                    <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
                                    <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                                </ul>
                            </li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                                    <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">Pages</a>
                                <ul class="dropdown-menu">
                                    <c:if test="${sessionScope.user == null}">
                                        <li class="nav-item"><a class="nav-link" href="getallproductindex">Login</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                        <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                                        <li class="nav-item"><a class="nav-link" href="newscontroll">News</a></li>
                                        <li class="nav-item"><a class="nav-link" href="changepassword.jsp">Change Password</a></li>
                                        <li class="nav-item"><a class="nav-link" href="UpdateProfile.jsp">Update Profile</a></li>
                                        </c:if>  
                                    <li class="nav-item"><a class="nav-link" href="tracking.html">Tracking</a></li>
                                    <li class="nav-item"><a class="nav-link" href="elements.html">Elements</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="nav-item"><a href="#" class="cart"><span class="ti-bag"></span></a></li>
                            <li class="nav-item">
                                <button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <div class="row">
        <div class="col-lg-6">
            <div class="detailform">
                <div>
                    <h2>${userdetail.username}</h2>
                </div>
                
                <table class="table table-striped table-hover">
                    <tr>
                        <td>Full name</td>
                        <td>${userdetail.fullname}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>${userdetail.email}</td>
                    </tr>
                    <tr>
                        <td>Phone number</td>
                        <td>${userdetail.mobile}</td>
                    </tr>
                    <tr>
                        <td>Start date</td>
                        <td>${userdetail.created_at}</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="feedback" style="overflow: auto; height: 203px;" >
                <div class="fixed-header">
                    <h3>Feedback for ${userdetail.username}</h3>
                </div>
                <c:forEach items="${feedback}" var="fb">
                    <div class="feedbackblock">
                        <h4>From: ${fb.sender_username}</h4>
                        <p>.${fb.content}</p>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>

    <div class="product">
        <h3>${userdetail.username}'s Product</h3>
        <table  class="table table-striped table-hover">
            <thead>
            <th>Detail</th>
            <th>Title</th>
            <th>Contact method</th>
            <th>Price(VND)</th>
            <th>Bearing transaction fees</th>
            <th>Transaction fees</th>
            <th>Action</th>
            </thead>
            <tbody>
                <c:forEach items="${sellerproduct}" var="p">
                    <tr>
                        <th><a href="detailoforder?pid=${p.product_id}">View</a></th>
                        <th>${p.topic}</th>
                        <th>${p.contactmethod}</th>
                        <th>${p.price}</th>
                        <th>${p.bearingtransactionfees}</th>
                        <th>${p.transactionfees}</th>
                        <td>
                            <c:choose>
                                <c:when test="${p.user_id ne sessionScope.user.id}">
                                    <button type="button" class="btn" onclick="addToCart(${p.product_id})">Add to cart</button>
                                </c:when>
                                <c:otherwise>
                                    <span>You cannot buy your own product</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>    
        </table>
    </div>     

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
