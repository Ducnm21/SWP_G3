<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script>
            function submitForm() {
                document.getElementById('withdrawForm').submit();
            }
        </script>
        <style>
            /* Custom styles for withdrawal list */
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }

            .container1 {
                margin-top: 170px;
                margin-bottom: 110px;
            }

            .table-wrapper {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            .table-title {
                background-color: #ff5722;
                color: #ffffff;
                padding: 15px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .table-title h2 {
                font-weight: bold;
                font-size: 24px;
                margin: 0;
            }

            .table-title select {
                background-color: #ffffff;
                color: #ff5722;
                font-weight: bold;
                border: none;
                cursor: pointer;
            }

            .table-title button {
                background-color: #00cc00;
                color: #ffffff;
                font-weight: bold;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .table-title button:hover {
                background-color: #00aa00;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 12px 15px;
                text-align: center;
                border-bottom: 1px solid #f2f2f2;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }
        </style>
    </head>
    <body>
        <%@include file="Component/HeaderW.jsp" %>
        
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Withdrawal History</h1>
                        <nav class="d-flex align-items-center">
                            <a href="#">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Withdrawal History</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <div class="container1" style="margin-top: -30px" >
            <div class="table-wrapper">
                <div class="table-title" style="padding-top: 45px;padding-bottom: 2px;background-color: white;padding-left: 190px;padding-right: 189px; ">
                    <h2>Withdrawal History</h2>
                    <a href="WithdrawalRequest.jsp">
                        <button style="background-color: #ff5722;">+ Make a new request</button>
                    </a>
                </div>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Request ID</th>
                        <th>Status</th>
                        <th>Withdrawal Amount</th>
                        <th>Bank Name</th>
                        <th>Bank Account Number</th>
                        <th>Account Holder</th>
                        <th>Created Time</th>
                        <th>Last Updated</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listWithdraw}" var="p">
                        <tr>
                            <td>${p.withdrawal_id}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.getStatus() eq 'In Process'}">
                                        <a href="#" class="btn btn-dark">${p.getStatus()}</a>
                                    </c:when>
                                    <c:when test="${p.getStatus() eq 'Finished'}">
                                        <a href="" class="btn btn-success" style="background-color: #28a745; border-color: #28a745;">${p.getStatus()}</a>
                                    </c:when>
                                    <c:when test="${p.getStatus() eq 'Error'}">
                                        <a href="#" class="btn btn-danger">${p.getStatus()}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="#" class="btn btn-secondary">${p.getStatus()}</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><c:out value="${String.format('%,.0f', p.amount)}" /></td>
                            <td>${p.bank_name}</td>
                            <td>${p.bank_number}</td>
                            <td>${p.bank_user}</td>
                            <td>${p.create_datetime}</td>
                            <td>${p.update_datetime}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.getStatus() eq 'In Process'}">
                                        <a href="${pageContext.request.contextPath}/withdrawHandle?withdrawID=${p.withdrawal_id}&action=accept">
                                            <button onclick="return confirmAccept()" type="button" class="btn btn-primary" style="background-color: #ff5722; border-color:#ff5722; font-weight: bold;">Accept</button>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/withdrawHandle?withdrawID=${p.withdrawal_id}&action=error">
                                            <button onclick="return confirmDeny()" type="button" class="btn btn-primary" style="background-color: #ff5722; border-color:#ff5722; font-weight: bold;">Error</button>
                                        </a>
                                    </c:when>
                                    <c:when test="${p.getStatus() eq 'Finished'}">                                       
                                        <button onclick="reportDone()" type="button" class="btn btn-primary" style="background-color: #ff5722; border-color:#ff5722; font-weight: bold;">Done</button>       
                                    </c:when>
                                    <c:when test="${p.getStatus() eq 'Error'}">                                                                           
                                        <button onclick="reportDone()" type="button" class="btn btn-primary" style="background-color: #ff5722; border-color:#ff5722; font-weight: bold;">Error</button>                                        
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
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
        <script>
            function confirmAccept() {
                return confirm("Admin confirms the withdrawal request and has successfully transferred the money to the customer.");
            }

            function confirmDeny() {
                return confirm("An error occurred during the money transfer process, refunding the amount back to you.");
            }

            function reportDone() {
                alert("Done");
            }
        </script>

    </body>
</html>
