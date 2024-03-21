/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.WalletDAO;

import dal.WithdrawalDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import model.User;
import model.Wallet;
import model.Withdrawal;

/**
 *
 * @author Admin
 */
@WebServlet(name = "withdrawFilter", urlPatterns = {"/withdrawFilter"})
public class WithdrawFilter extends HttpServlet {
    
     private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);


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
        HttpSession ss = request.getSession();
        WithdrawalDAO wdb = new WithdrawalDAO();
        String withdrawSelect = request.getParameter("withdrawFilter");
        if (withdrawSelect.equals("All")) {
            List<Withdrawal> list = wdb.GetAllWithdrawal();
            ss.setAttribute("listWithdraw", list);
        } else {
            List<Withdrawal> list = wdb.GetAllWithdrawalByStatus(withdrawSelect);
            ss.setAttribute("listWithdraw", list);
        }
        ss.setAttribute("withdrawSelect", withdrawSelect);
        // Xóa thuộc tính "withdrawSelect" sau 3 giây
        scheduler.schedule(() -> {
            ss.removeAttribute("withdrawFilter");
        }, 1, TimeUnit.SECONDS);
        request.getRequestDispatcher("WithdrawalListAdmin.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        WithdrawalDAO wdb = new WithdrawalDAO();
        WalletDAO wa = new WalletDAO();
        User user = (User) session.getAttribute("user");
        Wallet w = wa.getWalletByID(user.getId());
        
        String withdrawSelect = request.getParameter("withdrawSelect");
        if (withdrawSelect.equals("All")) {
            List<Withdrawal> list = wdb.GetAllWithdrawalByWalletID(w.getId());
            session.setAttribute("listWithdraw", list);
        } else {
            List<Withdrawal> list = wdb.GetAllWithdrawalByStatusAndWalletID(w.getId(), withdrawSelect);
            session.setAttribute("listWithdraw", list);
        }
        session.setAttribute("withdrawSelect", withdrawSelect);
        
        scheduler.schedule(() -> {
            session.removeAttribute("withdrawSelect");
        }, 1, TimeUnit.SECONDS);
        
        request.getRequestDispatcher("withdrawalList.jsp").forward(request, response);
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
