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
        <link rel="stylesheet" href="css/donbancuatoi.css">
        <style>
            .navbar-brand img {
                width: 150px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }
        </style>
        <script src="jquery-3.7.1.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

                                <c:if test="${sessionScope.user != null}">
                                    <li class="nav-item submenu dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                           aria-expanded="false">Payment</a>
                                        <ul class="dropdown-menu">
                                            <li class="nav-item"><a class="nav-link" onclick="openDepositPopup()">Deposit</a></li>
                                            <li class="nav-item"><a class="nav-link" href="WithdrawalRequest.jsp">Withdrawal Request</a></li>
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
        <!-- End Header Area -->

        <!-- start banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>My products</h1>
                        <nav class="d-flex align-items-center">
                            <a href="#">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">My products</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->
        <div class="donbanhead">
            <div class="row">
                <div class="col-lg-6">
                    <h2>My Product/Selling Orders</h2>
                </div>
                <div class="col-lg-6">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6"></div>
            <div class="col-lg-6">
                <a href="addneworder.jsp">ADD MORE</a>
            </div>
        </div>


        <div id="producttable" class="ordertable">
            <table  class="table table-striped table-hover">
                <thead>
                <th>Detail</th>
                <th>Status</th>
                <th>Title</th>
                <th>Contact method</th>
                <th>Public/Private</th>
                <th>Price(VND)</th>
                <th>Bearing transaction fees</th>
                <th>Transaction fees</th>
                <th>Actual Money received</th>
                <th>Create at</th>
                <th>Update at</th>
                <th>Action</th>
                </thead>
                <thead>
                <th></th>
                <th>
                    <select name="status" id="statusSelect">
                        <option value="">.....</option>
                        <option value="Available">Available</option>
                        <option value="Completed">Completed</option>
                        <option value="Pending">Pending</option>
                        <option value="Out of stock">Out of stock</option>
                        <option value="The buyer is checking the order">The buyer is checking the order</option>
                        <option value="Buyer is complaining">Buyer is complaining</option>
                        <option value="Requesting Admin to solve">Requesting Admin to solve</option>
                    </select>
                    <button id="loadOrdersButton" onclick="orderStatus()">Load</button>
                </th>
                <!-- <th><input value="${sn}" oninput="searchByCustomerName(this)" name="txt" type="text" placeholder="Search..."></th>comment -->
                <th><input value="${sntitle}" oninput="searchByTitle(this)" name="txttitle" type="text" placeholder="Title..."></th>
                <th><input value="${sncontact}" oninput="searchByContact(this)" name="txtcontact" type="text" placeholder="Contact..."></th>
                <th>
                    <select name="publicprivate" id="ppSelect">
                        <option value="...">...</option>
                        <option value="Public">Public</option>
                        <option value="Private">Private</option>
                    </select>
                    <button id="loadOrdersButton" onclick="publicPrivate()">Load</button>
                </th>
                <th>
                    <select name="price" id="priceSelect">
                        <option value="0-250000">0 - 250.000</option>
                        <option value="250000-500000">250.000 - 500.000</option>
                        <option value="500000-1000000">500.000 - 1.000.000</option>
                        <option value="1000000-5000000">1.000.000 - 5.000.000</option>
                        <option value="5000000-10000000">5.000.000 + </option>
                    </select>
                    <button id="loadOrdersButton" onclick="orderPrice()">Find</button>
                </th>
                <th>
                    <select name="bearing" id="bearingSelect">
                        <option value="...">...</option>
                        <option value="Seller">Seller</option>
                        <option value="Buyer">Customer</option>
                    </select>
                    <button id="loadOrdersButton" onclick="bearing()">Load</button>
                </th>
                <th>Transaction fees</th>
                <th>
                    <select name="received" id="receivedSelect">
                        <option value="0-250000">0 - 250.000</option>
                        <option value="250000-500000">250.000 - 500.000</option>
                        <option value="500000-1000000">500.000 - 1.000.000</option>
                        <option value="1000000-5000000">1.000.000 - 5.000.000</option>
                        <option value="5000000-10000000">5.000.000 + </option>
                    </select>
                    <button id="loadOrdersButton" onclick="orderReceived()">Find</button>
                </th>
                <th></th> 
                <th></th>
                <th></th>
                </thead>
                <tbody>
                    <c:forEach items="${listProductByUserID}" var="o">
                        <tr class="product">
                            <th><a href="updateorder?pid=${o.product_id}">Detail</a></th>
                            <th>${o.status}</th>
                            <th>${o.topic}</th>
                            <th>${o.contactmethod}</th>
                            <th>${o.publicprivate}</th>
                            <th><fmt:formatNumber value="${o.price}" type="currency" currencySymbol=""/> &#x20AB</th>
                            <th>${o.bearingtransactionfees}</th>
                            <th><fmt:formatNumber value="${o.transactionfees}" type="currency" currencySymbol=""/> &#x20AB</th>
                            <th><fmt:formatNumber value="${o.actualreceived}" type="currency" currencySymbol=""/> &#x20AB</th>
                            <th>${o.created_at}</th>
                            <th>${o.updated_at}</th>
                            <td>
                                <a href="updateorder?pid=${o.product_id}"  class="edit">Update</a>
                                <!-- <a href="deleteorder?pid=${o.product_id}" class="delete" ><i class="material-icons">Delete</i></a>comment -->
                            </td>
                        </tr>

                    </c:forEach>
                </tbody>    
            </table>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <% String mess = (String) request.getAttribute("mess");
       if (mess != null) { %>
        <script type="text/javascript">
                        alert("<%= mess %>");
        </script>
        <% } %>
        <% String errorMessage = (String) request.getAttribute("errorMessage");
       if (errorMessage != null) { %>
        <script type="text/javascript">
            alert("<%= errorMessage %>");
        </script>
        <% } %>
        <script>
            // Bi?n global ?? l?u tr? ID c?a hàm hi?n t?i ?ang ???c hi?n th?
            var currentFunction = null;

            function bearing() {
                var selectElement = document.getElementById('bearingSelect');
                var bearing = selectElement.value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var response = this.responseText;
                        var table = document.getElementById("producttable");
                        var tableBody = table.getElementsByTagName('tbody')[0];
                        tableBody.innerHTML = response;

                        // Add thead if not exist
                        if (!table.querySelector('thead')) {
                            var theadContent = "<thead><tr><th>ID</th><th>Status</th><th>Customer</th><th>Topic</th><th>Contact Method</th><th>Public/Private</th><th>Price(VND)</th><th>Bearing Transaction Fees</th><th>Transaction Fees</th><th>Actual Money received</th><th>Create at</th><th>Update at</th><th>Actions</th></tr></thead>";
                            table.insertAdjacentHTML('afterbegin', theadContent);
                        }
                        table.style.display = 'block'; // Display the table
                        currentFunction = table.id; // Update the ID of current function
                    }
                };
                xmlhttp.open("GET", "loadbearingproductbyuserid?bearing=" + bearing, true);
                xmlhttp.send();
            }

            function publicPrivate() {
                var selectElement = document.getElementById('ppSelect');
                var publicprivate = selectElement.value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var response = this.responseText;
                        var table = document.getElementById("producttable");
                        var tableBody = table.getElementsByTagName('tbody')[0];
                        tableBody.innerHTML = response;

                        // Add thead if not exist
                        if (!table.querySelector('thead')) {
                            var theadContent = "<thead><tr><th>ID</th><th>Status</th><th>Customer</th><th>Topic</th><th>Contact Method</th><th>Public/Private</th><th>Price(VND)</th><th>Bearing Transaction Fees</th><th>Transaction Fees</th><th>Actual Money received</th><th>Create at</th><th>Update at</th><th>Actions</th></tr></thead>";
                            table.insertAdjacentHTML('afterbegin', theadContent);
                        }
                        table.style.display = 'block'; // Display the table
                        currentFunction = table.id; // Update the ID of current function
                    }
                };
                xmlhttp.open("GET", "loadpublicprivateproductanduserid?publicprivate=" + publicprivate, true);
                xmlhttp.send();
            }


            // Hàm x? lý khi click vào nút t?i ??n hàng v?i tr?ng thái c? th?
            document.getElementById("loadOrdersButton").addEventListener("click", function () {
                var selectElement = document.getElementById('statusSelect');
                var status = selectElement.value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var response = this.responseText;
                        var table = document.getElementById("producttable");
                        var tableBody = table.getElementsByTagName('tbody')[0];
                        tableBody.innerHTML = response;

                        // Thêm ph?n thead n?u ch?a t?n t?i
                        if (!table.querySelector('thead')) {
                            var theadContent = "<thead><tr><th>ID</th><th>Status</th><th>Customer</th><th>Topic</th><th>Contact Method</th><th>Public/Private</th><th>Price(VND)</th><th>Bearing Transaction Fees</th><th>Transaction Fees</th><th>Actual Money received</th><th>Create at</th><th>Update at</th><th>Actions</th></tr></thead>";
                            table.insertAdjacentHTML('afterbegin', theadContent);
                        }
                        table.style.display = 'block'; // Hi?n th? b?ng
                        currentFunction = table.id; // C?p nh?t ID c?a hàm hi?n t?i
                    }
                };
                xmlhttp.open("GET", "loadorderbystatusanduserid?status=" + status, true);
                xmlhttp.send();
            });
            function orderPrice() {
                var selectElement = document.getElementById('priceSelect');
                var price = selectElement.value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var response = this.responseText;
                        var table = document.getElementById("producttable");
                        var tableBody = table.getElementsByTagName('tbody')[0];
                        tableBody.innerHTML = response;

                        // Add thead if not exist
                        if (!table.querySelector('thead')) {
                            var theadContent = "<thead><tr><th>ID</th><th>Status</th><th>Customer</th><th>Topic</th><th>Contact Method</th><th>Public/Private</th><th>Price(VND)</th><th>Bearing Transaction Fees</th><th>Transaction Fees</th><th>Actual Money received</th><th>Create at</th><th>Update at</th><th>Actions</th></tr></thead>";
                            table.insertAdjacentHTML('afterbegin', theadContent);
                        }
                        table.style.display = 'block'; // Display the table
                        currentFunction = table.id; // Update the ID of current function
                    }
                };
                xmlhttp.open("GET", "loadorderbypriceandorderid?price=" + price, true);
                xmlhttp.send();
            }
            function orderReceived() {
                var selectElement = document.getElementById('receivedSelect');
                var received = selectElement.value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var response = this.responseText;
                        var table = document.getElementById("producttable");
                        var tableBody = table.getElementsByTagName('tbody')[0];
                        tableBody.innerHTML = response;

                        // Add thead if not exist
                        if (!table.querySelector('thead')) {
                            var theadContent = "<thead><tr><th>ID</th><th>Status</th><th>Customer</th><th>Topic</th><th>Contact Method</th><th>Public/Private</th><th>Price(VND)</th><th>Bearing Transaction Fees</th><th>Transaction Fees</th><th>Actual Money received</th><th>Create at</th><th>Update at</th><th>Actions</th></tr></thead>";
                            table.insertAdjacentHTML('afterbegin', theadContent);
                        }
                        table.style.display = 'block'; // Display the table
                        currentFunction = table.id; // Update the ID of current function
                    }
                };
                xmlhttp.open("GET", "loadorderbyreceivedanduserid?received=" + received, true);
                xmlhttp.send();
            }

            function searchByContact(paramc) {
                var txtSearchC = paramc.value;
                $.ajax({
                    url: "searchbycontact",
                    type: "get",
                    data: {txtcontact: txtSearchC},
                    success: function (data) {
                        var tableBody = document.getElementById("producttable").getElementsByTagName('tbody')[0];
                        tableBody.innerHTML = data;
                        tableBody.parentNode.style.display = 'block'; // Hi?n th? b?ng
                        currentFunction = tableBody.parentNode.id; // C?p nh?t ID c?a hàm hi?n t?i
                    },
                    error: function (xhr) {
                        console.log("Error occurred: " + xhr.statusText);
                    }
                });
            }
            // Hàm tìm ki?m theo tên khách hàng
            function searchByCustomerName(param) {
                var txtSearch = param.value;
                $.ajax({
                    url: "searchbycustomername",
                    type: "get",
                    data: {txt: txtSearch},
                    success: function (data) {
                        var tableBody = document.getElementById("producttable").getElementsByTagName('tbody')[0];
                        tableBody.innerHTML = data;
                        tableBody.parentNode.style.display = 'block'; // Hi?n th? b?ng
                        currentFunction = tableBody.parentNode.id; // C?p nh?t ID c?a hàm hi?n t?i
                    },
                    error: function (xhr) {
                        console.log("Error occurred: " + xhr.statusText);
                    }
                });
            }
            function searchByTitle(paramt) {
                var txtSearchT = paramt.value;
                $.ajax({
                    url: "searchbytitle",
                    type: "get",
                    data: {txttitle: txtSearchT},
                    success: function (data) {
                        var tableBody = document.getElementById("producttable").getElementsByTagName('tbody')[0];
                        tableBody.innerHTML = data;
                        tableBody.parentNode.style.display = 'block'; // Hi?n th? b?ng
                        currentFunction = tableBody.parentNode.id; // C?p nh?t ID c?a hàm hi?n t?i
                    },
                    error: function (xhr) {
                        console.log("Error occurred: " + xhr.statusText);
                    }
                });
            }
        </script>


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