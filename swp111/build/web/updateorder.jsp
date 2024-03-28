<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/orderupdate.css">
        <style>
            .navbar-brand img {
                width: 150px;
                height: auto;
                margin-top: -10px;
                margin-bottom: -10px;
            }
        </style>
        <script src="https://cdn.tiny.cloud/1/jbt73pkrs1o3fqdmhuk6ei1f1ldwnlfbskiepizspw8n7qbs/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    </head>
    <body>
        <!-- Start Header Area -->
        <%@ include file="Component/Header.jsp" %>
        <!-- End Header Area -->


        <div class="updateform">
            <form action="updatesellingorder" method="post">
                <div class="updateformhead">
                    <h2>Update Selling Order/Product</h2>
                </div>
                <div class="updateformbody">
                    <div class="form-group">
                        <h3>ID</h3>
                        <input value="${detail.product_id}" name="id" type="text" class="form_control" readonly>
                    </div>
                    <div class="form-group">
                        <h3>Status</h3>
                        <input value="${detail.status}" name="status" type="text" class="form_control" readonly>
                    </div>
                    <div class="form-group">
                        <h3>Title</h3>
                        <input value="${detail.topic}" name="topic" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <h3>Contact method</h3>
                        <input value="${detail.contactmethod}" name="contactmethod" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <h3>Public/Private</h3>

                        <input type="radio" name="publicprivate" value="public" ${detail.publicprivate == 'public' ? 'checked' : ''} required>Public
                        <input type="radio" name="publicprivate" value="private" ${detail.publicprivate == 'private' ? 'checked' : ''} required>Private
                    </div>
                    <div class="form-group">
                        <h3>Price(VND)</h3>
                        <input value="${detail.price}" name="price" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <h3>Bearing transaction fees : </h3>

                        <input value="seller" type="radio" name="bearingtransactionfees" ${detail.bearingtransactionfees == 'seller' ? 'checked' : ''} required>Seller
                        <input value="buyer" type="radio" name="bearingtransactionfees" ${detail.bearingtransactionfees == 'buyer' ? 'checked' : ''} required>Customer
                    </div>
                    <div class="form-group">
                        <h3>Transaction fees</h3>
                        <input value="${detail.transactionfees}" name="transactionfees" type=" text" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <h3>Description</h3>
                        <textarea name="description" class="form-control" required>
                            ${detail.description}
                        </textarea>
                    </div>
                    <div class="form-group">
                        <h3>Hidden content</h3>
                        <textarea name="hiddencontent" class="form-control" required>
                            ${detail.hiddencontent}
                        </textarea>
                    </div>
                </div>
                <div class="updateformend">
                    <div class="row">
                        <div class="col-sm-9">
                            <input type="submit" class="btn btn-success" value="Save">
                        </div>
                        <div class="col-sm-3">
                            <p><button class="button" onclick='window.history.go(-1);'>Cancel</button>
                        </div>
                    </div>
                </div>
            </form>
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
