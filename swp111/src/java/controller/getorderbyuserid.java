/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BodyDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.Product;
import model.User;
import model.Wallet;

/**
 *
 * @author VIVO-S15
 */
public class getorderbyuserid extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        int uid = loggedInUser.getId();
        ProductDAO dao = new ProductDAO();

        // Kiểm tra xem đối tượng Order có tồn tại không
        List<Product> listProductByUserID = new ArrayList<>(); // Tạo một danh sách mới
        
        
        listProductByUserID = dao.getProductByUser_ID(uid);
        BodyDAO d = new BodyDAO();
        Wallet w = d.getWalletById(loggedInUser.getId());
        
        request.setAttribute("balancep", w.getBalance());
//        for (Product product : listProductByUserID) {
//                request.setAttribute("pricepp", String.format("%,.0f",(double) product.getPrice()) + " ₫");
//                request.setAttribute("transactionfeespp", String.format("%,.0f",(double) product.getTransactionfees()) + " ₫");
//                request.setAttribute("actualreceivedpp", String.format("%,.0f",(double) product.getActualreceived()) + " ₫");
//        }
        
        request.setAttribute("listProductByUserID", listProductByUserID);
        request.getRequestDispatcher("donbancuatoi.jsp").forward(request, response);

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
