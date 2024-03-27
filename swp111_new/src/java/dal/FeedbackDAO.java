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
import model.Feedback;

/**
 *
 * @author VIVO-S15
 */
public class FeedbackDAO extends DBContext {

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM feedback;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback(
                        rs.getInt("feedback_id"),
                        rs.getString("content"),
                        rs.getInt("sender_user_id"),
                        rs.getInt("receiver_user_id"),
                        rs.getString("sender_username"));
                list.add(fb);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getFeedbackByUser_ID(int uid) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT f.*, u.username AS sender_username\n"
                + "FROM feedback f\n"
                + "JOIN users u ON f.sender_user_id = u.user_id\n"
                + "WHERE f.receiver_user_id = ?\n"
                + "ORDER BY f.feedback_id DESC;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getInt("feedback_id"),
                        rs.getString("content"),
                        rs.getInt("sender_user_id"),
                        rs.getInt("receiver_user_id"),
                        rs.getString("sender_username")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void sendFeedback(String content, int senderid, int receiverid) {
        String sql = "INSERT INTO feedback(content, sender_user_id, receiver_user_id)\n"
                + "values (?, ?, ?);";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, content);
            st.setInt(2, senderid);
            st.setInt(3, receiverid);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List<Feedback> list = dao.getFeedbackByUser_ID(4);
        for (Feedback fb : list) {
            System.out.println(fb);
        }
    }
}
