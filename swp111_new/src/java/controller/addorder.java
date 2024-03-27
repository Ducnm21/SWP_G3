/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;
import dal.ProductDAO;
import dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
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
public class addorder extends HttpServlet {

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

        if (loggedInUser != null) {
            int user_id = loggedInUser.getId();
            String title = request.getParameter("topic");
            String contactmethod = request.getParameter("contactmethod");
            String publicprivate = request.getParameter("publicprivate");
            String prices = request.getParameter("price");
            String bearingtransactionfees = request.getParameter("bearingtransactionfees");
            String description = request.getParameter("description");
            String hiddencontent = request.getParameter("hiddencontent");             
            
            
            try {
                double price = Integer.parseInt(prices);
                if (price < 0) {
                    request.setAttribute("errorMessage", "Price must be greater than 0.");
                    request.getRequestDispatcher("addneworder.jsp").forward(request, response);
                } else {
                    double transactionfeesPercentage = 0.01;
                    double transactionfees =  (price * transactionfeesPercentage);

                    if (title != null && contactmethod != null && publicprivate != null && bearingtransactionfees != null && description != null && hiddencontent != null) {
                        ProductDAO dao = new ProductDAO();
                        WalletDAO wd = new WalletDAO();
                        Wallet w = wd.getWalletByID(loggedInUser.getId());
                        wd.updateWalletAfterAdd(w, w.getBalance()-500);
                        Wallet wad = wd.GetWalletAdmin();
                        wd.updateWalletAfterAdd(wad, wad.getBalance()+500);
                        
                        dao.addNewProduct(title, contactmethod, publicprivate, price, bearingtransactionfees, description, hiddencontent, user_id);
                        request.setAttribute("mess", "The sale order has been add successfully");
                        //response.sendRedirect("getorderbyuserid");
                        request.getRequestDispatcher("getorderbyuserid").forward(request, response);
                    } else {
                        response.getWriter().println("Some parameters are missing.");
                    }
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Price must be a number.");
                request.getRequestDispatcher("addneworder.jsp").forward(request, response);

            }
        } else {
            response.getWriter().println("User is not logged in.");
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