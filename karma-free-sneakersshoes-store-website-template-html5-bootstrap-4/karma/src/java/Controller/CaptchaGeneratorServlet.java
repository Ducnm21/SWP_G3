/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;
import javax.imageio.ImageIO;

/**
 *
 * @author 84353
 */
@WebServlet(name = "CaptchaGeneratorServlet", urlPatterns = {"/captchaGenerate"})
public class CaptchaGeneratorServlet extends HttpServlet {

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
            out.println("<title>Servlet CaptchaGeneratorServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CaptchaGeneratorServlet at " + request.getContextPath() + "</h1>");
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
        Random ran = new Random();
        String captchaText = generateCaptcha();
        BufferedImage img = getCaptchaImage();
        request.getSession().setAttribute("captcha", captchaText);
        ImageIO.write(img, "png", response.getOutputStream());
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static final String ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    public static final int WIDTH = 150;
    public static final int HEIGHT = 50;

    public static String generateCaptcha() {
        Random ran = new Random();
        StringBuilder cap = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            cap.append(ALPHABET.charAt(ran.nextInt(ALPHABET.length())));
        }
        return cap.toString();
    }

    public static BufferedImage genImage(String captcha) {
        BufferedImage img = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = img.createGraphics();
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, WIDTH, HEIGHT);
        graphics.setColor(Color.BLACK);
        graphics.setFont(new Font("Arial", Font.BOLD, 20));

        for (int i = 0; i < captcha.length(); i++) {
            int x = (int) (i * WIDTH / (double) captcha.length());
            int y = HEIGHT / 2 + 5;
            graphics.drawChars(captcha.toCharArray(), i, 1, x, y);
        }

        for (int i = 0; i < 5; i++) {
            graphics.setColor(new Color(150 + new Random().nextInt(100), 150 + new Random().nextInt(100), 150 + new Random().nextInt(100)));
            int x1 = new Random().nextInt(WIDTH);
            int y1 = new Random().nextInt(HEIGHT);
            int x2 = new Random().nextInt(WIDTH);
            int y2 = new Random().nextInt(HEIGHT);
            graphics.drawLine(x1, y1, x2, y2);
        }

        graphics.dispose();
        return img;
    }

    public static BufferedImage getCaptchaImage() {
        String captchaText = generateCaptcha();
        return genImage(captchaText);
    }

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
