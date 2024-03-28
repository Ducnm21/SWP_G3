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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto">
                            <c:if test="${sessionScope.user.is_admin == 1}">

                                <li class="nav-item submenu dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">Management</a>
                                    <ul class="dropdown-menu">                                         
                                        <li class="nav-item"><a class="nav-link" href="LoadAccount">Manage account</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#">Manage order</a></li>
                                    </ul>
                                </li>

                            </c:if>
                            <li class="nav-item active"><a class="nav-link" href="getallproduct">Home</a></li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">Payment</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" onclick="openDepositPopup()">Deposit</a></li>
                                    <li class="nav-item"><a class="nav-link" href="WithdrawalRequest.jsp">Withdrawal Request</a></li>
                                </ul>
                            </li>


                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">Shop</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="getorderbyuserid">My Products</a></li>
                                    <li class="nav-item"><a class="nav-link" href="cart">My Orders</a></li>
                                    <li class="nav-item"><a class="nav-link" href="productSold">Products Sold</a></li>
                                </ul>
                            </li>                       

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
                            <li style="margin-top: 2px" class="nav-item"><a href="cart" class="cart"><span class="ti-bag"></span></a></li>
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
                        <th><a href="product_detail_for_customer?pid=${p.product_id}">View</a></th>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
                                        function addToCart(productId) {
                                            $.ajax({
                                                type: "POST",
                                                url: "addtocart",
                                                data: {
                                                    id: productId
                                                },
                                                success: function (response) {
                                                    if (response.trim() === "success") {
                                                        showPopup("Product added to cart successfully!");
                                                    } else if (response.trim() === "duplicate") {
                                                        showPopup("Product is already in the cart!");
                                                    }
                                                },
                                                error: function () {
                                                    console.log("An error occurred during the AJAX request.");
                                                }
                                            });
                                        }

                                        function showPopup(message) {
                                            $("#popupMessage").text(message);
                                            $("#popup").show();

                                            // Tự động ẩn popup sau một khoảng thời gian
                                            setTimeout(function () {
                                                $("#popup").hide();
                                            }, 3000); // 3000 milliseconds (3 seconds) - bạn có thể điều chỉnh thời gian theo ý muốn
                                        }
                                        function addToCart(productId) {
                                            $.ajax({
                                                type: "POST",
                                                url: "addtocart",
                                                data: {
                                                    id: productId
                                                },
                                                success: function (response) {
                                                    if (response.trim() === "success") {
                                                        showPopup("Product added to cart successfully!");
                                                    } else if (response.trim() === "duplicate") {
                                                        showPopup("Product is already in the cart!");
                                                    }
                                                },
                                                error: function () {
                                                    console.log("An error occurred during the AJAX request.");
                                                }
                                            });
                                        }

                                        function showPopup(message) {
                                            $("#popupMessage").text(message);
                                            $("#popup").show();

                                            // Tự động ẩn popup sau một khoảng thời gian
                                            setTimeout(function () {
                                                $("#popup").hide();
                                            }, 3000); // 3000 milliseconds (3 seconds) - bạn có thể điều chỉnh thời gian theo ý muốn
                                        }

                                        document.getElementById('tien').addEventListener('input', function () {
                                            var numberInput = parseInt(this.value);
                                            var textOutput = numbered.stringify(numberInput);
                                            document.getElementById('number_text').value = textOutput;
                                        });
                                        window.addEventListener('DOMContentLoaded', function () { //bat event khi tai lai trang la doc luon
                                            var numberInput = document.getElementById('tien').value;
                                            var textOutput = numbered.stringify(parseInt(numberInput));
                                            document.getElementById('number_text').value = textOutput;
                                        });
                                        $(document).ready(function () {
                                            // Thực hiện kiểm tra ở đây, ví dụ:
                                            var userLoggedIn = "<%= session.getAttribute("user") != null %>";
                                            if (userLoggedIn) {
                                                $("#loginPopup").hide();
                                                $("#backgroundOverlay").hide();
                                            }
                                        });
                                        function LoadError() {
                                            var element = document.getElementById('naptien');
                                            var value = document.getElementById('tien').value;
                                            if (value < 10000) {
                                                element.type = "button";
                                            } else {
                                                element.type = "submit";
                                            }
                                            $.ajax({
                                                url: "ajaxServlet",
                                                type: "POST",
                                                data: {amount: $("#tien").val()}, // Gửi giá trị số tiền từ input với id là "tien" đến servlet
                                                success: function (response) {
                                                    var error = document.getElementById('error');
                                                    error.innerHTML = response;
                                                },
                                                error: function (xhr, status, error) {
                                                    console.error('Error:', error); // Xử lý lỗi nếu request không thành công
                                                }
                                            });
                                        }
                                        const btnpop_open = document.getElementById('btnpop-open');
                                        const btnpop_close = document.getElementById('btnpop-close');


    </script>
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
