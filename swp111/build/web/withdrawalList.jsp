<%-- 
    Document   : withdrawalList
    Created on : Jan 30, 2024, 9:28:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdrawal Page</title>
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

            .container {
                margin-top: 100px;
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
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <h2>Withdrawal History</h2>
                    <form action="withdrawSelect" method="post" id="withdrawForm">
                        <h3>Status:</h3>
                        <select name="withdrawSelect" onchange="submitForm()">
                            <option ${sessionScope.withdrawFilter == null ? 'hidden' : ''}>${sessionScope.withdrawFilter}</option>
                            <option value="All" ${sessionScope.withdrawFilter == 'All' ? 'hidden' : ''}>All</option>
                            <option value="Error" ${sessionScope.withdrawFilter == 'Error' ? 'hidden' : ''}>Error</option>
                            <option value="Finished" ${sessionScope.withdrawFilter == 'Finished' ? 'hidden' : ''}>Finished</option>
                            <option value="In process" ${sessionScope.withdrawFilter == 'Processing' ? 'hidden' : ''}>Processing</option>
                            <option value="Denied" ${sessionScope.withdrawFilter == 'Denied' ? 'hidden' : ''}>Denied</option>
                        </select>
                    </form>
                    <a href="WithdrawalRequest.jsp">
                        <button style="background-color: #ff5722;">+ Make a new request</button>
                    </a>
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
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listWithdraw}" var="p">
                        <tr>
                            <td>${p.withdrawal_id}</td>
                            <td>${p.status}</td>
                            <td>${p.amount}</td>
                            <td>${p.bank_name}</td>
                            <td>${p.bank_number}</td>
                            <td>${p.bank_user}</td>
                            <td>${p.create_datetime}</td>
                            <td>${p.update_datetime}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/withdrawDetail?withdrawID=${p.withdrawal_id}">
                                    <button style="background-color: #ff5722;">Edit</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
