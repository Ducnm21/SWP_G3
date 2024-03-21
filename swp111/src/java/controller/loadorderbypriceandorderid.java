package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;
import model.Product;
import model.User;

public class loadorderbypriceandorderid extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        int uid = loggedInUser.getId();
        String price = request.getParameter("price");
        ProductDAO dao = new ProductDAO();
        
        try (PrintWriter out = response.getWriter()) {
            switch (price) {
                case "0-250000":
                    printOrderTable(out, dao.get0To250kProductByUser_ID(uid));
                    break;
                case "250000-500000":
                    printOrderTable(out, dao.get250kTo500kProductByUser_ID(uid));
                    break;
                case "500000-1000000":
                    printOrderTable(out, dao.get500kTo1mProductByUser_ID(uid));
                    break;
                case "1000000-5000000":
                    printOrderTable(out, dao.get1mTo5mProductByUser_ID(uid));
                    break;
                case "5000000-10000000":
                    printOrderTable(out, dao.getOver5mProductByUser_ID(uid));
                    break;
                default:
                    out.println("Invalid price range");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void printOrderTable(PrintWriter out, List<Product> productList) {
        out.println("<table class=\"table table-striped table-hover\">\n"
                + "   <thead>\n"
                + "       <th>ID</th>\n"
                + "       <th>Status</th>\n"
            //    + "       <th>Customer</th>\n"
                + "       <th>Topic</th>\n"
                + "       <th>Contact Method</th>\n"
                + "       <th>Public/Private</th>\n"
                + "       <th>Price</th>\n"
                + "       <th>Bearing Transaction Fees</th>\n"
                + "       <th>Transaction Fees</th>\n"
                + "       <th>Actual Received</th>\n"
                + "       <th>Created At</th>\n"
                + "       <th>Updated At</th>\n"
                + "       <th>Actions</th>\n"
                + "   </thead>\n"
                + "   <tbody>\n");

        for (Product o : productList) {
            out.println("<tr class=\"product\">\n"
                    + "   <td><a href=\"detailoforder?pid=" + o.getProduct_id() + "\">" + o.getProduct_id() + "</a></td>\n"
                    + "   <td>" + o.getStatus() + "</td>\n"

                    + "   <td>" + o.getTopic() + "</td>\n"
                    + "   <td>" + o.getContactmethod() + "</td>\n"
                    + "   <td>" + o.getPublicprivate() + "</td>\n"
                    + "   <td>" + o.getPrice() + "</td>\n"
                    + "   <td>" + o.getBearingtransactionfees() + "</td>\n"
                    + "   <td>" + o.getTransactionfees() + "</td>\n"
                    + "   <td>" + o.getActualreceived() + "</td>\n"
                    + "   <td>" + o.getCreated_at() + "</td>\n"
                    + "   <td>" + o.getUpdated_at() + "</td>\n"
                    + "   <td>\n"
                    + "       <a href=\"updateorder?pid=" + o.getProduct_id() + "\" class=\"edit\"><i class=\"material-icons\" title=\"Edit\">Update</i></a>\n"
                    + "       <a href=\"deleteorder?pid=" + o.getProduct_id() + "\" class=\"delete\"><i class=\"material-icons\">Delete</i></a>\n"
                    + "   </td>\n"
                    + "</tr>\n");
        }

        out.println("   </tbody>\n"
                + "</table>");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
