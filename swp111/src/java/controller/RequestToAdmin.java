/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ConflictDAO;
import dal.WalletDAO;
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

/**
 *
 * @author VIVO-S15
 */
@WebServlet(name = "RequestToAdmin", urlPatterns = {"/requestToAdmin"})
public class RequestToAdmin extends HttpServlet {

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
        
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String pid_raw = request.getParameter("pid");
        int pid = Integer.parseInt(pid_raw);
        User loggedInUser = (User) session.getAttribute("user");
        int sender_buyer_id = loggedInUser.getId();

        WalletDAO wd = new WalletDAO();
        Wallet w = wd.getWalletByID(loggedInUser.getId());
        double balance = w.getBalance();

        if (balance < 10000) {
            session.setAttribute("errorRequest", "Your account must have atleast 10,000 VND for making request's conflict!");
            request.getRequestDispatcher("viewdetail").forward(request, response);
        }else{
             // Số tiền đủ, thực hiện giao dịch
        ConflictDAO dao = new ConflictDAO();
        Wallet wad = wd.GetWalletAdmin();
        wd.updateWalletAfterAdd(w, balance - 10000);
        wd.updateWalletAfterAdd(wad, wad.getBalance() + 10000);
        dao.sendRequest(sender_buyer_id, pid);
        request.getRequestDispatcher("getallproduct").forward(request, response);
        response.getWriter().write("success");
        }

       
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
