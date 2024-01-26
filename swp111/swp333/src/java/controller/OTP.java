/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dal.RegisterDAO;
import model.User;

/**
 *
 * @author hung1
 */
@WebServlet(name = "OTP", urlPatterns = {"/OTP"})
public class OTP extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String otp = request.getParameter("otp1")
                    + request.getParameter("otp2")
                    + request.getParameter("otp3")
                    + request.getParameter("otp4")
                    + request.getParameter("otp5")
                    + request.getParameter("otp6");
            HttpSession session = request.getSession();
            String otpreturn = (String) session.getAttribute("hung");
            
            RegisterDAO dao = new RegisterDAO();
            if (otp.equals(otpreturn)) {
//            User u  = (User) request.getSession().getAttribute("user");
//            dao.AddUser(u.getUsername(), u.getPassword(), u.getEmail(), u.getMobile(), u.getFullname());
//request.getRequestDispatcher("login.jsp").forward(request, response);
                String usern = (String) request.getSession().getAttribute("user");
                request.setAttribute("uuu", usern);
                request.getRequestDispatcher("newjsp.jsp").forward(request, response);

            } else {
                String baoLoi = "Mã OTP của bạn không chính xác!";
                request.setAttribute("error", baoLoi);
                request.getRequestDispatcher("OTP.jsp").forward(request, response);
            }
        }
   
}


// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
