<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>News</title>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <!DOCTYPE html>
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
    </style>
</head>        



<!-- Start Header Area -->
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
                        <c:if test="${sessionScope.user!=null}">
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">Account</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                                    <li class="nav-item"><a class="nav-link" href="newscontroll">News</a></li>
                                    <li class="nav-item"><a class="nav-link" href="changepassword.jsp">Change Password</a></li>
                                    <li class="nav-item"><a class="nav-link" href="UpdateProfile.jsp">Update Profile</a></li>
                                     <li class="nav-item"><a class="nav-link" href="history">Transaction History</a></li>
                                </ul>
                            </li>
                            <li style="padding-top: 10px">${balance}</li> 
                            </c:if>
                        
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
</head>
<body>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">News</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table">
                            <thead class="thead-primary">
                                <tr>
                                    <th>ID</th>
                                    <th>Content</th> 
                                    <th>Seen</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${newsList}" var="news">
                                    <tr>
                                        <td>${news.news_id}</td>
                                        <td>${news.content}</td> 
                                        <td id="readStatus_${news.news_id}">
                                            <c:if test="${news.is_seen == 0}">
                                                Chưa đọc
                                            </c:if>
                                            <c:if test="${news.is_seen != 0}">
                                                Đã đọc
                                            </c:if>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-warning text-white" onclick="showMessage('${news.product_id}', '${news.news_id}')">View</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Pagination -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                            <li class="page-item ${loop.index == currentPage ? 'active' : ''}">
                                <a class="page-link" href="newscontroll?page=${loop.index}">${loop.index}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- JavaScript -->
    <script src="js/jquery.min.js"></script>
    <script>
                                                function showMessage(productId, newsId) {
                                                    console.log(productId); // Make sure orderId is correctly logged
                                                    var message = "Đơn hàng có productId ID " + productId + " đã được đăng bán thành công.";
                                                    alert(message);

                                                    // Update read status to "Đã đọc"
                                                    document.getElementById("readStatus_" + newsId).innerHTML = "Đã đọc";
                                                    const url = 'detailoforder?pid=' + productId;
                                                    // Redirect to another page with the updated order ID

                                                    location.href = url;
                                                }

    </script>
</body>
</html>