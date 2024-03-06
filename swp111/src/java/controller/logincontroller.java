/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RegisterDAO;
import dal.UserDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import validate.ValidateRegister;

/**
 *
 * @author VIVO-S15
 */
public class logincontroller extends HttpServlet {

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
        response.setContentType("text/plain;charset=UTF-8");

        String userRaw = request.getParameter("username");
        String passRaw = request.getParameter("password");
        String captchaEntered = request.getParameter("captchaEntered");
        String sessionCaptcha = (String) request.getSession().getAttribute("captcha");
        ValidateRegister v = new ValidateRegister();
        boolean checkpass = v.CheckPassword(passRaw);
        RegisterDAO rd = new RegisterDAO();

        if (captchaEntered != null && captchaEntered.equals(sessionCaptcha)) {
            UserDao dao = new UserDao();
            User u = dao.login(userRaw, rd.encode(passRaw));

            if (u != null && rd.encode(passRaw).equals(u.getPassword()) && checkpass) {
                // Instead of using request dispatcher, send a success response
                request.setAttribute("uu",  u.getUsername());
                RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp") ;
                response.getWriter().write("success");
            } else {
                // Instead of using request dispatcher, send an error response
                response.getWriter().write("error");
            }
        } else {
            // Captcha doesn't match
            response.getWriter().write("error");
        }
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