package controller;

import dal.RegisterDAO;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class NewPassword
 */
public class newpassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        RegisterDAO rd = new RegisterDAO();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SCAMLAMCHODEMO", "root",
                    "12345");
            PreparedStatement pst = con.prepareStatement("update users set password = ? where email = ? ");
            if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
                pst.setString(1, rd.encode(newPassword));
                pst.setString(2, (String) session.getAttribute("email"));
                int rowCount = pst.executeUpdate();
                if (rowCount > 0) {
                    request.setAttribute("status", "resetSuccess");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                }
                dispatcher.forward(request, response);
            } else if (newPassword != null && confPassword != null && !newPassword.equals(confPassword)) {
                request.setAttribute("status", "resetFailed");
                dispatcher = request.getRequestDispatcher("newPassword.jsp");
                dispatcher.forward(request, response);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(newpassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(newpassword.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
