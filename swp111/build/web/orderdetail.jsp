<%-- 
    Document   : orderdetail
    Created on : Feb 8, 2024, 3:40:21 PM
    Author     : VIVO-S15
--%>
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
        <link rel="stylesheet" href="css/orderdetail.css">
        <style>
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
        <%@ include file="Component/Header.jsp" %>
        <!-- End Header Area -->


        <div class="detailform">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Information</th>
                        <th>DATA</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>OrderCode</td>
                        <td>${detail.product_id}</td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>${detail.status}</td>
                    </tr>
                    <tr>
                        <td>Customer</td>
                        <td>${detail.customer}</td>
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td>${detail.topic}</td>
                    </tr>
                    <tr>
                        <td>Contact method</td>
                        <td>${detail.contactmethod}</td>
                    </tr>
                    <tr>
                        <td>Public/Private</td>
                        <td>${detail.publicprivate}</td>
                    </tr>
                    <tr>
                        <td>Price(VND)</td>
                        <td>${detail.price}</td>
                    </tr>
                    <tr>
                        <td>Bearing transaction fees</td>
                        <td>${detail.bearingtransactionfees}</td>
                    </tr>
                    <tr>
                        <td>Transaction fees</td>
                        <td>${detail.transactionfees}</td>
                    </tr>
                    <tr>
                        <td>Actual $ received</td>
                        <td>${detail.actualreceived}</td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td>${detail.description}</td>
                    </tr>
                    <tr>
                        <td>Hidden content</td>
                        <td>${detail.hiddencontent}</td>
                    </tr>
                    <tr>
                        <td>Create at</td>
                        <td>${detail.created_at}</td>
                    </tr>
                    <tr>
                        <td>Update at</td>
                        <td>${detail.updated_at}</td>
                    </tr>
                </tbody>
            </table>
            <div class="updatelink">
                <button> <a href="updateorder?pid=${detail.product_id}" class="edit" style="color: #FF6600;">Update</a></button>
            </div>
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
