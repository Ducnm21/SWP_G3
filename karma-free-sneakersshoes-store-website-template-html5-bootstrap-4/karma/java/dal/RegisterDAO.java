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

/**
 *
 * @author nguyen ngoc quang
 */
public class RegisterDAO extends DBContext{
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

    public void AddUser(String username, String password, String email, String mobile, String fullname) {
        String sql = "INSERT INTO users (username,password,email,mobile,fullname)\n"
                + "VALUES (?,?,?,?,?) ";
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

    public void AddRole() {
        String sql = "INSERT INTO role (user_id, is_admin, is_seller, is_user)\n"
                + "VALUES (?, 0, 0, 1);";
        RegisterDAO rd= new RegisterDAO();
        try {
            int user_id=rd.getUserID();
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
}
