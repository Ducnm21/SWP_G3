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

    public News getNewsByUserID(int user_id) {
        String sql = "select * from news where user_id = ? order by product_id desc limit 1";
        try ( PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql)) {
            st.setInt(1, user_id);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new News(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getInt(3),
                            rs.getInt(4),
                            rs.getInt(5)
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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
        String sql = "SELECT * FROM news WHERE user_id = ? ORDER BY product_id DESC LIMIT ?, ?";
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
        List<News> newsList = new ArrayList<>();
        newsList = dao.getNewsListByUserID(4);
        for (News news : newsList) {
            System.out.println(news);
        }
    }
}
