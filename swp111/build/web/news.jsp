<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">News</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table">
                            <thead class="thead-primary">
                                <tr>
                                    <th>ID</th>
                                    <th>Content</th> 
                                    <th>Seen</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${newsList}" var="news">
                                    <tr>
                                        <td>${news.news_id}</td>
                                        <td>${news.content}</td> 
                                        <td id="readStatus_${news.news_id}">
                                            <c:if test="${news.is_seen == 0}">
                                                Chưa đọc
                                            </c:if>
                                            <c:if test="${news.is_seen != 0}">
                                                Đã đọc
                                            </c:if>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-warning text-white" onclick="showMessage('${news.product_id}', '${news.news_id}')">View</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Pagination -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                            <li class="page-item ${loop.index == currentPage ? 'active' : ''}">
                                <a class="page-link" href="newscontroll?page=${loop.index}">${loop.index}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- JavaScript -->
    <script src="js/jquery.min.js"></script>
    <script>
                                                function showMessage(productId, newsId) {
                                                    console.log(productId); // Make sure orderId is correctly logged                                                                                                     

                                                    // Update read status to "Đã đọc"
                                                    document.getElementById("readStatus_" + newsId).innerHTML = "Đã đọc";
                                                    const url = 'viewdetail?id=' + productId;
                                                    // Redirect to another page with the updated order ID

                                                    location.href = url;
                                                }



    </script>
</body>
</html>