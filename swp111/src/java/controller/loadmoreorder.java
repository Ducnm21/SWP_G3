/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;

/**
 *
 * @author VIVO-S15
 */
public class loadmoreorder extends HttpServlet {

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
        OrderDAO dao = new OrderDAO();
        List<Order> list = dao.getTop3();
        PrintWriter out = response.getWriter();
        for (Order o : list) {
            out.println("<table  class=\"table table-striped table-hover\">\n"
                    + "                <thead>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                <th></th>\n"
                    + "                </thead>\n"
                    + "                <tbody>\n"
                    + "                        <tr>\n"
                    + "                            <th><a href=\"detailoforder?oid=" + o.getId() + "\">" + o.getId() + "</a></th>\n"
                    + "                            <th>" + o.getStatus() + "</th>\n"
                    + "                            <th>" + o.getCustomer() + "</th>\n"
                    + "                            <th>" + o.getTopic() + "</th>\n"
                    + "                            <th>" + o.getContactmethod() + "</th>\n"
                    + "                            <th>" + o.getPublicprivate() + "</th>\n"
                    + "                            <th>" + o.getPrice() + "</th>\n"
                    + "                            <th>" + o.getBearingtransactionfees() + "</th>\n"
                    + "                            <th>" + o.getTransactionfees() + "</th>\n"
                    + "                            <th>" + o.getActualreceived() + "</th>\n"
                    + "                            <th>" + o.getCreated_at() + "</th>\n"
                    + "                            <th>" + o.getUpdated_at() + "</th>\n"
                    + "                            <td>\n"
                    + "                                <a href=\"updateorder?oid=" + o.getId() + "\"  class=\"edit\"><i class=\"material-icons\"  title=\"Edit\">Update</i></a>\n"
                    + "                                <a href=\"deleteorder?oid=" + o.getId() + "\" class=\"delete\" ><i class=\"material-icons\">Delete</i></a>\n"
                    + "                            </td>\n"
                    + "                        </tr>\n"
                    + "                </tbody>    \n"
                    + "            </table>");

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
