<%-- 
    Document   : addnewproduct
    Created on : Feb 6, 2024, 12:57:08 AM
    Author     : VIVO-S15
--%>

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
        <link rel="stylesheet" href="css/ion.rangeSlider.css"/>
        <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css"/>
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/orderadd.css">
        <style>
            .navbar-brand img {
                width: 150px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }
        </style>
        <script src="https://cdn.tiny.cloud/1/jbt73pkrs1o3fqdmhuk6ei1f1ldwnlfbskiepizspw8n7qbs/tinymce/6/tinymce.min.js"
        referrerpolicy="origin"></script>
    </head>
    <body>
        <%@ include file="Component/Header.jsp" %>
        <div class="addform">
            <form action="addorder" method="post">
                <div class="addformhead">
                    <h2>Add New Selling Order/Product</h2>
                </div>
                <div class="addformbody">
                    <div class="form-group">
                        <h3 class="chu">Title</h3>
                        <input name="topic" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <h3>Contact method</h3>
                        <input name="contactmethod" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input type="radio" name="publicprivate" value="public" required>Public
                        <input type="radio" name="publicprivate" value="private" required>Private
                    </div>
                    <div class="form-group">
                        <h3>Price(VND)</h3>
                        <input name="price" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <h3>Bearing transaction fees</h3>
                        <input type="radio" name="bearingtransactionfees" value="seller" required>Seller
                        <input type="radio" name="bearingtransactionfees" value="customer" required>Customer
                    </div>
                    <div class="form-group">
                        <h3>Transaction fees = 1% of Order price</h3>
                    </div>
                    <div class="form-group">
                        <h3>Description</h3>
                        <textarea name="description" class="form-control" required>
                    
                        </textarea>
                    </div>
                    <div class="form-group">
                        <h3>Hidden content</h3>
                        <textarea name="hiddencontent" class="form-control" required>
                    
                        </textarea>
                    </div>
                </div>

                <div class="addformend">
                    <div>
                        <h5>The selling application fee will be 500VND</h5>
                    </div>
                    <div class="row">
                        <div class="col-sm-9">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                        <div class="col-sm-3">
                            <p><button class="button" onclick='window.history.go(-1);'>Cancel</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <% String errorMessage = (String) request.getAttribute("errorMessage");
       if (errorMessage != null) { %>
        <script type="text/javascript">
            alert("<%= errorMessage %>");
        </script>
        <% } %>
        <!--        <script>
                    tinymce.init({
                        selector: 'textarea',
                        plugins: 'ai tinycomments mentions anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed permanentpen footnotes advtemplate advtable advcode editimage tableofcontents mergetags powerpaste tinymcespellchecker autocorrect a11ychecker typography inlinecss',
                        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | align lineheight | tinycomments | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
                        tinycomments_mode: 'embedded',
                        tinycomments_author: 'Author name',
                        mergetags_list: [
                            {value: 'First.Name', title: 'First Name'},
                            {value: 'Email', title: 'Email'},
                        ],
                        ai_request: (request, respondWith) => respondWith.string(() => Promise.reject("See docs to implement AI Assistant")),
                    });
                </script>-->
        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
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
        <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
<!-- Place the first <script> tag in your HTML's <head> -->


<!-- Place the following <script> and <textarea> tags your HTML's <body> -->

