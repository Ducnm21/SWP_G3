<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="common_vnpay.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dal.DepositDAO" %>
<%@page import="dal.WalletDAO" %>
<%@page import="model.Wallet" %>
<%@page import="java.util.Queue" %>
<%@page import="java.util.LinkedList" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Payment Bill</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="assets/js/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="css/TransactionDetails.css"/>
        <link rel="stylesheet" href="css/bootstrap-grid.css"/>

    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->


        <div id="transaction_form" class="container" style="margsin-top: 100px; border-radius: 5px; " >
            <div class="header clearfix" style ="color:orange">
                <h1 class="text-muted" style="color: white; text-align: center">Payment Bill</h1>
            </div>
            <table class="table-responsive" style="margin-left: 19px">
                <tr class="form-group">
                    <td>1. Payment Transaction Code:</td>
                    <td style="padding-left: 300px"><%=request.getParameter("vnp_TxnRef")%></td>
                </tr>    
                <tr class="form-group">
                    <td>2. Amount:</td>
                    <td style="padding-left: 450px"><%= Double.parseDouble(request.getParameter("vnp_Amount")) / 100 %></td>
                </tr>  
                <tr class="form-group">
                    <td style="width: 250px">3. Transaction description:</td>
                    <td style="padding-left: 280px"><%=request.getParameter("vnp_OrderInfo")%></td>
                </tr> 
                <tr class="form-group">
                    <td >4. Payment bank code:</td>
                    <td style="padding-left: 370px"><%=request.getParameter("vnp_BankCode")%></td>
                </tr> 
                <tr class="form-group">
                    <td>5.  Payment time:</td>
                    <td style="padding-left: 370px"><%=request.getParameter("vnp_PayDate")%></td>
                </tr> 
                <tr class="form-group">
                    <td>6. Payment Status:</td>
                    <td style="padding-left: 370px" id="status">
                        <%
                            DepositDAO dao = new DepositDAO();
                            WalletDAO wadb = new WalletDAO();
                            HttpSession ss = request.getSession();
                            Wallet wallet = (Wallet) ss.getAttribute("walletCurrent");
    
                            // Tao queue
                            Queue<Integer> numbers = new LinkedList<>();
                            numbers.offer(1);
                            int accessedNumber = numbers.peek();
                            if (signValue.equals(vnp_SecureHash)) {
                                    if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                        out.print("Thành công");
                                         int removedNumber = numbers.poll();
                                        double amount2 = dao.getBalanceByDeposit(wallet.getId());
                                        double amount = Double.parseDouble(request.getParameter("vnp_Amount")) / 100;
                                        double total = amount2 + amount;
                                        dao.setAmount(wallet, total);
                                        Wallet wa2 = wadb.getWalletByID3(wallet.getId(), (total));

                                        ss.setAttribute("walletCurrent", wa2);

                                    } else {
                                    int removedNumber = numbers.poll();
                                        out.print("Không thành công");
                                        dao.updateStatus(wallet, "Không thành công");
                                    }
                                }else {
                                out.print("invalid signature");
                                dao.updateStatus(wallet, "Pending");
                            }
                            
                        %>

                    </td>
                </tr> 
                <%
                String transactionStatus = request.getParameter("vnp_TransactionStatus");
                boolean isSuccess = "00".equals(transactionStatus);
                %>
                <tr>
                    <td style="display: block; margin: 0 auto; padding-top: 10px; padding-bottom: 10px">
                        <% if (isSuccess) { %>
                        <input type="submit" value="Về trang chủ" onclick="redirectToHome()">
                        <input type="submit" value="Tạo giao dịch mới" onclick="createNewTransaction()">
                        <% } else { %>
                        <input type="submit" value="Tạo giao dịch mới" onclick="createNewTransaction()">
                        <% } %>
                    </td>
                </tr>


            </table>
        </div>
    </body>

    <script>
        function redirectToHome() {
            window.location.href = "/swp123/getallproduct";
        }

        function createNewTransaction() {
            window.location.href = "/swp123/Deposit.jsp";
        }
    </script>

</html>
