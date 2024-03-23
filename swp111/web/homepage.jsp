<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                margin-left: 20.5%;
                padding: 20px;
                border: 1px solid #888;
                width: 58%; /* Điều chỉnh kích thước cửa sổ popup tại đây */
                height: 58%;
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
                z-index: -1;
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
                z-index: 999999999;
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
        <%@ include file="Component/Header.jsp" %>
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
        <%@ include file="Component/DepositPop.jsp" %>


        <div id="popup" style="display: none; text-align: center; color: red">
            <p id="popupMessage"></p>
        </div>
        <div class="ordertable">

            <table  class="table table-striped table-hover">
                <thead>
                <th>Detail</th>
                <th>Status</th>
                <th>Seller</th>
                <th>Product</th>
                <th style="width: 150px">Contact method</th>
                <th>Public/Private</th>
                <th style="width: 150px">Price(VND)</th>
                <th style="width: 150px">Incurred fee</th>
                <th style="width: 150px">Transaction fees</th>
                <th style="width: 150px">Actual payment</th>             
                <th>Action</th>

                </thead>
                <tbody>
                    <c:forEach items="${ListProduct}" var="p">
                        <tr>
                            <th><a class="linkpro" href="product_detail_for_customer?pid=${p.product_id}">View</a></th>
                            <th>${p.status}</th>
                            <th><a class="linkpro" href="sellerprofile?uid=${p.user_id}">${p.sellerName}</a></th>
                            <th>${p.topic}</th>
                            <th>${p.contactmethod}</th>
                            <th>${p.publicprivate}</th>
                            <th><fmt:formatNumber value="${p.price}" type="currency" currencySymbol=""/> &#x20AB</th>
                            <th>${p.bearingtransactionfees}</th>
                            <th><fmt:formatNumber value="${p.transactionfees}" type="currency" currencySymbol=""/> &#x20AB</th>

                            <th>
                                <c:choose>
                                    <c:when test="${p.bearingtransactionfees eq 'seller'}">
                                        <fmt:formatNumber value="${p.price - p.transactionfees}" type="currency" currencySymbol=""/> &#x20AB
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber value="${p.price}" type="currency" currencySymbol=""/> &#x20AB
                                    </c:otherwise>
                                </c:choose>
                            </th>

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