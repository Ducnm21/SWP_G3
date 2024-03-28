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
        String sql = "SELECT p.*, u.username AS sellerName FROM products p INNER JOIN users u ON p.user_id = u.user_id WHERE p.status = 'Available' and p.publicprivate = 'public';";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
                        rs.getString("description"),
                        rs.getString("hiddencontent"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        rs.getInt("user_id"),
                        rs.getString("sellerName"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateIsConfirm(int pid) {
        String sql = "UPDATE products\n"
                + "SET isConfirm=1\n"
                + "WHERE product_id = ? ";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, pid);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
                        rs.getString("description"),
                        rs.getString("hiddencontent"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        rs.getInt("user_id"),
                        rs.getString("sellerName"),
                        rs.getInt("isConfirm"));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Product> getProductByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> getProductByUser_IDToProfile(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products where status = 'Available' and user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public void addNewProduct(String topic, String contactmethod, String publicprivate, double price, String bearingtransactionfees, String description, String hiddencontent, int user_id) {
        // Tính toán giá trị của transactionfees dựa trên giá trị của price (1% của price)
        double transactionfees = Math.round(price * 0.01);
        double received = 0;
        if (bearingtransactionfees.equals("seller")) {
            received = price - transactionfees;
        } else if (bearingtransactionfees.equals("buyer")) {
            received = price;
        }
        String sql = "INSERT INTO products (status, topic, contactmethod, publicprivate, price, bearingtransactionfees, transactionfees, actualreceived, description, hiddencontent, user_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "Available");
            st.setString(2, topic);
            st.setString(3, contactmethod);
            st.setString(4, publicprivate);
            st.setDouble(5, price);
            st.setString(6, bearingtransactionfees);
            st.setDouble(7, transactionfees); // Sử dụng giá trị tính toán
            st.setDouble(8, received);
            st.setString(9, description);
            st.setString(10, hiddencontent);
            st.setInt(11, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(int pid, String topic, String contactmethod, String publicprivate, double price,
            String bearingtransactionfees, double transactionfees, String description, String hiddencontent, String updated_at) {
        // Tính toán lại giá trị của transactionfees dựa trên giá trị mới của price (1% của price)
        double newTransactionFees = Math.round(price * 0.01);

        String sql = "UPDATE products\n"
                + "SET \n"
                + "    topic = ?,\n"
                + "    contactmethod = ?,\n"
                + "    publicprivate = ?,\n"
                + "    price = ?,\n"
                + "    bearingtransactionfees = ?,\n"
                + "    transactionfees = ?,\n"
                + "    description = ?,\n"
                + "    hiddencontent = ?,\n"
                + "    updated_at = ?\n"
                + "WHERE\n"
                + "    product_id = ?;";

        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, topic);
            st.setString(2, contactmethod);
            st.setString(3, publicprivate);
            st.setDouble(4, price);
            st.setString(5, bearingtransactionfees);
            st.setDouble(6, newTransactionFees); // Sử dụng giá trị mới của transactionfees
            st.setString(7, description);
            st.setString(8, hiddencontent);
            st.setString(9, updated_at);
            st.setInt(10, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            // Handle exceptions appropriately, e.g., log them
            e.printStackTrace();
        }
    }

    public void deleteProduct(int pid) {
        String sql = "DELETE FROM products WHERE product_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, pid);
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public List<Product> getProductByStatusAndUser_ID(String status, int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products where status = ? and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> get0To250kProductByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE price BETWEEN 0 AND 250000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> get250kTo500kProductByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE price BETWEEN 250001 AND 500000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> get500kTo1mProductByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE price BETWEEN 500001 AND 1000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> get1mTo5mProductByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE price BETWEEN 1000001 AND 5000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> getOver5mProductByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE price > 5000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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
    public List<Product> get0To250kReceivedByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE actualreceived\\ BETWEEN 0 AND 250000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> get250kTo500kReceivedByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE actualreceived BETWEEN 250001 AND 500000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> get500kTo1mReceivedByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE actualreceived BETWEEN 500001 AND 1000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> get1mTo5mReceivedByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE actualreceived BETWEEN 1000001 AND 5000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> getOver5mReceivedByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM products\n"
                + "WHERE actualreceived > 5000000\n"
                + "AND user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> searchByCustomerNameWithUser_ID(String txtSearch, int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products where customer_name like ? and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> searchByTitleWithUser_ID(String txtSearchT, int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products where topic like ? and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "%" + txtSearchT + "%");
            st.setInt(2, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> searchByContactWithUser_ID(String txtSearchC, int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products where contactmethod like ? and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "%" + txtSearchC + "%");
            st.setInt(2, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> getPublicOrderByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products where publicprivate = 'public' and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> getPrivateOrderByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products where publicprivate = 'private' and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> getSellerBearingOrderByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products where bearingtransactionfees = 'seller' and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> getCustomerBearingOrderByUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products where bearingtransactionfees = 'buyer' and user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
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

    public List<Product> getProductByDate() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products\n"
                + "WHERE created_at >= ? AND created_at <= ? AND user_id = ?;";
        try {

        } catch (Exception e) {

        }
        return list;
    }

    public List<Product> getProductWithCustomerNameAndUser_ID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    users.username AS 'CustomerName', \n"
                + "    products.*\n"
                + "FROM \n"
                + "    cart\n"
                + "JOIN \n"
                + "    products ON cart.product_id = products.product_id\n"
                + "JOIN \n"
                + "    users ON users.user_id = cart.user_id\n"
                + "WHERE \n"
                + "    products.user_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("status"),
                        rs.getString("topic"),
                        rs.getString("contactmethod"),
                        rs.getString("publicprivate"),
                        rs.getDouble("price"),
                        rs.getString("bearingtransactionfees"),
                        rs.getDouble("transactionfees"),
                        rs.getDouble("actualreceived"),
                        rs.getString("description"),
                        rs.getString("hiddencontent"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        rs.getInt("user_id"),
                        rs.getString("CustomerName")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getProductWithCustomerNameAndUser_ID(1);
        for (Product p : list) {
            System.out.println(p);
        }
    }
}
