/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {
    $("#loginButton").click(function () {
        $.ajax({
            type: 'GET',
            url: "login.jsp",
            success: function (response) {
                $("body").html(response);
            },
            error: function () {
                // Xử lý lỗi nếu có
                alert("Đã xảy ra lỗi khi tải trang");
            }
        });

    });
});


$(document).ready(function () {
    $("#logoutButton").click(function () {
        $.ajax({
            type: 'GET',
            url: "logout",
            success: function (response) {
                $("body").html(response);
            },
            error: function () {
                // Xử lý lỗi nếu có
                alert("Đã xảy ra lỗi khi tải trang");
            }
        });

    });
});