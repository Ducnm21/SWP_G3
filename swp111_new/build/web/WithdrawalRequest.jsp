

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdrawal Request</title>
    </head>
    <body>
        <style>
            body {
                background-color: #ff7f50; /* Màu cam */
                margin: 0;
                font-family:sans-serif;
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


        <form action="withdraw" method="post">
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
            return confirm("Xác nhận đúng thông tin TK Ngân hàng? Nếu thông tin bị sai, admin hoàn toàn không chịu trách nhiệm");
        }
    </script>
</html>
