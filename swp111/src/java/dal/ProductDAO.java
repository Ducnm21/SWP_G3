/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.DB_URL;
import static dal.DBContext.PASSWORD;
import static dal.DBContext.USER_NAME;
import static dal.DBContext.getConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDAO {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products where status = 'Available'";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("customer"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getInt("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getInt("transactionfees"),
                        rs.getInt("actualreceived"),
                        rs.getString("description"),
                        rs.getString("hiddencontent"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        rs.getInt("user_id"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
        public Product getProductByID(int id) {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(
                        rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("customer"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getInt("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getInt("transactionfees"),
                        rs.getInt("actualreceived"),
                        rs.getString("description"),
                        rs.getString("hiddencontent"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        rs.getInt("user_id"));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
//        Product p = dao.getProductByID(8);
        List<Product> list = dao.getAllProduct();
        for (Product product : list) {
            
                System.out.println(product);
        }
    }
}
