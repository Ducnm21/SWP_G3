package controller;

import dal.BodyDAO;
import dal.NewsDAO;
import dal.RegisterDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.User;
import model.Wallet;
import validate.ValidateRegister;

@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/updateprofile"})
public class UpdateProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User LoggedUser = (User) session.getAttribute("user");

        BodyDAO d = new BodyDAO();
        Wallet w = d.getWalletById(LoggedUser.getId());
        System.out.println(w);
        request.setAttribute("balance", w.getBalance());

        request.getRequestDispatcher("UpdateProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String id_raw = request.getParameter("id");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String username = request.getParameter("username");
    String fullname = request.getParameter("fullname");
    String mobile = request.getParameter("phone");

    UserDAO dao = new UserDAO();
    RegisterDAO rd = new RegisterDAO();
    ValidateRegister val = new ValidateRegister();
    
    boolean checkPhone = val.CheckMobile(mobile);
    
    try {
        int user_id = Integer.parseInt(id_raw);
        
        // Check if the new username is already taken
        if (dao.isUsernameTaken(username, user_id)) {
            request.setAttribute("error_username_taken", "Username already exists. Please choose a different one.");
            request.getRequestDispatcher("UpdateProfile.jsp").forward(request, response);
            return;
        }
         if (dao.isPhoneTaken(mobile, user_id)) {
                request.setAttribute("error_phone_taken", "Phone number already exists. Please choose a different one.");
                request.getRequestDispatcher("UpdateProfile.jsp").forward(request, response);
                return;
            }
         if(checkPhone == false){
             request.setAttribute("error_phone_invalid", "Your Phone number is wrong format. ");
             request.getRequestDispatcher("UpdateProfile.jsp").forward(request, response);
             return;
         }
                 

        // Proceed with updating the user's profile
        User updatedUser = new User(username, password, email, mobile, fullname);
        updatedUser.setId(user_id);
        dao.update(updatedUser);

        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.setAttribute("user", updatedUser);
        session.setMaxInactiveInterval(30000);

        request.getRequestDispatcher("getallproduct").forward(request, response);
    } catch (NumberFormatException e) {
        System.out.println("Error");
    }
}
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
