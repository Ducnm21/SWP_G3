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
import java.util.ArrayList;
import java.util.List;
import model.Conflict;

public class ConflictDAO extends DBContext {

    public List<Conflict> getAllRequestForAdmin() {
        List<Conflict> list = new ArrayList<>();
        String sql = "SELECT conflict.*, users.username AS senderName\n"
                + "FROM conflict\n"
                + "LEFT JOIN users ON conflict.sender_buyer_id = users.user_id\n"
                + "ORDER BY conflict.requets_id DESC;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Conflict c = new Conflict(
                        rs.getInt("requets_id"),
                        rs.getInt("sender_buyer_id"),
                        rs.getString("status"),
                        rs.getString("right_side"),
                        rs.getString("senderName"),
                        rs.getInt("product_id"));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Conflict getConflictByID(int requets_id) {
        String sql = "SELECT conflict.*, users.username AS senderName\n"
                + "FROM conflict\n"
                + "LEFT JOIN users ON conflict.sender_buyer_id = users.user_id where requets_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, requets_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Conflict(
                        rs.getInt("requets_id"),
                        rs.getInt("sender_buyer_id"),
                        rs.getString("status"),
                        rs.getString("right_side"),
                        rs.getString("senderName"),
                        rs.getInt("product_id"));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public Conflict getConflictByPID(int product_id) {
        String sql = "SELECT conflict.*\n"
                + "FROM conflict\n"
                + "where product_id = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Conflict(
                        rs.getInt("requets_id"),
                        rs.getInt("sender_buyer_id"),
                        rs.getString("status"),
                        rs.getString("right_side"),
                        rs.getInt("product_id"));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void sendRequest(int sender_buyer_id, int product_id) {
        String sql = "INSERT INTO conflict(sender_buyer_id, status, right_side, product_id)\n"
                + "values(?,?,?,?);";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, sender_buyer_id);
            st.setString(2, "Pending");
            st.setString(3, "Not yet");
            st.setInt(4, product_id);
            st.executeUpdate();
            System.out.println("Inserted successfully.");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void resolveConflicts(String right_side, int requets_id) {
        String sql = "UPDATE `sclc`.`conflict`\n"
                + "SET\n"
                + "`status` = ?,\n"
                + "`right_side` = ?\n"
                + "WHERE `requets_id` = ?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, "Checked");
            st.setString(2, right_side);
            st.setInt(3, requets_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateConflicts(int requets_id) {
        String sql = "UPDATE `sclc`.`conflict`\n"
                + "SET\n"
                + "`status` = 'Done'\n"
                + "WHERE `requets_id` = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);            
            st.setInt(1, requets_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        ConflictDAO d=new ConflictDAO();
        List<Conflict> c = d.getAllRequestForAdmin();
        for (Conflict conflict : c) {
            System.out.println(conflict);
        }
        
    }
}
