/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.DB_URL;
import static dal.DBContext.PASSWORD;
import static dal.DBContext.USER_NAME;
import static dal.DBContext.getConnection;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author VIVO-S15
 */
public class OrderDAO {

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("order_id"),
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
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Order getOrderByID(String id) {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt("order_id"),
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

    public List<Order> getTop3() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders \n"
                + "LIMIT 3;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("order_id"),
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
                list.add(o);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getTop5ByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders where user_id = ?\n"
                + "LIMIT 5;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getNext5OrderByUser_ID(int uid, int amount) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders \n"
                + "where user_id = ? \n"
                + "order by order_id \n"
                + "LIMIT 5 OFFSET ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            st.setInt(2, amount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getPublicOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders where publicprivate = 'public' and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getPrivateOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders where publicprivate = 'private' and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getSellerBearingOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders where bearingtransactionfees = 'Seller' and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getCustomerBearingOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders where bearingtransactionfees = 'Customer' and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getOrderByStatusAndUser_ID(String status, int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders where status = ? and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public void deleteOrder(String oid) {
        String sql = "DELETE FROM orders WHERE order_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, oid);
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void addNewOrder(String topic, String contactmethod, String publicprivate, int price, String bearingtransactionfees, String description, String hiddencontent, int user_id) {
        // Tính toán giá trị của transactionfees dựa trên giá trị của price (1% của price)
        int transactionfees = (int) Math.round(price * 0.01);

        String sql = "INSERT INTO orders (status, customer, topic, contactmethod, publicprivate, price, bearingtransactionfees, transactionfees, actualreceived, description, hiddencontent, user_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "Available");
            st.setString(2, "Not yet");
            st.setString(3, topic);
            st.setString(4, contactmethod);
            st.setString(5, publicprivate);
            st.setInt(6, price);
            st.setString(7, bearingtransactionfees);
            st.setInt(8, transactionfees); // Sử dụng giá trị tính toán
            st.setInt(9, 0);
            st.setString(10, description);
            st.setString(11, hiddencontent);
            st.setInt(12, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Order> searchByCustomerNameWithUser_ID(String txtSearch, int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders where customer like ? and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> searchByTitleWithUser_ID(String txtSearchT, int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders where topic like ? and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "%" + txtSearchT + "%");
            st.setInt(2, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    // code theo giá order
    public List<Order> get0To250kOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE price BETWEEN 0 AND 250000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> get250kTo500kOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE price BETWEEN 250001 AND 500000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> get500kTo1mOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE price BETWEEN 500001 AND 1000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> get1mTo5mOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE price BETWEEN 1000001 AND 5000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getOver5mOrderByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE price > 5000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    // end code theo giá order
    // code theo tiền thực nhận order
    public List<Order> get0To250kReceivedByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE actualreceived\\ BETWEEN 0 AND 250000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> get250kTo500kReceivedByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE actualreceived BETWEEN 250001 AND 500000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> get500kTo1mReceivedByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE actualreceived BETWEEN 500001 AND 1000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> get1mTo5mReceivedByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE actualreceived BETWEEN 1000001 AND 5000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Order> getOver5mReceivedByUser_ID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM orders\n"
                + "WHERE actualreceived > 5000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("order_id"),
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
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    // end code theo tiền thực nhận order
    public void updateOrder(String topic, String contactmethod, String publicprivate, int price, String bearingtransactionfees, int transactionfees, String description, String hiddencontent, int id) {
        String sql = "UPDATE orders\n"
                + "SET \n"
                + "    topic = ?,\n"
                + "    contactmethod = ?,\n"
                + "    publicprivate = ?,\n"
                + "    price = ?,\n"
                + "    bearingtransactionfees = ?,\n"
                + "    transactionfees = ?,\n"
                + "    description = ?,\n"
                + "    hiddencontent = ?\n"
                + "    updated_at = CURRENT_TIMESTAMP\n"
                + "WHERE\n"
                + "    order_id = ?;";
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
            st.setInt(9, id);
            st.executeUpdate();
        } catch (SQLException e) {
            // Handle exceptions appropriately, e.g., log them
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<Order> list = dao.getOver5mOrderByUser_ID(6);
        for (Order order : list) {
            System.out.println(order);
        }
    }

    public void updateOrder(String oid, String topic, String contactmethod, String publicprivate, int price, String bearingtransactionfees, int transactionfees, String description, String hiddencontent) {
        // Tính toán lại giá trị của transactionfees dựa trên giá trị mới của price (1% của price)
        int newTransactionFees = (int) Math.round(price * 0.01);

        String sql = "UPDATE orders\n"
                + "SET \n"
                + "    topic = ?,\n"
                + "    contactmethod = ?,\n"
                + "    publicprivate = ?,\n"
                + "    price = ?,\n"
                + "    bearingtransactionfees = ?,\n"
                + "    transactionfees = ?,\n"
                + "    description = ?,\n"
                + "    hiddencontent = ?\n"
                + "WHERE\n"
                + "    order_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, topic);
            st.setString(2, contactmethod);
            st.setString(3, publicprivate);
            st.setInt(4, price);
            st.setString(5, bearingtransactionfees);
            st.setInt(6, newTransactionFees); // Sử dụng giá trị mới của transactionfees
            st.setString(7, description);
            st.setString(8, hiddencontent);
            st.setString(9, oid);
            st.executeUpdate();
        } catch (SQLException e) {
            // Handle exceptions appropriately, e.g., log them
            e.printStackTrace();
        }
    }

}
