package dal;

import static dal.DBContext.DB_URL;
import static dal.DBContext.PASSWORD;
import static dal.DBContext.USER_NAME;
import static dal.DBContext.getConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO extends DBContext {

    public void updatepassword(String password, Integer uid) {
        String sql = "UPDATE `scamlamchodemo`.`users`\n"
                + "SET\n"
                + "`password` = ?\n"
                + "WHERE `user_id` = ?";
        System.out.println(1);
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, encode(password));
            st.setInt(2, uid);
            st.executeUpdate();
            System.out.println(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

<<<<<<< HEAD
    public User update(User user) {
        String sql = "UPDATE `scamlamcho`.`users`\n"
=======
    public void update(String username, String email, String mobile, String fullname, int uid) {
        String sql = "UPDATE `scamlamchodemo`.`users`\n"
>>>>>>> 176877d0db5d786b81da53d5e7bc19144dac6a70
                + "SET\n"
                + "`username` = ?,\n"
                + "`email` = ?,\n"
                + "`mobile` = ?,\n"
                + "`fullname` = ?\n"
                + "WHERE `user_id` = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
<<<<<<< HEAD
            st.setString(1, user.getUsername());
            st.setString(2, user.getEmail());
            st.setString(3, user.getMobile());
            st.setString(4, user.getFullname());
            st.setInt(5, user.getId());
            st.executeUpdate();
            return user;
        } catch (SQLException e) {
            System.out.println(e);
            return null; // Hoặc xử lý lỗi theo ý của bạn
=======
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, mobile);
            st.setString(4, fullname);
            st.setInt(5, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
>>>>>>> 176877d0db5d786b81da53d5e7bc19144dac6a70
        }
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

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getString("fullname"),
                        rs.getString("created_at"),
                        rs.getString("deleted_by"),
                        rs.getString("updated_by"),
                        rs.getInt("is_admin"),
                        rs.getString("banned"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserByID(int uid) {
        String sql = "Select * from users where user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getString("fullname"),
                        rs.getString("created_at"),
                        rs.getString("deleted_by"),
                        rs.getString("updated_by"),
                        rs.getInt("is_admin"),
                        rs.getString("banned"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
<<<<<<< HEAD

    public List<User> getUserProfile(int uid) {
=======
    public List<User> getUserProfile(int uid){
>>>>>>> 176877d0db5d786b81da53d5e7bc19144dac6a70
        List<User> list = new ArrayList<>();
        String sql = "Select * from users where user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getString("fullname"),
                        rs.getString("created_at"),
                        rs.getString("deleted_by"),
                        rs.getString("updated_by"),
                        rs.getInt("is_admin"),
                        rs.getString("banned"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
<<<<<<< HEAD

=======
    
>>>>>>> 176877d0db5d786b81da53d5e7bc19144dac6a70
    public User login(String username, String password) {
        String sql = "select * from users\n"
                + "where username = ?\n"
                + "and password = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStatus(String status, User user) {
        String sql = "UPDATE users\n"
                + "SET banned = ?\n"
                + "WHERE user_id =?;";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, user.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            // Handle exceptions appropriately, e.g., log them
            e.printStackTrace();
        }
    }

    public User checkUserExist(String username) {
        String sql = "select * from users\n"
                + "where username = ?\n";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

<<<<<<< HEAD
    public boolean isUsernameTaken(String username, int userId) {
        String sql = "SELECT COUNT(*) AS count FROM users WHERE username = ? AND user_id != ?";
        try {
            PreparedStatement statement = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            statement.setString(1, username);
            statement.setInt(2, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isPhoneTaken(String phone, int userId) {
        String sql = "SELECT COUNT(*) AS count FROM users WHERE mobile = ? AND user_id != ?";
        try {
            PreparedStatement statement = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            statement.setString(1, phone);
            statement.setInt(2, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<User> list = dao.getUserProfile(4);
        for (User u : list) {
=======
//    public void Register(String email, String username, String password, String phone, String address, int role) {
//        String sql = "INSERT INTO [dbo].[user]\n"
//                + "           ([gmail]\n"
//                + "           ,[username]\n"
//                + "           ,[password]\n"
//                + "           ,[phone]\n"
//                + "           ,[address]\n"
//                + "           ,[role])\n"
//                + "     VALUES\n"
//                + "           (?,?,?,?,?,?)";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, email);
//            ps.setString(2, username);
//            ps.setString(3, password);
//            ps.setString(4, phone);
//            ps.setString(5, address);
//            ps.setInt(6, role);
//            ps.executeUpdate();
//        } catch (SQLException e) {
//        }
//    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<User> list = dao.getUserProfile(4);
        for(User u : list){
>>>>>>> 176877d0db5d786b81da53d5e7bc19144dac6a70
            System.out.println(u);
        }
    }
}
