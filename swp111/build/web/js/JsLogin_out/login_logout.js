


function openLoginPopup() {
    document.getElementById("loginPopup").style.display = "block";
    document.getElementById("backgroundOverlay").style.display = "block";
    document.getElementById("backgroundOverlay").addEventListener("click", closeLoginPopup);
}

function closeLoginPopup(event) {
    event.preventDefault();
    document.getElementById("loginPopup").style.display = "none";
    document.getElementById("backgroundOverlay").style.display = "none";
    document.getElementById("backgroundOverlay").removeEventListener("click", closeLoginPopup);
}

function refreshCaptcha() {
    // Perform AJAX request to refresh captcha
    $.ajax({
        type: "GET",
        url: "captchaGenerate",
        success: function (response) {
            // Update the captcha image source
            $("#captchaImage").attr("src", "captchaGenerate");
        },
        error: function () {
            // Handle error
            console.error("Error refreshing captcha");
        }
    });
}
function login() {
    var username = $("#username").val();
    var password = $("#password").val();
    var captcha = $("#captcha").val();

    // Hiển thị loader trước khi gửi AJAX request
    showLoader();

    // Perform AJAX request
    $.ajax({
        type: "POST",
        url: "logincontroller",
        data: {
            username: username,
            password: password,
            captchaEntered: captcha
        },
        success: function (response) {
            if (response.trim() === "success") {
                // Chuyển hướng sau 2 giây
                setTimeout(function () {
                    window.location.href = "getallproduct";
                }, 2000); // 2000 milliseconds = 2 giây
            } else if (response.trim() === "error") {
                // Display message for a banned account
                $("#error").text("Your Account has been banned!");
                refreshCaptcha();
            } else {
                // Display general error message
                $("#error").text("Invalid username, password, or captcha");
                refreshCaptcha();
            }
        },
        error: function () {
            // Handle error
            $("#error").text("An error occurred during login");
        },
        complete: function () {
            // Ẩn loader sau khi nhận phản hồi từ server
            hideLoader();
        }
    });
}