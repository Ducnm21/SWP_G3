<!DOCTYPE html>
<html lang="zxx" class="no-js">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="css/soldProduct.css"/>
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
        <%@ include file="Component/Header.jsp" %>

        <div class="SoldProduct">
            <h1>Products Sold!</h1>
            <div>
                <table class="table table-striped">
                    <thead>
                    <th>id</th>
                    <th>Status</th>
                    <th>Customer</th>
                    <th>Title</th>
                    <th>Contact method</th>
                    <th>Public/Private</th>
                    <th>Price(VND)</th>
                    <th>Bearing transaction fees</th>
                    <th>Transaction fees</th>
                    <th>Actual Money received</th>
                    <th>Create at</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${productSold}" var="sp">
                            <tr>
                                <th>${sp.product_id}</th>
                                <th>${sp.status}</th>
                                <th>${sp.sellerName}</th>
                                <th>${sp.topic}</th>
                                <th>${sp.contactmethod}</th>
                                <th>${sp.publicprivate}</th>
                                <th>${sp.price}</th>
                                <th>${sp.bearingtransactionfees}</th>
                                <th>${sp.transactionfees}</th>
                                <th>${sp.actualreceived}</th>
                                <th>${sp.created_at}</th>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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