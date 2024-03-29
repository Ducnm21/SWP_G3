<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/deposit.css">
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
            .modal {
                display: none; /* Ẩn cửa sổ popup ban đầu */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Màu nền mờ */
                z-index: 1; /* Hiển thị cửa sổ popup trên cùng */
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15%;
                margin-left: 18%;
                padding: 20px;
                border: 1px solid #888;
                width: 58%; /* Điều chỉnh kích thước cửa sổ popup tại đây */
                height: 58%;
                border-radius: 10px;
                position: relative;
            }

            /* Đóng cửa sổ popup khi nhấp chuột vào nền mờ */
            .modal-background {
                width: 100%;
                height: 100%;
                position: fixed;
                top: 0;
                left: 0;
                cursor: pointer;
                z-index: -1;
            }


            button#btnpop-open{
                background: rgb(2,133,229);
                color: #FFF;
                border: none;
                padding: 5px 15px;
                cursor: pointer;
                box-shadow: 0px 2px 4px rgba(0,0,0,0.5);
            }
            #modalpop-container{
                height: 100vh;
                width: 100%;
                background: rgba(0,0,0,0.5);
                position: fixed;
                top: 0;
                left: 0;
                z-index: 999999999;
                opacity: 0;
                pointer-events: none;
            }
            #modalpop-container.showpop{
                opacity: 1;
                pointer-events: all;
            }
            #modalpop{
                background: #fff;
                max-width: 1000px;
                position: relative;
                left: 50%;
                top: 5%;
                transform: translateX(-50%);
            }
            #modalpop .modalpop-header{
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 5px 20px;
                border-bottom: 2px solid #dedede;
            }
            #modalpop .modalpop-header h3{
                margin: 0;
            }
            button#btnpop-close{
                outline: none;
                border: none;
                background: none;
                font-size: 20px;
            }
            #modalpop .modalpop-body{
                padding: 10px 20px 15px;
                width: 100%; /* Thêm dòng này để làm cho nội dung fit toàn bộ thẻ */
                box-sizing: border-box; /* Bảo đảm tính toàn vẹn của box model */
                padding: 10px 20px 15px;
            }
            .modalpop-body {
                max-height: 70vh; /* Giảm chiều cao tối đa để tránh tràn ngoài màn hình */
                overflow-y: auto; /* Thêm thanh cuộn nếu nội dung quá dài */
            }

            .tablepop {
                width: 100%;
                border-collapse: collapse; /* Loại bỏ khoảng cách giữa các ô */
                margin-left: 0px;
            }

            .tablepop th, .tablepop td {
                padding: 8px; /* Thêm padding để tạo ra khoảng cách giữa nội dung và biên của ô */
                border: 1px solid #ddd; /* Thêm đường biên */

            }
        </style>
    </head>
    <body>
        <div id="depositModal" class="modal">
            <div class="modal-content" style="width: 65%">
                <div class="modal-background" onclick="closeDepositPopup()"></div>
                <!-- Deposit form-->
                <div class="deposit-form" >
                    <form action="ajaxServlet" id="frmCreateOrder" method="post">
                        <div class="deposit__header" >
                            <h2>DEPOSIT REQUEST</h2>
                        </div>
                        <table style="margin-left: -20px; width: 50%">
                            <tr>
                                <td style="padding-right:10px;">CHOOSE PAYMENT METHOD(*)</td>
                                <td class="button">
                                    <div>
                                        <input type="radio" id="money1" value="" name="deposit_method" required>
                                        <label for="money1">PAYMENT GATEWAY (CHARGING AN ADDITIONAL 3% SERVICE FEE OR 3K FOR TRANSACTIONS BELOW 100K)</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Account (VND)(*)</td>
                                <td><input id="tien" type="number" placeholder="Số tiền cần nạp (Tối thiểu 10,000 vnđ)" name="amount" oninput="formatCurrency(this)" required style="width: 626.85px" value="10000">
                                </td>
                            </tr>
                            <tr>
                                <td class="des">Payment Description</td>
                                <td><textarea type="text" id="description" class="description" placeholder="Ghi chú khoản nạp khi cần thiết" style="overflow-y: auto;width: 646.85px;padding-bottom: 60px;font-family: sans-serif"></textarea>
                                </td>
                            </tr>
                        </table>
                        <div class="deposit" style="padding-top:0" ><button onclick="LoadError()" type="submit" id="naptien">DEPOSIT</button></div>
                    </form>
                </div>                           
            </div>
        </div>
        <script>
            function openDepositPopup() {
                var modal = document.getElementById("depositModal");
                modal.style.display = "block";
            }

            // Hàm đóng popup
            function closeDepositPopup() {
                var modal = document.getElementById("depositModal");
                modal.style.display = "none";
            }
            btnpop_open.addEventListener('click', function () {    // Thêm class 'showpop' vào modalpop_container khi nút được nhấn
                modalpop_container.classList.add('showpop');
            });

            btnpop_close.addEventListener('click', function () {
                // Loại bỏ class 'showpop' khi nút close được nhấn
                modalpop_container.classList.remove('showpop');
            });
        </script>
    </body>
</html>
