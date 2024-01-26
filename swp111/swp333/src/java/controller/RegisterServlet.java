/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.RegisterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.Email;
import model.RandomNumber;
import validate.ValidateRegister;

/**
 *
 * @author nguyen ngoc quang
 */
@WebServlet(name="RegisterServlet", urlPatterns={"/register"})
public class RegisterServlet extends HttpServlet {
   
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
            out.println("<title>Servlet RegisterServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath () + "</h1>");
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
       request.getRequestDispatcher("register.jsp").forward(request, response);
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
       ValidateRegister va=new ValidateRegister();
        HttpSession session = request.getSession();
        request.removeAttribute("ivalidemail");
        request.removeAttribute("checkpass");
        request.removeAttribute("checkmobile");
        request.removeAttribute("checkmail");
        request.removeAttribute("error_register");
        request.removeAttribute("d");
        request.removeAttribute("error_password");
        RegisterDAO rd = new RegisterDAO();
        User u = new User();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password1 = request.getParameter("password1");
        boolean checkpass=va.CheckPassword(password);
        boolean checkemail=va.CheckEmail(email);
        boolean checkmobile=va.CheckMobile(mobile);
        boolean b = rd.checkRegister(username);
        boolean e=rd.checkEmail(email);
        if (b == false) {
            request.setAttribute("error_register", "Username has already exist");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (!password.equals(password1)) {
            request.setAttribute("error_password", "Invalid repassword");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if(e==false){
            request.setAttribute("ivalidemail", "Your email has already exist, please type again!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if(checkpass==false){
            request.setAttribute("checkpass", "Your password must have at least 8 characters,contains at least one digit, one lowercase letter, one uppercase letter, one special character from the specified setand does not contain any whitespace characters.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if(checkmobile==false){
            request.setAttribute("checkmobile", "The phone number may start with an optional area code enclosed in parentheses, after the area code, there may be an optional separator ('-', '.', or space), the next three digits represent the local exchange code, there may be another optional separator, the last four digits represent the subscriber number.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if(checkemail==false){
            request.setAttribute("checkemail", "Your email must starts with at least one alphanumeric character, can be followed by zero or more alphanumeric characters, must contain the at symbol (@), can have a dot (.) followed by one or more alphanumeric characters representing the TLD.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else {
             RandomNumber random = new RandomNumber();
                String otp = random.maOTP();
                Email e = new Email();
                e.sendEmail(email, "Xác thực tài khoản tại SCLC", rd.getNoiDung(u, otp));
                session.setAttribute("hung", otp);
                session.setAttribute("user", u);
                session.setMaxInactiveInterval(300);
                request.getRequestDispatcher("OTP").forward(request, response);



        }
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
