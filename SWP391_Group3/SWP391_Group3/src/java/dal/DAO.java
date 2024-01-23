/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Context.DBContext;
import Entity.User;
import Entity.userGoogle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.*;
import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class DAO extends DBContext {

    public Connection con = null; //connect to sql
    public PreparedStatement ps = null; //ném câu lệnh query sang sql
    public ResultSet rs = null; //nhận kết quả trả về

    // Bach + Sign up
    public void signup(String user, String pass, String email) {
        String query = "INSERT users (username, password, email, display_Name, is_admin, is_verify, is_active) VALUES (?, ?, ?, ?, 0, 0, 1)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setString(4, user);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void signupGoogle(String id, String name, String email) {
        String query = "INSERT userGoogle (id, name, email, is_active) VALUES (?, ?, ?, 1)";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void setVerifyTrue(String email) {
        String query = "Update swp_demo.users set is_verify = 1 WHERE email = ?; ";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String query = "select * from swp_demo.users";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public User getUser(String username) {

        String query = "select * from swp_demo.users where username = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public userGoogle getUserGoogle(String email) {

        String query = "select * from swp_demo.usergoogle where email = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new userGoogle(
                        rs.getString(1),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getString(2),
                        rs.getTimestamp(5),
                        rs.getTimestamp(6));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<userGoogle> getAllUserGoogle() {
        List<userGoogle> list = new ArrayList<>();
        String query = "select * from swp_demo.usergoogle";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new userGoogle(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getBoolean(3),
                        rs.getString(4),
                        rs.getTimestamp(5),
                        rs.getTimestamp(6)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public User getEmail(String email) {
        String query = "select * from swp_demo.users where email = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public String getUsername(String username) {
        String query = "select * from swp_demo.users where username = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(2);
            }
        } catch (Exception e) {

        }
        return null;
    }

    //HUY
    public User Login(String username, String pass) {

        String query = "select * from swp_demo.users where username = ? and password = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
            }
        } catch (Exception e) {

        }
        return null;
    }

    //BINH
    public boolean isEmailExists(String email) {
        boolean emailExists = false;

        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        try {
            con = new DBContext().connection; //connect sql
            ps = con.prepareStatement(sql);
            ps.setString(1, email);

            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                emailExists = count > 0;
            }

        } catch (Exception e) {

        }

        return emailExists;
    }

    public User isEmail(String email) {
        String sql = "select * from users where email = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getBoolean(8),
                        rs.getTimestamp(9),
                        rs.getTimestamp(10));
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public User updatePassword(String pass, int id) {
        String sql = "Update users set password=? where id =? ";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;

    }

    //HUE
    public void updateProfile(String email, String displayName, int id) {
        String sql = "UPDATE users SET display_name=?, email=? WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, displayName);
            // st.setString(2, password);
            st.setString(2, email);
            st.setInt(3, id);
            st.executeUpdate();
            // Execute the update query         
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePassword(String password, String username) {
        String sql = "UPDATE users SET password=? WHERE username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);

            st.executeUpdate();

            // Execute the update query         
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUser(String username, String password) {
        String sql = "Select * from users where username = ? and password=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                return u;
            }
            // Execute the update query         
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean isEmailAlreadyExists(String email, int id) {

        String sql = "Select * from users where email = ? AND id != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    //CHIEN
    public static void main(String[] args) {
        DAO dao = new DAO();
        //dao.signup("bach", "1234", "bach@gmil.com");
        System.out.println(dao.getUserGoogle("bachnvse@gmail.com").toString());
        User u = dao.getEmail("bachnvse@gmail.com");
        
    }
}
