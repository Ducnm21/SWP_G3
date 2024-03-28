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
    <%@ include file="Component/Header.jsp" %>

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
                    <input style="width: 80%" type="password" id="curentpassword" name="curentpassword" required> 
                </div>

                <div class="inputDiv">
                    <label class="inputLabel" for="newpassword">New Password</label>
                    <input style="width: 80%" type="password" id="newpassword" name="newpassword" required>
                </div>

                <div class="inputDiv">
                    <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                    <input style="width: 80%" type="password" id="confirmPassword" name="confirmPassword">
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
