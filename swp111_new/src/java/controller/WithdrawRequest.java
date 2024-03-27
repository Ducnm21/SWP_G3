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

import java.util.Date;
import java.util.List;
import model.User;
import model.Wallet;
import model.Withdrawal;

/**
 *
 * @author Admin
 */
@WebServlet(name = "WithdrawRequest", urlPatterns = {"/withdraw"})
public class WithdrawRequest extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        WalletDAO wa = new WalletDAO();
        Wallet w = wa.getWalletByID(user.getId());
        

        String Amount1 = request.getParameter("amount");

        double amount = Double.parseDouble(Amount1);
        String next = "withdrawalList.jsp";
       
        if (amount > w.getBalance()) {
            session.setAttribute("errorWithdraw", "The amount you requested exceeds the funds available in your account, please try again.");
            next = "WithdrawalRequest.jsp";
        } else {
            String bankName = request.getParameter("bankName");
            String bankUser = request.getParameter("bankUser");
            String bankNumber = request.getParameter("bankNumber");
            WithdrawalDAO wdb = new WithdrawalDAO();
            Withdrawal w1 = new Withdrawal( (int)amount, "In Process", bankUser, bankNumber, bankName, w.getId());
            wdb.InsertWithdrawal(w1);
            
            double newBalance = w.getBalance() - w1.getAmount();
            w.setBalance(newBalance); 
            WalletDAO wadb = new WalletDAO();
            wadb.updateWalletByID(w);
            
   

            List<Withdrawal> list = wdb.GetAllWithdrawalByWalletID(w1.getId());
            session.removeAttribute("errorWithdraw");
            session.setAttribute("listWithdraw", list);
            
        }
        
        request.getRequestDispatcher(next).forward(request, response);
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
