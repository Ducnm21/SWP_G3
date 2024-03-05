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
import model.Cart;
import model.CartXOrder;
import model.CartXProduct;

import model.User;
import model.Wallet;

/**
 *
 * @author nguyen ngoc quang
 */
public class BodyDAO extends DBContext {


    public void deleteOrder(String oid) {
        String sql = "DELETE FROM orders WHERE order_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, oid);
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void addNewOrder(String topic, String contactmethod, String publicprivate, int price, String bearingtransactionfees, int transactionfees, String description, String hiddencontent, int user_id) {
        String sql = "INSERT INTO orders (status, customer, topic, contactmethod, publicprivate, price, bearingtransactionfees, transactionfees, actualreceived, description, hiddencontent, user_id) VALUES\n"
                + "('Available', 'Not yet', ?, ?, ?, ?, ?, ?, 'Not yet', ?, ?, ?);";

        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, topic);
            st.setString(2, contactmethod);
            st.setString(3, publicprivate);
            st.setInt(4, price);
            st.setString(5, bearingtransactionfees);
            st.setInt(6, transactionfees);
            st.setString(7, description);
            st.setString(8, hiddencontent);
            st.setInt(9, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addToCart(int product_id, int user_id, String status) {
        String sql = "INSERT INTO cart (product_id,user_id,status) VALUES\n"
                + "(?,?,?);";

        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, product_id);
            st.setInt(2, user_id);
            st.setString(3, status);

            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void chgStatusProduct(int product_id) {
        String sql = "UPDATE products\n"
                + "SET status = 'Out of Stock'\n"
                + "WHERE product_id IN (SELECT product_id FROM cart where product_id = ?);";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, product_id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCart(int user_id) {
        String sql = "UPDATE cart\n"
                + "SET status= 'completely'\n"
                + "WHERE user_id = ? and status ='Pending';";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<CartXProduct> getAllCart(int user_id) {
        List<CartXProduct> list = new ArrayList<>();
        String sql = "SELECT cart.cart_id, products.product_id, products.status, products.topic, products.customer, products.contactmethod, products.price, products.price, products.bearingtransactionfees, products.transactionfees\n"
                + "FROM products\n"
                + "INNER JOIN cart ON cart.product_id = products.product_id\n"
                + "WHERE cart.status='pending'and cart.user_id=?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartXProduct c = new CartXProduct(rs.getInt("cart_id"),
                        rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("customer"),
                        rs.getString("contactmethod"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getInt("transactionfees"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Wallet updateWallet(double balance, int user_id) {
        String sql = "UPDATE wallet SET balance= ?\n"
                + "WHERE user_id= ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setDouble(1, balance);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Wallet getWalletById(int user_id) {
        String sql = "SELECT * FROM wallet WHERE user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Wallet(rs.getInt("user_id"), rs.getDouble("balance"));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<CartXOrder> getAllCartPending(int user_id) {
        List<CartXOrder> list = new ArrayList<>();
        String sql = "SELECT cart.cart_id, cart.user_id, products.product_id, products.status\n"
                + "                FROM products\n"
                + "                INNER JOIN cart ON cart.product_id = products.product_id\n"
                + "                WHERE cart.status='pending' and cart.user_id=?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartXOrder c = new CartXOrder(rs.getInt("cart_id"), rs.getInt("order_id"), rs.getInt("user_id"), rs.getString("status"), rs.getString("topic"),
                        rs.getString("username"), rs.getString("contactmethod"), rs.getInt("price"), rs.getString("bearingtransactionfees"), rs.getInt("transactionfees"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Cart deleteCart(int product_id, int user_id) {
        String sql = "UPDATE cart\n"
                + "SET status= 'cancelled'\n"
                + "WHERE product_id = ? and user_id=?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, product_id);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        BodyDAO d = new BodyDAO();

        List<CartXProduct> c = d.getAllCart(1);
        d.addToCart(1, 1, "pending");
//        for (CartXProduct CartXProduct : c) {
//            System.out.println(CartXProduct);
//        }

    }
}
