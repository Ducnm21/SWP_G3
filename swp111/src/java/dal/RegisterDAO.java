/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.DB_URL;
import static dal.DBContext.PASSWORD;
import static dal.DBContext.USER_NAME;
import static dal.DBContext.getConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author nguyen ngoc quang
 */
public class RegisterDAO extends DBContext {

    public boolean checkRegister(String username) {
        String sql = "select * from users where username=?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("UserName").equalsIgnoreCase(username)) {
                    return false;
                }
            }
        } catch (SQLException e) {
        }
        return true;
    }

    public boolean checkEmail(String email) {
        String sql = "select * from users where email=?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("email").equalsIgnoreCase(email)) {
                    return false;
                }
            }
        } catch (SQLException e) {
        }
        return true;
    }

    public String encode(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] digest = md.digest();

            // Convert byte array to hexadecimal string
            StringBuilder hexString = new StringBuilder();
            for (byte b : digest) {
                hexString.append(String.format("%02x", b));
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void AddUser(String username, String password, String email, String mobile, String fullname) {
        String sql = "INSERT INTO users (username, password, email, mobile, fullname, is_admin, banned)\n"
                + "VALUES (?, ?, ?, ?, ?,  0, 'active');";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);

            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, mobile);
            st.setString(5, fullname);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void AddWalletNewUser() {
        String sql = "INSERT INTO wallet (user_id, balance)\n"
                + "SELECT user_id, 0.0 \n"
                + "FROM users;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    

    public void AddRole() {
        String sql = "INSERT INTO role (user_id, is_admin, is_seller, is_user)\n"
                + "VALUES (?, 0, 0, 1);";
        RegisterDAO rd = new RegisterDAO();
        try {
            int user_id = rd.getUserID();
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, user_id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getUserID() {
        int user_id = 0;
        String sql = "SELECT user_id \n"
                + "FROM users \n"
                + "ORDER BY user_id DESC\n"
                + "LIMIT 1";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                user_id = rs.getInt("user_id");

            }
        } catch (SQLException e) {
        }
        return user_id;

    }

    public String getNoiDung(User acc, String otp) {
        String noiDung = "<p>SCLC xin chào bạn <strong>" + "</strong></p>\n"
                + "<p>Vui lòng xác thực tài khoản của bạn bằng cách nhập mã: <strong>" + otp + ".</strong></p>\n"
                + "<p>Xin vui lòng không chia sẻ mã này cho người khác.</p>\n"
                + "<p>​Đây là email trả lời tự động, vui lòng không phản hồi email này.</p>\n"
                + "<p>Trân trọng cảm ơn</p>";
        return noiDung;
    }
}
