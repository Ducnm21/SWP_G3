/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.stream.DoubleStream;
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

    public void AddUser(String username, String password, String email, int mobile,String fullname) {
        String sql = "INSERT INTO users (username,password,email,mobile,fullname)\n"
                + "VALUES (?,?,?,?,?) ";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setInt(4, mobile);
            st.setString(5, fullname);
            st.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void AddRole(int user_id) {
        String sql = "INSERT INTO role (is_admin,is_seller,is_customer)\n"
                + "VALUES (0,0,1) \n"
                + "WHERE user_id=?";

        try {

            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);     
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
        } catch (SQLException e) {
        }
    }
    public static void main(String[] args) {
        RegisterDAO r = new RegisterDAO();
        r.AddUser("quangnn03", "1234", "quangnnhe@gmail.com",32133123, "Ngoc Quang");
        
    }
}
