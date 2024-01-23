/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;
import dal.*;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author 84353
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        request.setAttribute("username", user);
        request.setAttribute("pass", pass);
        String captcha = request.getParameter("capchaRespone");
        String sessionCaptcha = (String) request.getSession().getAttribute("captcha");
        dal 
        User us = dal.Login(user, pass);

//        validate val = new validate();
        try {
            if (captcha != null && captcha.equals(sessionCaptcha)) {
                if (user.equals("")) {
                    response.getWriter().write("Username cannot be empty!");
                } else if (pass.equals("")) {
                    response.getWriter().write("Password cannot be empty!");
                } else {
                    if (us == null) {
                        response.getWriter().write("ACCOUNT DOES NOT EXIT!");
                    } else if (us.isIs_Active() == false) {
                        response.getWriter().write("ACCOUNT HAS BANNED!");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("user", us);
                        session.setAttribute("displayname",us.getDisplay_name());
                        session.setAttribute("status", 0);
                        response.getWriter().write("success");
                        
                    }
                }

            }else if(captcha.isEmpty()){
                response.getWriter().write("Captcha cannot be empty!");
            }else{
                response.getWriter().write("Captcha wrong!");
            }

            }
//            if(val.checkInput(pass, "\"^(?=.*[!@#$%^&*(),.?\\\":{}|<>]).*$\"", 3, 15))
         catch (Exception e) {
            System.out.println("Error");
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
