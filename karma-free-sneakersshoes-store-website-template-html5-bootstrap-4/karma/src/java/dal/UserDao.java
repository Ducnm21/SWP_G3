package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;


public class UserDao extends DBContext {

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
                        rs.getString("created_at"), 
                        rs.getString("deleted_by"), 
                        rs.getString("updated_by")); 
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
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
                        rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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
                        rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

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
        UserDao dao = new UserDao();
        List<User> list = dao.getAllUser();
        for (User user : list) {
            System.out.println(user);
        }
        System.out.println(dao.login("john_doe", "password123"));
    }
}
