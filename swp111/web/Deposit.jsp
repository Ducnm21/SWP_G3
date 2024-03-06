

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <!-- Site Title -->
        <title>SCLC</title>
        <link rel="stylesheet" href="css/popup/PopupDetails.css">
        <link rel="stylesheet" href="css/deposit.css">
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
                width: 100%; /* Giảm chiều rộng của bảng để tránh việc đè lên */
                margin-left: 0;
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

        <!-- Start Header Area -->
        <!--        <header class="header_area sticky-header">
                    <div class="main_menu">
                        <nav class="navbar navbar-expand-lg navbar-light main_box">
                            <div class="container">
                                Brand and toggle get grouped for better mobile display 
                                <a class="navbar-brand logo_h" href="homepage.jsp"><img src="img/logosclc.png" alt=""></a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <p style="color: orange">${hello}</p>
                                Collect the nav links, forms, and other content for toggling 
                                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                                    <ul class="nav navbar-nav menu_nav ml-auto">
        <c:if test="${sessionScope.user.is_admin == 1}">
            <li class="nav-item active"><a class="nav-link" href="LoadAccount">Manage account</a></li>
        </c:if>
        <c:if test="${sessionScope.user.is_admin == 0}">
        <li class="nav-item active"><a class="nav-link" href="getallproduct">Home</a></li>
        </c:if>
    <li class="nav-item submenu dropdown">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Payment</a>
        <ul class="dropdown-menu">
            <li class="nav-item"><a class="nav-link" href="Deposit.jsp">Deposit</a></li>
            <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
        </ul>
    </li>
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
            <li class="nav-item"><a class="nav-link" href="pmarket">Shop Category</a></li>
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
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        </c:if>
        <c:if test="${sessionScope.user != null}">
        <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
        </c:if>  
</ul>
</li>
<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
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
<div class="">
<form class="d-flex justify-content-between">
<input type="text" class="form-control" id="search_input" placeholder="Search Here">
<button type="submit" class="btn"></button>
<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
</form>
</div>
</div>

</header>-->
        <!-- End Header Area -->

        <!-- start banner Area -->
        <!-- ... (Giữ nguyên phần banner của bạn) ... -->
        <!-- End banner Area -->

        <div style="border: 1px solid #cccccc; padding: 20px; padding-top: 10px; margin-left: 15%; margin-right: 15% ">

            <div class="main_menu">
                <div class="modal_body" style="min-height: 0vh;margin-top: 2%">
                    <div class="modal_inner">
                        <!-- Deposit form-->
                        <div class="deposit-form">
                            <form action="ajaxServlet" id="frmCreateOrder" method="post">
                                <div class="deposit__header">
                                    <h2>DEPOSIT REQUEST</h2>
                                </div>
                                <table>
                                    <tr>
                                        <td style="padding-right:10px;">CHOOSE PAYMENT METHOD(*)</td>
                                        <td class="button">
                                            <div>
                                                <input type="radio" id="money1" value="" name="deposit_method" required>
                                                <label for="money1">PAYMENT GATEWAY (CHARGING AN ADDITIONAL 3% SERVICE FEE OR 3K FOR TRANSACTIONS BELOW 100K)</label>
                                            </div>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                        <td>Account (VND)(*)</td>
                                        <td><input id="tien" type="number" placeholder="Số tiền cần nạp (Tối thiểu 10,000 vnđ)" name="amount" oninput="formatCurrency(this)" required style="width: 626.85px" value="10000">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="des">Payment Description</td>
                                        <td><textarea type="text" id="description" class="description" placeholder="Ghi chú khoản nạp khi cần thiết" style="overflow-y: auto;width: 646.85px;padding-bottom: 60px;font-family: sans-serif"></textarea>
                                        </td>
                                    </tr>
                                </table>
                                <div class="deposit" style="padding-top:0" ><button onclick="LoadError()" type="submit" id="naptien">DEPOSIT</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/number.js"></script>
        <script>
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
                                    //        document.addEventListener('DOMContentLoaded', function () {
                                    //            var description = document.getElementById('description'); // Lấy thẻ textarea có id là "description"
                                    //
                                    //            // Lắng nghe sự kiện input trên thẻ textarea
                                    //            description.addEventListener('input', function () {
                                    //                this.style.height = 'auto'; // Thiết lập chiều cao tự động
                                    //                this.style.height = (this.scrollHeight) + 'px'; // Thiết lập chiều cao dựa trên chiều cao thực tế của văn bản
                                    //            });
                                    //
                                    //            // Gọi sự kiện input lần đầu để điều chỉnh chiều cao ban đầu của textarea
                                    //            description.dispatchEvent(new Event('input'));
                                    //        });
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


        </script>
        <script>
            const btnpop_open = document.getElementById('btnpop-open');
            const btnpop_close = document.getElementById('btnpop-close');

            const modalpop_container = document.getElementById
                    ('modalpop-container');

            btnpop_open.addEventListener('click', function () {    // Thêm class 'showpop' vào modalpop_container khi nút được nhấn
                modalpop_container.classList.add('showpop');
            });

            btnpop_close.addEventListener('click', function () {
                // Loại bỏ class 'showpop' khi nút close được nhấn
                modalpop_container.classList.remove('showpop');
            });
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
