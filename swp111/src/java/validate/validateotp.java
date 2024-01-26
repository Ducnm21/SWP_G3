package validate;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtp
 */
public class validateotp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("otp");
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");

        RequestDispatcher dispatcher = null;

        if (isNumeric(value)) {
            try {
                int enteredOtp = Integer.parseInt(value);

                if (enteredOtp == otp) {
                    request.setAttribute("email", request.getParameter("email"));
                    request.setAttribute("status", "");
                    dispatcher = request.getRequestDispatcher("newPassword.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // If the entered OTP doesn't match the stored OTP
                    request.setAttribute("message", "InvalidOTP");
                    dispatcher = request.getRequestDispatcher("enterOtp.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException e) {
                // Handle the case where the entered value is not a valid integer
                request.setAttribute("message", "InvalidInput");
                dispatcher = request.getRequestDispatcher("enterOtp.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // If the entered OTP contains non-numeric characters
            request.setAttribute("message", "NonNumericOTP");
            dispatcher = request.getRequestDispatcher("enterOtp.jsp");
            dispatcher.forward(request, response);
        }
    }

// Helper method to check if a string is numeric
    private boolean isNumeric(String str) {
        return str.matches("\\d+");
    }

}
