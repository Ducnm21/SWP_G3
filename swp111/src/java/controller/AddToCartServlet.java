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

/**
 *
 * @author nguyen ngoc quang
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/addtocart"})
public class AddToCartServlet extends HttpServlet {

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
        processRequest(request, response);
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
        String product_id_raw = request.getParameter("id");
        int product_idd = Integer.parseInt(product_id_raw);

        User u = (User) session.getAttribute("user");
        int user_id = u.getId();
        boolean productExistsInCart = false;
        BodyDAO d = new BodyDAO();
        List<CartXProduct> listCart = d.getAllCart(u.getId());

        if (u != null) {
            for (CartXProduct Cart : listCart) {
                if (Cart.getProduct_id() == product_idd) {
                    // Sản phẩm đã tồn tại trong giỏ hàng
                    productExistsInCart = true;
                    break;
                }
            }

            if (!productExistsInCart) {
                // Sản phẩm chưa tồn tại trong giỏ hàng, thêm vào giỏ hàng
                d.addToCart(product_idd, user_id, "Pending");
                response.getWriter().write("success");
            } else {
                // Sản phẩm đã tồn tại trong giỏ hàng
                response.getWriter().write("duplicate");
            }
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
