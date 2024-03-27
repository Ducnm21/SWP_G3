/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Product;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "ProductDetails", urlPatterns = {"/productdetails"})
public class ProductDetails extends HttpServlet {

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
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập hoặc trang chính
            response.sendRedirect("login.jsp");
            return;
        }
        ProductDAO dao = new ProductDAO();
        int pid = Integer.parseInt(request.getParameter("pid"));
        Product p = dao.getProductByID(pid);
        request.setAttribute("product_idp", p.getProduct_id());
        request.setAttribute("statusp", p.getStatus());

        request.setAttribute("topicp", p.getTopic());
        request.setAttribute("contactmethodp", p.getContactmethod());
        request.setAttribute("publicprivatep", p.getPublicprivate());
        request.setAttribute("pricep", p.getPrice());
        request.setAttribute("bearingtransactionfeesp", p.getBearingtransactionfees());
        request.setAttribute("transactionfeesp", p.getTransactionfees());
        request.setAttribute("actualreceivedp", p.getActualreceived());
        request.setAttribute("descriptionp", p.getDescription());
        request.setAttribute("hiddencontentp", p.getHiddencontent());
        request.setAttribute("created_atp", p.getCreated_at());
        request.setAttribute("updated_atp", p.getUpdated_at());
        request.setAttribute("Details", p);
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
