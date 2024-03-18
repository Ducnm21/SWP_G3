/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BodyDAO;
import dal.RegisterDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.Wallet;
import validate.ValidateRegister;

@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/changepassword"})
public class ChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        System.out.println(s.getAttribute("user"));

        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        RegisterDAO rd = new RegisterDAO();
        ValidateRegister val = new ValidateRegister();
        String id_raw = request.getParameter("id");
        String curentpassword = request.getParameter("curentpassword");
        String newpassword = request.getParameter("newpassword");
        String confirmPassword = request.getParameter("confirmPassword");
        boolean checknewpass = val.CheckPassword(newpassword);

        try {
            int user_id = Integer.parseInt(id_raw);

            // Kiểm tra xem tất cả các trường có được điền đầy đủ không
            if (curentpassword.isEmpty() || newpassword.isEmpty() || confirmPassword.isEmpty()) {
                request.setAttribute("error_password_missinginfo", "Missing info");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                return;
            } // Kiểm tra xem mật khẩu mới và mật khẩu xác nhận có trùng khớp không
            else if (!newpassword.equals(confirmPassword)) {
                request.setAttribute("error_password_not_duplicate", "new password and confirmpassword aren't duplicate");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                return;
            } else if (checknewpass == false) {
                request.setAttribute("error_password_invalid", "Your newpassword must have at least 8 characters,contains at least one digit, one lowercase letter, one uppercase letter, one special character from the specified setand does not contain any whitespace characters.\"");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                return;
            }

            // Kiểm tra xem mật khẩu hiện tại có trùng khớp với mật khẩu trong cơ sở dữ liệu không
            User user = ud.getUserByID(user_id);
            if (user == null || !user.getPassword().equals(rd.encode(curentpassword))) {
                request.setAttribute("error_password_curentpassword", "Curentpassword isn't exist in database");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
                return;
            }

            BodyDAO d = new BodyDAO();
            Wallet w = d.getWalletById(user.getId());
            request.setAttribute("balance", w.getBalance());
            // Thực hiện thay đổi mật khẩu trong cơ sở dữ liệu và chuyển hướng người dùng đến trang homepage.jsp
            
            
            ud.updatepassword(newpassword, user_id);
            request.getRequestDispatcher("homepage.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("changepassword.jsp?error=invalid_id");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
