/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.DB_URL;
import static dal.DBContext.PASSWORD;
import static dal.DBContext.USER_NAME;
import static dal.DBContext.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.News;
import java.util.ArrayList;

public class NewsDAO {

    public News getNewsbyOrderidandUserid(int oid, int uid) {
        String sql = "SELECT * FROM news WHERE product_id = ? AND user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, oid);
            st.setInt(2, uid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new News(
                        rs.getInt("news_id"),
                        rs.getString("content"),
                        rs.getInt("user_id"),
                        rs.getInt("product_id"),
                        rs.getInt("is_seen")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void SetSeen(int id) {
        String sql = "update news\n"
                + "set is_seen =1 \n"
                + "where news_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addNews(int user_id, String content, int is_seen, int product_id) {
        String sql = "INSERT INTO news (content, is_seen, user_id, product_id) VALUES (?, ?, ?, ?)";
        try ( Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, content);
            st.setInt(2, is_seen);
            st.setInt(3, user_id);
            st.setInt(4, product_id);

            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("Insertion failed, no rows affected.");
            } else {
                System.out.println("News inserted successfully.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<News> getNewsListByUserID(int user_id) {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news WHERE user_id = ? ORDER BY product_id DESC";
        try ( Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, user_id);
            try ( ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    News news = new News(
                            rs.getInt("news_id"),
                            rs.getString("content"),
                            rs.getInt("user_id"),
                            rs.getInt("product_id"),
                            rs.getInt("is_seen")
                    );
                    newsList.add(news);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public List<News> getPaginatedNewsListByUserID(int user_id, int page, int recordsPerPage) {
        List<News> newsList = new ArrayList<>();
        int start = (page - 1) * recordsPerPage;
        String sql = "SELECT * FROM news WHERE user_id = ? ORDER BY news_id DESC LIMIT ?, ?";
        try ( Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, user_id);
            st.setInt(2, start);
            st.setInt(3, recordsPerPage);
            try ( ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    News news = new News(
                            rs.getInt("news_id"),
                            rs.getString("content"),
                            rs.getInt("user_id"),
                            rs.getInt("product_id"),
                            rs.getInt("is_seen")
                    );
                    newsList.add(news);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public int getTotalPagesByUserID(int user_id, int recordsPerPage) {
        String sql = "SELECT COUNT(*) AS total FROM news WHERE user_id = ?";
        try ( Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, user_id);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int totalRecords = rs.getInt("total");
                    return (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        NewsDAO dao = new NewsDAO();
        List<News> newsList = dao.getPaginatedNewsListByUserID(5, 1, 3);
        for (News news : newsList) {
            System.out.println(news);
        }
    }
}
