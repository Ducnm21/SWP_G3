/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
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
        try ( PrintWriter out = response.getWriter()) {
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
        BufferedImage img = getCaptchaImage(captchaText);
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
    public static final String ALPHABET = "0123456789";
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
        graphics.setColor(new Color(255, 255, 220)); // Set slightly yellow background
        graphics.fillRect(0, 0, WIDTH, HEIGHT);
        graphics.setColor(Color.BLACK);
        graphics.setFont(new Font("Arial", Font.BOLD, 20));

        // Distort the text by skewing it and adding random noise
        AffineTransform skew = AffineTransform.getShearInstance(0.1, 0);
        Random rand = new Random();
        for (int i = 0; i < captcha.length(); i++) {
            int x = (int) (i * WIDTH / (double) captcha.length());
            int y = HEIGHT / 2 + 5;
            double angle = rand.nextDouble() * 0.2 - 0.1; // Add random noise to the angle
            AffineTransform rotate = AffineTransform.getRotateInstance(angle);

            // Combine the shear and rotation transformations
            AffineTransform combinedTransform = new AffineTransform();
            combinedTransform.concatenate(skew);
            combinedTransform.concatenate(rotate);

            // Apply the combined transformation directly to the graphics context
            graphics.setTransform(combinedTransform);

            graphics.drawChars(captcha.toCharArray(), i, 1, x, y);
        }

        // Add wavy lines and random dots to the image
        graphics.setStroke(new BasicStroke(2, BasicStroke.CAP_ROUND, BasicStroke.JOIN_BEVEL));
        graphics.setColor(Color.GRAY);
        for (int i = 0; i < 3; i++) {
            int x1 = 0;
            int y1 = HEIGHT / 2;
            int x2 = WIDTH;
            int y2 = HEIGHT / 2;
            double amplitude = 5;
            double frequency = 0.05;
            for (int x = 0; x < WIDTH; x++) {
                double dx = (x / (double) WIDTH) * 2 * Math.PI;
                double y = amplitude * Math.sin(frequency * dx);
                y1 = (int) (y1 + y);
                x1 = x;
            }
            graphics.drawLine(x1, y1, x2, y2);
        }
        for (int i = 0; i < 100; i++) {
            int x = rand.nextInt(WIDTH);
            int y = rand.nextInt(HEIGHT);
            graphics.drawOval(x, y, 1, 1);
        }

        graphics.dispose();
        return img;
    }

    public static BufferedImage getCaptchaImage(String captchaT) {
        return genImage(captchaT);
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
