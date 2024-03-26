<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="css/popup/PopupDetails.css">
        <link rel="stylesheet" href="css/linearicons.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/nouislider.min.css">
        <link rel="stylesheet" href="css/ion.rangeSlider.css">
        <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/main.css">
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

        <div class="container-feedback" style="margin-top: 200px">
            <h1>Feedback Form</h1>
            <form action="sendfeedback" method="post">
                <input type="hidden" name="receiverIds" value="${seller_id}">
                <div>
                    <label for="sendfeedback">Your Feedback:</label><br>
                    <textarea id="sendfeedback" name="feedback" placeholder="Enter your feedback here"></textarea>
                </div>
                <div>
                    <button type="submit">Submit Feedback</button>
                </div>
            </form>
        </div>
        <div id="feedbackSuccessMessage" style="display: none;">
            <p>Thank you for your feedback!</p>
            <a href="getallproduct">X</a>
        </div>
        <style>
            .container-feedback {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .container-feedback h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            .container-feedback label {
                font-weight: bold;
            }

            .container-feedback textarea {
                width: 100%;
                height: 100px;
                resize: vertical;
                margin-bottom: 20px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .container-feedback button[type="submit"] {
                background-color: orange;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                font-size: 16px;
                display: block;
                margin: 0 auto;
            }

            .container-feedback button[type="submit"]:hover {
                background-color: orange;
            }
        </style>
        <% if (request.getAttribute("feedbackSent") != null) { %>
        <script>
            document.getElementById("feedbackSuccessMessage").style.display = "block";
        </script>
        <% } %>
        <style>
            /* Styling for the feedback success message */
            #feedbackSuccessMessage {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #FFA500; /* Màu cam */
                color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                z-index: 9999;
                text-align: center;
                max-width: 80%;
            }

            #feedbackSuccessMessage p {
                margin: 0;
                font-size: 18px;
            }

            #feedbackSuccessMessage a {
                color: #FFA500; /* Màu cam */
                font-size: 20px;
                text-decoration: none;
                margin-top: 10px;
                display: inline-block;
                background-color: white; /* Màu nền của nút đóng */
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
            }

            #feedbackSuccessMessage a:hover {
                background-color: #f0f0f0; /* Màu nền của nút đóng khi di chuột qua */
                color: orange; /* Màu chữ của nút đóng khi di chuột qua */
            }
        </style>
    </body>
</html>