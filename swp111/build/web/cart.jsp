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

            .table-responsive {
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #dddddd;
            }

            th {
                background-color: #f2f2f2;
            }

            tbody tr:hover {
                background-color: #f5f5f5;
            }

            .shipping_area {
                border-top: 2px solid #ddd;
            }

            .checkout_btn_inner {
                justify-content: center;
            }

            .primary-btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #ff6b6b;
                color: #fff;
                border: none;
                border-radius: 5px;
                text-transform: uppercase;
                font-weight: bold;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .primary-btn:hover {
                background-color: #333;
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
        <%@ include file="Component/Header.jsp" %>
        <!-- End Header Area -->

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Cart</h1>
                        <nav class="d-flex align-items-center">
                            <a href="index.jsp">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="category.html">My Cart</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <!--================Cart Area =================-->

        <div class="container" style="text-align: center; margin-bottom: 50px"  >
            <div  class="cart_inner table-responsive" >
                <table  style="margin: 0; width: 1100px" >
                    <thead>
                        <tr>
                            <th style="padding: 8px; border: 1px solid #dddddd; width: 10px">Code</th>

                            <th style="padding: 8px; border: 1px solid #dddddd;width: 10px">Topic</th>                                    

                            <th style="padding: 8px; border: 1px solid #dddddd; width: 100px">Price</th>
                            <th style="padding: 8px; border: 1px solid #dddddd;width: 40px">Bearing Transaction Fee</th>
                            <th style="padding: 8px; border: 1px solid #dddddd;width: 40px">Transaction Fee</th>
                            <th style="padding: 8px; border: 1px solid #dddddd;width: 40px">Actual Receive</th>
                            <th style="padding: 8px; border: 1px solid #dddddd;width: 20px">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${listCart}">
                            <tr>
                                <td >${c.product_id}</td>

                                <td >${c.topic}</td>

                                <td ><fmt:formatNumber value="${c.price}" type="currency" currencySymbol=""/> &#x20AB</td>
                                <td >${c.bearingtransactionfees}</td>
                                <td ><fmt:formatNumber value="${c.transactionfees}" type="currency" currencySymbol=""/> &#x20AB</td>
                                <td ><fmt:formatNumber value="${c.actualreceived}" type="currency" currencySymbol=""/> &#x20AB</td>
                                <td><button onclick="deleteItem(${c.product_id})">Delete</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>


                </table>
                <div class="subtotal_area">
                    <div style="margin-top:  20px; margin-right: 800px " >
                        <h5>Subtotal</h5>
                        <h5>${totalfee}</h5>
                    </div>
                </div>

                <tr class="shipping_area">
                    <td>
                        <div class="checkout_btn_inner d-flex align-items-center">
                            <a class="primary-btn" style="margin-right: 20px; width: 300px; text-align: center" href="getallproduct">Continue Shopping</a>
                            <a class="primary-btn" style="width: 300px; text-align: center" href="processcheckout">Proceed to checkout</a>
                        </div>
                    </td>
                </tr>
            </div>
        </div>

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

        <script>
            function deleteItem(productId) {
                if (confirm('Are you sure you want to delete this item?')) {
                    window.location.href = "deleteOrd?id=" + productId;
                }
            }
        </script>

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