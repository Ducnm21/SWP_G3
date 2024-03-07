<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Karma Shop</title>
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

        <div>
            <header class="header_area sticky-header hidden">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="getallproduct"><img src="img/logosclc.png" alt=""></a>                       

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <c:if test="${sessionScope.user.is_admin == 1}">
                                    <li class="nav-item active"><a class="nav-link" href="LoadAccount">Manage account</a></li>
                                    </c:if>
                                <li class="nav-item active"><a class="nav-link" href="getallproduct">Home</a></li>
                                <li class="nav-item submenu dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">Payment</a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item"><a class="nav-link" href="Deposit.jsp">Deposit</a></li>
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
                                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                                    </c:if>



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
        </div>
        <!-- Start Header Area -->
        
        
        <div class="container" style="margin-top: 200px">
            <h1 style="color: orange">Update Your Profile</h1>
            <form action="updateprofile" method="post">
                <input value="${user.id}" name="id" hidden="">
                <div class="form-group">
                    <label for="inputEmail">Email</label>
                    <input type="email" class="form-control" id="inputEmail" placeholder="Email" value="${user.email}" name="email">
                </div>
                <div class="form-group">
                    <label for="inputUsername">Username</label>
                    <input type="text" class="form-control" id="inputUsername" placeholder="Username" value="${user.username}" name="username">
                </div>
                <div class="form-group">
                    <label for="inputPhone">Phone</label>
                    <input type="text" class="form-control" id="inputPhone" name="phone" value="${user.mobile}">
                </div>
                <div class="form-group">
                    <label for="inputFullname">Fullname</label>
                    <input type="text" class="form-control" id="inputFullname" placeholder="Fullname" value="${user.fullname}" name="fullname">
                </div>
                <button style="background-color: orange" type="submit" class="btn btn-primary updateBtn">Update</button>
            </form>
        </div>
       
    </body>
</html>