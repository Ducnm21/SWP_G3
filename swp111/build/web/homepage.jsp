<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
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
        <link rel="stylesheet" href="css/deposit.css">
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
            .modal {
                display: none; /* Ẩn cửa sổ popup ban đầu */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Màu nền mờ */
                z-index: 1; /* Hiển thị cửa sổ popup trên cùng */
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15%;
                padding: 20px;
                border: 1px solid #888;
                width: 70%; /* Điều chỉnh kích thước cửa sổ popup tại đây */
                border-radius: 10px;
                position: relative;
            }

            /* Đóng cửa sổ popup khi nhấp chuột vào nền mờ */
            .modal-background {
                width: 100%;
                height: 100%;
                position: fixed;
                top: 0;
                left: 0;
                cursor: pointer;
            }


            button#btnpop-open{
                background: rgb(2,133,229);
                color: #FFF;
                border: none;
                padding: 5px 15px;
                cursor: pointer;
                box-shadow: 0px 2px 4px rgba(0,0,0,0.5);
            }
            #modalpop-container{
                height: 100vh;
                width: 100%;
                background: rgba(0,0,0,0.5);
                position: fixed;
                top: 0;
                left: 0;
                z-index: 999999;
                opacity: 0;
                pointer-events: none;
            }
            #modalpop-container.showpop{
                opacity: 1;
                pointer-events: all;
            }
            #modalpop{
                background: #fff;
                max-width: 1000px;
                position: relative;
                left: 50%;
                top: 5%;
                transform: translateX(-50%);
            }
            #modalpop .modalpop-header{
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 5px 20px;
                border-bottom: 2px solid #dedede;
            }
            #modalpop .modalpop-header h3{
                margin: 0;
            }
            button#btnpop-close{
                outline: none;
                border: none;
                background: none;
                font-size: 20px;
            }
            #modalpop .modalpop-body{
                padding: 10px 20px 15px;
                width: 100%; /* Thêm dòng này để làm cho nội dung fit toàn bộ thẻ */
                box-sizing: border-box; /* Bảo đảm tính toàn vẹn của box model */
                padding: 10px 20px 15px;
            }
            .modalpop-body {
                max-height: 70vh; /* Giảm chiều cao tối đa để tránh tràn ngoài màn hình */
                overflow-y: auto; /* Thêm thanh cuộn nếu nội dung quá dài */
            }

            .tablepop {
                width: 100%;
                border-collapse: collapse; /* Loại bỏ khoảng cách giữa các ô */
                margin-left: 0px;
            }

            .tablepop th, .tablepop td {
                padding: 8px; /* Thêm padding để tạo ra khoảng cách giữa nội dung và biên của ô */
                border: 1px solid #ddd; /* Thêm đường biên */

            }
        </style>

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
                                    <li class="nav-item"><a class="nav-link" href="getallproductindex">Login</a></li>
                                    </c:if>

                                <c:if test="${sessionScope.user!=null}">
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                           aria-expanded="false">Account</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" href="getallproductindex">Logout</a></li>
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


            <!-- Search -->
            <div class="search_input" id="search_input_box">
                <div class="container">
                    <form method="Post" action="search" class="d-flex justify-content-between">
                        <input name="inputSearch" type="text" class="form-control" id="search_input" placeholder="Search Here">
                        <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>


        </header>
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
                                        <h1>SCLC<br>Welcome <span style="color: orange;">${user.fullname}!</span></h1>
                                    </div>
                                </div>
                            </div>
                            <!-- single-slide -->
                            <div class="row single-slide align-items-center d-flex">
                                <div class="col-lg-5 col-md-6">
                                    <div class="banner-content">
                                        <h1>SCLC<br>Welcome <span style="color: orange;">${user.fullname}!</span></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->


        <!-- Deposit Popup-->
        <div id="depositModal" class="modal">
            <div class="modal-content">
                <div class="modal-background" onclick="closeDepositPopup()"></div>

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
        </div>
    </div>


    <div id="popup" style="display: none; text-align: center; color: red">
        <p id="popupMessage"></p>
    </div>
    <div class="ordertable">

        <table  class="table table-striped table-hover">
            <thead>
            <th style="text-align: justify">id</th>
            <th>Status</th>
            <th>Seller</th>
            <th>Product</th>
            <th>Contact method</th>
            <th>Public/Private</th>
            <th>Price(VND)</th>
            <th>Bearing transaction fees</th>
            <th>Transaction fees</th>
            <th>Actual $ received</th>             
            <th>Action</th>

            </thead>
            <tbody>
                <c:forEach items="${ListProduct}" var="p">
                    <tr>
                        <th><a href="detailoforder?pid=${p.product_id}">${p.product_id}</a></th>
                        <th>${p.status}</th>
                        <th><a href="sellerprofile?uid=${p.user_id}">${p.sellerName}</a></th>
                        <th>${p.topic}</th>
                        <th>${p.contactmethod}</th>
                        <th>${p.publicprivate}</th> 
                        <th>${p.price}</th>
                        <th>${p.bearingtransactionfees}</th>
                        <th>${p.transactionfees}</th>
                        <th>${p.actualreceived}</th>

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

                                        const modalpop_container = document.getElementById
                                                ('modalpop-container');
                                                
                                                
                                        function openDepositPopup() {
                                            var modal = document.getElementById("depositModal");
                                            modal.style.display = "block";
                                        }

                                        // Hàm đóng popup
                                        function closeDepositPopup() {
                                            var modal = document.getElementById("depositModal");
                                            modal.style.display = "none";
                                        }
                                        btnpop_open.addEventListener('click', function () {    // Thêm class 'showpop' vào modalpop_container khi nút được nhấn
                                            modalpop_container.classList.add('showpop');
                                        });

                                        btnpop_close.addEventListener('click', function () {
                                            // Loại bỏ class 'showpop' khi nút close được nhấn
                                            modalpop_container.classList.remove('showpop');
                                        });

    </script>

    <div id="modalpop-container">
        <div id="modalpop">
            <div class="modalpop-header">
                <h3>Details</h3>
                <button id="btnpop-close"><i class="fa-solid fa-xmark"></i></button>
            </div>
            <div class="modalpop-body">
                <table class="tablepop">
                    <thead>
                        <tr>
                            <th>Information</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>t
                            <td>Order Code</td>
                            <td>${product_idp}</td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td>${statusp}</td>
                        </tr>
                        <tr>
                            <td>Customer</td>
                            <td>${customerp}</td>
                        </tr>
                        <tr>
                            <td>Title</td>
                            <td>${topicp}</td>
                        </tr>
                        <tr>
                            <td>Contact method</td>
                            <td>${contactmethodp}</td>
                        </tr>
                        <tr>
                            <td>Public/Private</td>
                            <td>${publicprivatep}</td>
                        </tr>
                        <tr>
                            <td>Price(VND)</td>
                            <td>${pricep}</td>
                        </tr>
                        <tr>
                            <td>Bearing transaction fees</td>
                            <td>${bearingtransactionfeesp}</td>
                        </tr>
                        <tr>
                            <td>Transaction fees</td>
                            <td>${transactionfeesp}</td>
                        </tr>
                        <tr>
                            <td>Actual $ received</td>
                            <td>${actualreceivedp}</td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>${descriptionp}</td>
                        </tr>
                        <tr>
                            <td>Hidden content</td>
                            <td>${hiddencontentp}</td>
                        </tr>
                        <tr>
                            <td>Create at</td>
                            <td>${created_atp}</td>
                        </tr>
                        <tr>
                            <td>Update at</td>
                            <td>${updated_atp}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
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