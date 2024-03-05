/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BodyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.CartXOrder;
import model.CartXProduct;
import model.User;
import model.Wallet;

/**
 *
 * @author nguyen ngoc quang
 */
@WebServlet(name = "CheckOut", urlPatterns = {"/checkout"})
public class CheckOut extends HttpServlet {

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
        HttpSession session = request.getSession();
        BodyDAO d = new BodyDAO();
        User u = (User) session.getAttribute("user");
        List<CartXProduct> list = d.getAllCart(u.getId());

        double fee = 0;
        for (int i = 0; i < list.size(); i++) {
            fee += list.get(i).getPrice() + list.get(i).getTransactionfees();
        }
        Wallet w = d.getWalletById(u.getId());
        double balance = w.getBalance();

        if (balance < fee) {
            
            request.setAttribute("errorcheckout", "Your account is not enough to pay this bill");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            d.updateWallet(balance - fee, u.getId());
            d.updateCart(u.getId());
            for (CartXProduct cart : list) {
                d.chgStatusProduct(cart.getProduct_id());
            }
            
            request.setAttribute("checkoutsuccessfull", "Thank you for your trust in us");
            try {
                // Tạm dừng thực thi trong 5 giây
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            // Chuyển hướng sau khi đợi 5 giây
            response.sendRedirect("getallproduct");
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
