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
import model.Withdrawal;

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
                        rs.getInt("user_id"),
                        rs.getDouble("balance"));
                list.add(w);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public Wallet GetWalletAdmin() {
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
                list.add(new Wallet(
                        rs.getInt("wallet_id"),
                        rs.getInt("user_id"),
                        rs.getDouble("balance")));
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
                    w.setBalance(amount);
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
     public Wallet GetWalletByWithdrawal(Withdrawal withdrawal) {
        String sql = "SELECT * FROM wallet where wallet_id = ?";
        try {
           PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, withdrawal.getId());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Wallet w = new Wallet();
                w.setId(rs.getInt(1));
                w.setUser_id(rs.getInt(3));
                w.setBalance(rs.getDouble(2));
                return w;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    
    public void updateWalletAfterAdd(Wallet w, double balance) {
        String sql = "UPDATE wallet SET balance = ? WHERE wallet_id = ?";
        try ( Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = con.prepareStatement(sql)) {
            st.setDouble(1, balance);
            st.setInt(2, w.getId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateWalletByID(double balance, int uid) {
        String sql = "UPDATE wallet SET balance = ? WHERE wallet_id = ?";
        try ( Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = con.prepareStatement(sql)) {
            st.setDouble(1, balance);
            st.setInt(2, uid);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateAmount(double balance, int uid) {
        String sql = "UPDATE Wallet SET balance = ? WHERE user_id =?";
        
        try {
            Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);  PreparedStatement st = con.prepareStatement(sql);
            st.setDouble(1, balance);
            st.setInt(2, uid);   
            st.executeUpdate();
        } catch (Exception e) {
           e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        WalletDAO wd = new WalletDAO();
        WithdrawalDAO w1 = new WithdrawalDAO();
        Withdrawal w2 = w1.GetWithdrawalByID(25);
        Wallet w3 =wd.GetWalletByWithdrawal(w2);
        System.out.println(w3.getBalance());
    }
}
