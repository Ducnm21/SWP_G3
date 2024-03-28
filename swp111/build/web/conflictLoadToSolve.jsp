<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="css/conflictLoadToSolve.css">
        <style>
            .navbar-brand img {
                width: 150px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }
        </style>
        <script src="https://cdn.tiny.cloud/1/jbt73pkrs1o3fqdmhuk6ei1f1ldwnlfbskiepizspw8n7qbs/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    </head>
    <body>
        
        <header class="header_area sticky-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="homepage.jsp"><img src="img/logosclc.png" alt=""></a>
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
                                <li class="nav-item active"><a class="nav-link" href="homepage.jsp">Home</a></li>
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


        <div class="formto">


            <form action="resolveConflicts" method="post">
                <div class="solveform">
                    <div class="solveformhead">
                        <h2>Solve Conflict</h2>
                    </div>
                    <div class="solveformbody">
                        <div class="form-group">
                            <h3>ID</h3>
                            <input value="${ConflictSolving.requets_id}" name="requets_id" type="text" class="form_control" readonly>
                        </div>
                        <div class="form-group">
                            <h3>Status</h3>
                            <input value="${ConflictSolving.status}" name="status" type="text" class="form_control" readonly>
                        </div>
                        <div class="form-group">
                            <h3>SenderName</h3>
                            <input value="${ConflictSolving.senderName}" name="senderName" type="text" class="form_control" readonly>
                        </div>
                        <div class="form-group">
                            <h3>The right_side</h3> 
                            <input value="seller" type="radio" name="right_side"  required>Seller
                            <input value="buyer" type="radio" name="right_side" required>Customer
                        </div>
                    </div>
                    <div class="solveformend">
                        <div class="row">
                            <div class="col-sm-9">
                                <input type="submit" class="btn btn-success" value="Solve">
                            </div>
                            <div class="col-sm-3">
                                <p><button class="button" onclick='window.history.go(-1);'>Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
