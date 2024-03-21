package dal;

import static dal.DBContext.DB_URL;
import static dal.DBContext.PASSWORD;
import static dal.DBContext.USER_NAME;
import static dal.DBContext.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Wallet;

public class WalletDAO {

    public List<Wallet> getAllWallet() {
        List<Wallet> list = new ArrayList<>();
        String sql = "SELECT * FROM wallet";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Wallet w = new Wallet(
                        rs.getInt("wallet_id"),
                        rs.getInt("balance"),
                        rs.getInt("user_id"));
                list.add(w);
            }
        } catch (Exception e) {

        }
        return list;
    }
    
    public Wallet GetWalletAdmin(){
        String sql = "SELECT * FROM wallet where user_id = 5";      
        try ( Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = con.prepareStatement(sql)) {
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Wallet w = new Wallet();
                    w.setId(rs.getInt(1));
                    w.setBalance(rs.getDouble(2));
                    w.setUser_id(rs.getInt(3));
                    return w;
                }
            }
        } catch (Exception e) {
            
        }
        return null;
    }

    public List<Wallet> getWalletByUser_ID(int uid) {
        List<Wallet> list = new ArrayList<>();
        String sql = "SELECT * FROM wallet WHERE user_id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Wallet(rs.getInt("wallet_id"),
                        rs.getInt("balance"),
                        rs.getInt("user_id")));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public Wallet getWalletByID(int id) {
        String sql = "SELECT * FROM wallet WHERE user_id = ?";
        try ( Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Wallet w = new Wallet();
                    w.setId(rs.getInt(1));
                    w.setBalance(rs.getDouble(2));
                    w.setUser_id(rs.getInt(3));

                    return w;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Wallet getWalletByID3(int id, double amount) {
        String sql = "SELECT * FROM wallet WHERE user_id = ?";
        try ( Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Wallet w = new Wallet();
                    w.setId(rs.getInt(1));
                    w.setBalance(rs.getDouble(2));
                    w.setUser_id(rs.getInt(3));
                    return w;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    


    public Wallet getWalletByUserID(int id) {
        String sql = "SELECT * FROM swpproject.wallet WHERE user_id = ?";
        try ( Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Wallet w = new Wallet();
                    w.setId(rs.getInt(1));
                    w.setBalance(rs.getDouble(2));
                    w.setUser_id(rs.getInt(3));
                    return w;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateWalletByID(Wallet w) {
        String sql = "UPDATE wallet SET balance = ? WHERE id = ?";
        try ( Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = con.prepareStatement(sql)) {
            st.setDouble(1, w.getBalance());
            st.setInt(2, w.getId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        WalletDAO w = new WalletDAO();
        Wallet h = w.GetWalletAdmin();
        System.out.println(h.getBalance());
    }
}
