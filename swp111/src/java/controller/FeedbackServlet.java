/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BodyDAO;
import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "FeedbackServlet", urlPatterns = {"/sendfeedback"})
public class FeedbackServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FeedbackServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String seller_id = request.getParameter("uid");
        String product_id = request.getParameter("pid");
        int xseller = Integer.parseInt(seller_id);
        int xproduct = Integer.parseInt(product_id);
        request.setAttribute("seller_id", xseller);
        request.getRequestDispatcher("Feedback.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String feedbackContent = request.getParameter("feedback");
    
    HttpSession session = request.getSession();
    User loggedInUser = (User) session.getAttribute("user");
    int senderId = loggedInUser.getId();
    
    int receiverId = Integer.parseInt(request.getParameter("receiverIds"));
        System.out.println(receiverId);
        
    
    FeedbackDAO feedbackDAO = new FeedbackDAO();
    feedbackDAO.sendFeedback(feedbackContent, senderId, receiverId);
    request.setAttribute("feedbackSent", true);
    request.getRequestDispatcher("Feedback.jsp").forward(request, response);
    
    
   
    // Chuyển hướng người dùng đến một trang hoặc hiển thị thông báo thành công
    
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
