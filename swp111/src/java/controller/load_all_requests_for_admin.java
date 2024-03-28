/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ConflictDAO;
import dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Conflict;
import model.User;
import model.Wallet;

/**
 *
 * @author VIVO-S15
 */
public class load_all_requests_for_admin extends HttpServlet {
   
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadAccount at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
    public static void main(String[] args){
        ConflictDAO dao = new ConflictDAO();
        List<Conflict> list = dao.getAllRequestForAdmin();
        for(Conflict c : list){
            System.out.println(c);
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
        ConflictDAO dao = new ConflictDAO();
        List<Conflict> list = dao.getAllRequestForAdmin();
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user"); // Giả sử bạn đã lưu đối tượng User trong session với key "user"
        if (loggedInUser == null) {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
         WalletDAO dw = new WalletDAO();
        Wallet AdW = dw.GetWalletAdmin();
        request.setAttribute("AdminBalance", String.format("%,.0f", AdW.getBalance()) + " ₫");
        request.setAttribute("ListConflict", list);
        request.getRequestDispatcher("ManageConflict.jsp").forward(request, response);
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
