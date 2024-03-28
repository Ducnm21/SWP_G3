<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <!-- Site Title -->
        <title>SCLC</title>
        <link rel="stylesheet" href="css/popup/PopupDetails.css">
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
        </style>

    </head>        
    <body>
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

        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Update Profile</h1>
                        <nav class="d-flex align-items-center">
                            <a href="#">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Update Profile</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>

        <div class="d-flex">     

            <div class="container mt-12" style="margin-bottom: 20px;margin-top:  20px" >
                <h1 style="margin-bottom: 40px; color: orange">Update Your Profile</h1>
                <form action="updateprofile" method="post">
                    <input value="${user.id}" name="id" hidden="">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4" style="font-weight: bold">Email</label>
                            <input type="email" class="form-control" id="inputEmail4" placeholder="Email" value="${user.email}" name="email" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputUsername4" style="font-weight: bold">Username </label>
                            <input type="text" class="form-control" id="inputUsername4" placeholder="Username" value="${user.username}" name="username">
                            <c:if test="${not empty requestScope.error_username_taken}">
                                <span style="color: orange">${requestScope.error_username_taken}</span>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="phone" style="font-weight: bold">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${user.mobile}">
                            <!-- Hiển thị thông báo lỗi nếu có -->
                            <c:if test="${not empty requestScope.error_phone_taken}">
                                <span style="color: orange">${requestScope.error_phone_taken}</span>
                            </c:if>
                            <c:if test="${not empty requestScope.error_phone_invalid}">
                                <span style="color: orange">${requestScope.error_phone_invalid}</span>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="Fullname" style="font-weight: bold">Fullname </label>
                            <input type="text" class="form-control" id="Fullname" placeholder="Fullname" value="${user.fullname}" name="fullname">
                        </div>
                    </div>
                    <button style="background-color: orange" type="submit" class="btn btn-primary updateBtn">Update</button>
                </form>
            </div>
        </div>

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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </body>

</html>
