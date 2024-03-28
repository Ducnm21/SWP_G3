<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
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
        <link rel="stylesheet" href="css/popup/PopupDetails.css">
        <link rel="stylesheet" href="css/deposit.css">
        <link rel="stylesheet" href="css/popup/PopupLogin.css">  
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


        <div style="height: 600px" id="loginPopup" class="login_popup">
            <div class="login_form_inner">
                <div class="formlog" style="border: 5px">
                    <h3 style="font-size: 50px">Login</h3>
                    <button class="close_button" onclick="closeLoginPopup(event)"><i class="fas fa-times"></i></button>
                    <form class="row login_form" id="loginForm" novalidate="novalidate" onkeypress="return checkEnter(event)">
                        <p class="text-danger" style="color: red" id="error"></p>
                        <div class="col-md-12 form-group">
                            <input style="width: 360px ;border-radius: 10px; margin-bottom: 10px; padding-right:8px " type="text" class="form-control" id="username" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
                        </div>
                        <div class="col-md-12 form-group">
                            <input style="width: 360px ;border-radius: 10px; margin-bottom: 10px;" type="password" class="form-control" id="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
                        </div>
                        <div class="creat_account">
                            <label>
                                <div class="input-group-prepend" style="padding-left: 10px">
                                    <div style="display: flex;">
                                        <!-- Add an ID to the image tag for easy selection -->
                                        <img style="border-radius: 10px; margin-bottom: 10px;" id="captchaImage" src="captchaGenerate" alt="CAPTCHA image" />
                                        <button id="refreshButton" type="button" class="btn btn-light" style="width: 50px; background-color: white;border-radius: 10px; margin-bottom: 10px;" onclick="refreshCaptcha()">
                                            <i class="fa fa-refresh" style="color: black;"></i>
                                        </button>
                                    </div>
                                    <input style="border-radius: 10px; margin-bottom: 10px; border: 1px; width: 165px" id="captcha" type="text" placeholder="Enter captcha here" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter captcha here'"/>
                                </div>                                  
                            </label>
                        </div>
                        <div  class="col-md-12 form-group">
                            <button type="button" class="primary-btn" onclick="login()">Log In</button>
                            <a href="forgotpassword.jsp">Forgot Password?</a>
                        </div>
                        <p style="padding-left: 70px">New to our website?<a href="register">Create an Account</a></p>
                    </form>
                </div>
            </div>
        </div>
        <div class="background_overlay" id="backgroundOverlay"></div>

        <script>
            function openLoginPopup() {
                document.getElementById("loginPopup").style.display = "block";
                document.getElementById("backgroundOverlay").style.display = "block";
                document.getElementById("backgroundOverlay").addEventListener("click", closeLoginPopup);
            }

            function closeLoginPopup(event) {
                event.preventDefault();
                document.getElementById("loginPopup").style.display = "none";
                document.getElementById("backgroundOverlay").style.display = "none";
                document.getElementById("backgroundOverlay").removeEventListener("click", closeLoginPopup);
            }

            function refreshCaptcha() {
                // Perform AJAX request to refresh captcha
                $.ajax({
                    type: "GET",
                    url: "captchaGenerate",
                    success: function (response) {
                        // Update the captcha image source
                        $("#captchaImage").attr("src", "captchaGenerate");
                    },
                    error: function () {
                        // Handle error
                        console.error("Error refreshing captcha");
                    }
                });
            }

            function login() {
                var username = $("#username").val();
                var password = $("#password").val();
                var captcha = $("#captcha").val();

                $.ajax({
                    type: "POST",
                    url: "logincontroller",
                    data: {
                        username: username,
                        password: password,
                        captchaEntered: captcha
                    },
                    success: function (response) {
                        if (response.trim() === "success") {

                            window.location.href = "getallproduct";
                        } else if (response.trim() === "error") {
                            $("#error").text("Your Account has been banned!");
                            refreshCaptcha();
                        } else {
                            $("#error").text("Invalid username, password, or captcha");
                            refreshCaptcha();
                        }
                    },
                    error: function () {
                        $("#error").text("An error occurred during login");
                    }
                });
            }

            function checkEnter(event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    login();
                    return false;
                }
                return true;
            }
        </script>

    </body>
</html>
