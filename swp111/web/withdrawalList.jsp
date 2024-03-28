
<%@page contentType="text/html; charset=UTF-8"%>
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

            .container1 {
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
         <%@include file="Component/HeaderW.jsp" %>
        <div class="container1">
            <div class="table-wrapper">
                <div class="table-title" style="padding-top: 45px;padding-bottom: 2px;background-color: white;padding-left: 190px;padding-right: 189px;">
                    <h2>Withdrawal History</h2>
                    <form class="col-lg-3" action="withdrawSelect" method="post" id="withdrawForm">
                            <h3 style="font-weight: bold; color: white; font-size: 20px; display: inline-block; margin-right: 10px">Status:</h3>
                            <select type="submit" name="withdrawSelect" class="btn btn-primary" style="background-color: white; font-weight: bold; color: #3498db; border: none;" onchange="submitForm()">
                                <option ${sessionScope.withdrawSelect == null ? 'hidden' : ''}>${sessionScope.withdrawSelect}</option>
                                <option value="All" ${sessionScope.withdrawSelect == 'All' ? 'hidden' : ''}>All</option>
<!--                                <option value="Error" ${sessionScope.withdrawSelect == 'Error' ? 'hidden' : ''}>Error</option>-->
                                <option value="Finished" ${sessionScope.withdrawSelect == 'Finished' ? 'hidden' : ''}>Finished</option>
                                <option value="In process" ${sessionScope.withdrawSelect == 'In process' ? 'hidden' : ''}>In process</option>
                                <option value="Denied" ${sessionScope.withdrawSelect == 'Denied' ? 'hidden' : ''}>Denied</option>
                            </select>
                        </form>

                    <a href="WithdrawalRequest.jsp">
                        <button style="background-color: #ff5722;">+ Make a new request</button>
                    </a>
                </div>
                <table >
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

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listWithdraw}" var="p">
                            <tr>
                                <td>${p.withdrawal_id}</td>
                                <td><c:choose>
                                        <c:when test="${p.getStatus() eq 'Finished'}">
                                            <a href="#" class="btn btn-success">${p.getStatus()}</a>
                                        </c:when>
                                        <c:when test="${p.getStatus() eq 'Denied'}">
                                            <a href="#" class="btn btn-danger">${p.getStatus()}</a>
                                        </c:when>                                                                                                                          
                                        <c:otherwise>
                                            <a href="#" class="btn btn-secondary">${p.getStatus()}</a>
                                        </c:otherwise>
                                    </c:choose></td>
                                <td><c:out value="${String.format('%,.0f', p.amount)}" /></td>
                                <td>${p.bank_name}</td>
                                <td>${p.bank_number}</td>
                                <td>${p.bank_user}</td>
                                <td>${p.create_datetime}</td>
                                <td>${p.update_datetime}</td>

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
