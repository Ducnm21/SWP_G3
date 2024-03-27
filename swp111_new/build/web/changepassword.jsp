<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="user" value="${sessionScope.user}"/>
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

<body>

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

    </header>
<div class="mainDiv">
    <div class="cardStyle" style="margin-top: 200px ">
        <form action="changepassword" method="post" name="signupForm" id="signupForm">
            <input value="${user.id}" name="id" hidden="">
            
            <h2 class="formTitle" style="color: orange">
                Change your password here
            </h2>
            
            <div style="color: red;margin-left: 100px" >${error_password} </div>
            <div style="color: red;margin-left: 100px" >${error_password_not_duplicate} </div>  
            <div style="color: red;margin-left: 100px" >${error_password_curentpassword} </div>
            <div style="color: red;margin-left: 100px" >${error_password_invalid} </div>
                     
            <div class="inputDiv">
                <label class="inputLabel" for="curentpassword">Curent Password</label> 
                <input type="password" id="curentpassword" name="curentpassword" required> 
            </div>

            <div class="inputDiv">
                <label class="inputLabel" for="newpassword">New Password</label>
                <input type="password" id="newpassword" name="newpassword" required>
            </div>

            <div class="inputDiv">
                <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword">
            </div>

            <div class="buttonWrapper">
                <button type="submit" id="submitButton" onclick="validateSignupForm()" class="submitButton pure-button pure-button-primary">
                    <span style="color: white; ">Continue</span>
                    <span id="loader"></span>
                </button>
            </div>

        </form>
    </div>
</div>
<style>
    .mainDiv {
        display: flex;
        min-height: 100%;
        align-items: center;
        justify-content: center;
        background-color: #f9f9f9;
        font-family: 'Open Sans', sans-serif;
    }
    .cardStyle {
        width: 500px;
        border-color: white;
        background: #fff;
        padding: 36px 0;
        border-radius: 4px;
        margin: 30px 0;
        box-shadow: 0px 0 2px 0 rgba(0,0,0,0.25);
    }
    #signupLogo {
        max-height: 100px;
        margin: auto;
        display: flex;
        flex-direction: column;
    }
    .formTitle{
        font-weight: 600;
        margin-top: 20px;
        color: #2F2D3B;
        text-align: center;
    }
    .inputLabel {
        font-size: 12px;
        color: #555;
        margin-bottom: 6px;
        margin-top: 24px;
    }
    .inputDiv {
        width: 70%;
        display: flex;
        flex-direction: column;
        margin: auto;
    }
    input {
        height: 40px;
        font-size: 16px;
        border-radius: 4px;
        border: none;
        border: solid 1px #ccc;
        padding: 0 11px;
    }
    input:disabled {
        cursor: not-allowed;
        border: solid 1px #eee;
    }
    .buttonWrapper {
        margin-top: 40px;
    }
    .submitButton {
        width: 70%;
        height: 40px;
        margin: auto;
        display: block;
        color: #fff;
        background-color: orange;
        border-color: orange;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
        box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
    }
    .submitButton:disabled,
    button[disabled] {
        border: 1px solid #cccccc;
        background-color: #cccccc;
        color: #666666;
    }


    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }
</style>  
