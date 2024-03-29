/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author VIVO-S15
 */
public class searchbycustomername extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        int uid = loggedInUser.getId();
        String txtSearch = request.getParameter("txt");
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.searchByCustomerNameWithUser_ID(txtSearch, uid);
        PrintWriter out = response.getWriter();
        out.println("<table class=\"table table-striped table-hover\">\n"
                + "   <thead>\n"
                + "       <th>ID</th>\n"
                + "       <th>Status</th>\n"
            //    + "       <th>Customer</th>\n"
                + "       <th>Topic</th>\n"
                + "       <th>Contact Method</th>\n"
                + "       <th>Public/Private</th>\n"
                + "       <th>Price</th>\n"
                + "       <th>Bearing Transaction Fees</th>\n"
                + "       <th>Transaction Fees</th>\n"
                + "       <th>Actual Received</th>\n"
                + "       <th>Created At</th>\n"
                + "       <th>Updated At</th>\n"
                + "       <th>Actions</th>\n"
                + "   </thead>\n"
                + "   <tbody>\n");

        for (Product o : list) {
            out.println("<tr class=\"product\">\n"
                    + "   <td><a href=\"detailoforder?pid=" + o.getProduct_id() + "\">" + o.getProduct_id() + "</a></td>\n"
                    + "   <td>" + o.getStatus() + "</td>\n"
                    + "   <td>" + o.getTopic() + "</td>\n"
                    + "   <td>" + o.getContactmethod() + "</td>\n"
                    + "   <td>" + o.getPublicprivate() + "</td>\n"
                    + "   <td>" + o.getPrice() + "</td>\n"
                    + "   <td>" + o.getBearingtransactionfees() + "</td>\n"
                    + "   <td>" + o.getTransactionfees() + "</td>\n"
                    + "   <td>" + o.getActualreceived() + "</td>\n"
                    + "   <td>" + o.getCreated_at() + "</td>\n"
                    + "   <td>" + o.getUpdated_at() + "</td>\n"
                    + "   <td>\n"
                    + "       <a href=\"updateorder?pid=" + o.getProduct_id() + "\" class=\"edit\"><i class=\"material-icons\" title=\"Edit\">Update</i></a>\n"
                    + "       <a href=\"deleteorder?pid=" + o.getProduct_id() + "\" class=\"delete\"><i class=\"material-icons\">Delete</i></a>\n"
                    + "   </td>\n"
                    + "</tr>\n");
        }

        out.println("   </tbody>\n"
                + "</table>");
        request.setAttribute("sn", txtSearch);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
