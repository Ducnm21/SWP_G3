

<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdrawal Request</title>
    </head>
    <body>
        <%@include file="Component/HeaderW.jsp" %>
        <style>
            body {

                margin: 0;
                
            }

            form {
                max-width: 400px; /* Giữ nguyên kích thước */
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-top: 120px;
            }

            h2 {
                font-family:sans-serif;
                text-align: center;
                font-size: 1.5em;
                font-weight: bold;
                color: #ffffff;
                margin-bottom: 20px;
                border: 2px solid #ff7f50; /* Màu cam */
                padding: 10px;
                background-color: #ff7f50; /* Màu cam */
                border-radius: 8px;
            }

            h4 {
                font-family:sans-serif;
                font-weight: bold;
                text-align: center;
                font-size: 15px;
                font-family: Arial, sans-serif;
            }

            label,
            input {
                font-family:sans-serif;
                width: 100%;
                display: block;
            }

            label {
                font-family:sans-serif;
                margin-top: 10px;
                font-weight: bold;
                color: #333;
            }

            input {
                font-family:sans-serif;
                padding: 8px;
                margin-top: 5px;
                margin-bottom: 10px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                font-family:sans-serif;
                width: 49%; /* Đối xứng */
                margin-right: 0%; /* Khoảng cách giữa các button */
                background-color: #ff7f50; /* Màu cam */
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
                background-color: #ff6347; /* Màu cam nhạt */
            }

            button[type="submit"] {
                background-color: #00cc00; /* Màu xanh lá cây */
            }

            button[type="submit"]:hover {
                background-color: #008c00; /* Màu xanh lá cây nhạt */
            }

            button[type="button"] {
                background-color: #e74c3c; /* Màu đỏ */
            }

            button[type="button"]:hover {
                background-color: #c0392b; /* Màu đỏ nhạt */
            }
        </style>
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>WITHDRAWAL</h1>
                        <nav class="d-flex align-items-center">
                            <a href="#">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">WITHDRAWAL</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>

        <form action="withdraw" method="post" style="margin-top: 20px; margin-bottom: 50px">

            <h2>NEW WITHDRAWAL REQUEST</h2>
            <h4 style="color:red">${sessionScope.errorWithdraw}</h4>

            <label for="amount">Amount of withdraw money:</label>
            <input type="text" id="amount" name="amount" placeholder="100.000"  required>

            <label for="bankUser">Bank User:</label>
            <input type="text" id="bankUser" name="bankUser" required>

            <label for="bankNumber">Bank Number:</label>
            <input type="text" id="bankNumber" name="bankNumber" required>

            <label for="bankName">Bank Name:</label>
            <input type="text" id="bankName" name="bankName" placeholder="VD: MB Bank (MBB), Vietcombank (VCB),..." required>

            <div>
                <button type="submit" onclick="return confirmWithdrawRequest()">Submit</button>
                <button type="button" onclick="back()">Cancel</button>
            </div>

        </form>
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
    </body>
    <!--        <script>
                function formatCurrency(input) {
                    var value = input.value;
                    value = value.replace(/[^0-9]/g, '');
                    value = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
                    input.value = value;
                }
            </script>-->
    <script>
        function back() {
            window.location.href = "withdrawalList.jsp";
        }
    </script>
    <script>
        function confirmWithdrawRequest() {
            return confirm("Confirm the correct bank account information? If the information is incorrect, the admin bears no responsibility");
        }
    </script>
</html>
