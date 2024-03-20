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
import model.User;

/**
 *
 * @author admin
 */
public class DAO {
    public List<Product> searchByProduct(String txt){
        List<Product> list = new ArrayList<>();
        String sql = "select * from products\n"
                + "where topic like ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getInt("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getInt("transactionfees"),
                        rs.getInt("actualreceived"),
                        rs.getString("description"),
                        rs.getString("hiddencontent"),
                        rs.getInt("user_id")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public List<User> SearchByName(String txt) {
        List<User> list = new ArrayList<>();
        String sql = "select * from users\n"
                + "where fullname like ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getString("fullname"),
                        rs.getString("created_at"),
                        rs.getString("deleted_by"),
                        rs.getString("updated_by"),
                        rs.getInt("is_admin"),
                        rs.getString("banned"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        DAO d = new DAO();
        List<Product> list = new ArrayList<>();
        list = d.searchByProduct("B");
        for (Product product : list) {
            System.out.println(product);
        }
    }
}
