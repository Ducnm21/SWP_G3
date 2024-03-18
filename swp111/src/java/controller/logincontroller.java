/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BodyDAO;
import dal.RegisterDAO;
import dal.UserDAO;
import dal.WalletDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.Wallet;
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
            UserDAO dao = new UserDAO();
            User u = dao.login(userRaw, rd.encode(passRaw));
            HttpSession session = request.getSession();
            BodyDAO d = new BodyDAO();
            Wallet w = d.getWalletById(u.getId());
            request.setAttribute("balance", w.getBalance());
            WalletDAO dw = new WalletDAO();
            Wallet AdW = dw.GetWalletAdmin();
            request.setAttribute("AdminBalance", AdW.getBalance());
            session.setAttribute("walletCurrent", w);
            if (u != null) {
                if (u.getBanned().equals("active")) {
                    session.setAttribute("user", u);
                    session.setMaxInactiveInterval(30000);
                    // Thay đổi dòng này để trả về "success" thay vì sử dụng RequestDispatcher
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("error");
                }

            } else {
                // Captcha doesn't match
                response.getWriter().write("error");
            }
        }
    }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
