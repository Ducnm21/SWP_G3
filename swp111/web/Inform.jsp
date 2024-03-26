
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SCLC</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #948e8e;
        }

        .inform {
            width: 850px;
            height: 780px;
            background-color: rgb(252, 252, 255);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: rgb(11, 11, 11);
            overflow: visible;
            margin-top: 20px;
            margin-bottom: 20px;
            position: relative;
            /* Thêm thuộc tính position: relative; */
        }

        .footer {
            margin-top: auto;
            width: 100%;
            text-align: center;
        }

        .header {
            background-color: #97b6f3;
            display: flex;
            justify-content: space-between;
            width: 100%;
            padding: 0;
            position: absolute;
            top: 0;
            right: 0;
            padding-right: 0px;
        }

        #qr img {
            height: 385px;
            width: 400px;
        }

        .close-btn {
            background: none;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .content {
            text-align: left;
        }

        .content li {
            text-align: left;
        }

        .attention{
            padding-left: 60px;
            margin-top: 4px;
            text-align: left;
        }

        .close-btn {
            color: black;
            border: 0.5px solid rgb(15, 14, 14);
            padding: 10px;
            background-color: red;
        }

        h3 {
            padding-left: 20px;
            padding-top: 10px;
            padding-bottom: 0;
        }

        .content {
            display: inline-block;
        }

        h2 {
            margin-top: 20px;
            font-family: sans-serif;
        }

        h3 {
            color: red;
            font-size: 23px;
            font-family: sans-serif;
        }

        h4 {
            padding-top: 0;
            font-size: 16px;
            font-family: sans-serif;
        }

        .footer {
            text-align: left;
            font-size: 16px;
            padding-left: 2px;
            margin-top: 2px;
            font-weight: bold;
        }

        #contact {
            padding-left: 20px;
            font-family: sans-serif;
        }

        #please {
            color: rgb(11, 163, 239);
            font-weight: bold;
            font-family: sans-serif;
        }

        span {
            color: rgb(229, 47, 47);
            font-weight: bold;
        }

        b{
            font-weight: 400px;
            font-size: 20px;
        }
        header {
           font-family: sans-serif;  
        }
        content{
             font-family: sans-serif;
        }
        attention {
             font-family: sans-serif;
        }
        footer{
             font-family: sans-serif;
        }
    </style>
</head>

<body>
    <div class="inform">
        <div class="noidung">
            <div class="header">
                <h3>Inform</h3>
                <button class="close-btn" onclick="goBack()">X</button>
            </div>
            <h2>Quét mã qua ứng dụng Ngân hàng/ Ví điện tử</h2>
            <div id="qr"><img
                    src="https://img.vietqr.io/image/MB-0398921001-compact.png${sessionScope.amount}&addInfo=D${sessionScope.qr}H170103&accountName=NGUYEN%20THANH%20HUNG">
            </div>
            <div class="content">
                <ul>
                    <li>Số tiền: <span>${requestScope.user}<u>đ</u></span></li>
                    <li>Nội dung chuyển khoản: <span>${sessionScope.qr}H170103</span></li>
                    <li>Tên chủ tài khoản: <span>Nguyen Thanh Hung</span></li>
                    <li>Số tài khoản: <span>0398921001</span></li>
                    <li><span>Ngân hàng Quân đội MB Bank</span></li>
                </ul>
            </div>
            <h3>Chú ý: Mỗi mã QRCode chỉ chuyển 1 lần duy nhất</h3>
            <h4>Nếu chuyển thủ công điền sai thông tin chuyển khoản hoặc chuyển nhiều lần cùng 1 mã giao dịch, hệ thống
                sẽ:</h4>
            <div class="attention">
                <ul>
                    <li><b>KHÔNG</b> cộng tiền vào tài khoản của quý khách</li>
                    <li><b>KHÔNG</b> hoàn tiền lại cho quý khách</li>
                    <li><b>KHÔNG</b> chịu trách nhiệm bồi thường về khoản tiền chuyển nhầm hoặc thừa</li>
                </ul>
            </div>
            <div class="footer">
                <div id="please">Vui lòng chờ đợi 1 vài phút để hệ thống cập nhật số dư sau khi đã chuyển khoản.</div>
                <div id="pleas">Nếu đợi 20 phút sau khi chuyển khoản không thấy cập nhật thông tin giao dịch, vui lòng liên hệ QTV:
                </div>
                <div id="contact">&#x2022; Zalo/Phone <span>(Message Only)</span>: 0398921001</div>
            </div>
             <div class="payment" style="padding-top:0" ><button onclick="doneButtonClicked()" type="submit" id="naptien">Done</button></div>
               
        </div>
                    
    </div>
                    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function doneButtonClicked() {
        $.ajax({
            type: "POST",
            url: "payment", // Đặt URL của Servlet của bạn ở đây
            data: {
                user: "<%= session.getAttribute('user') %>", // Thay customerId bằng thuộc tính session thích hợp
                amountPaid: <%= request.getAttribute("amount") %> // Thay "amount" bằng thuộc tính chứa số tiền từ JSP
            },
            success: function (data) {
                alert("Số dư đã được cập nhật!"); // Thông báo thành công hoặc bạn có thể xử lý theo cách khác
            },
            error: function () {
                alert("Có lỗi xảy ra. Vui lòng thử lại sau!"); // Thông báo lỗi hoặc xử lý theo cách khác
            }
        });
    }
</script>
    <script>
        function goBack() {
            window.history.go(-1); 
        }
    </script>
</body>

</html>
