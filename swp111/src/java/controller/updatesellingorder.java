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
import model.Order;
import model.User;

/**
 *
 * @author VIVO-S15
 */
public class updatesellingorder extends HttpServlet {

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
        int pid = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        String title = request.getParameter("topic");
        String contactmethod = request.getParameter("contactmethod");
        String publicprivate = request.getParameter("publicprivate");
        String prices = request.getParameter("price");
        String bearingtransactionfees = request.getParameter("bearingtransactionfees");
        String description = request.getParameter("description");
        String hiddencontent = request.getParameter("hiddencontent");
        if (status.equals("Available")) {
            try {
                int price = Integer.parseInt(prices);
                int transactionfees = (int) Math.round(price * 0.01);

                HttpSession session = request.getSession();
                User loggedInUser = (User) session.getAttribute("user");
                ProductDAO dao = new ProductDAO();
                dao.updateProduct(pid, title, contactmethod, publicprivate, price, bearingtransactionfees, transactionfees, description, hiddencontent);
                response.sendRedirect("getorderbyuserid");
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Price must be a number.");
                request.getRequestDispatcher("addneworder.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Can not update product that is not Available");
            request.getRequestDispatcher("getorderbyuserid").forward(request, response);
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
