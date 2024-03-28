package dal;

import static dal.DBContext.DB_URL;
import static dal.DBContext.PASSWORD;
import static dal.DBContext.USER_NAME;
import static dal.DBContext.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Wallet;

public class DepositDAO {

    public void changeAmount(String balance, Wallet wallet) {
        String sql = "UPDATE wallet SET balance = ? WHERE wallet_id = ?";
        try (Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, balance);
            st.setInt(2, wallet.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStatus(Wallet wallet, String status) {
        String sql = "UPDATE vnpay_transaction SET status = ? WHERE Wallet_id = ?";
        try (Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, status);
            st.setInt(2, wallet.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void setAmount(Wallet wallet, double amount) {
        String sql = "UPDATE wallet SET balance = ? WHERE wallet_id = ?";
        try (Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setDouble(1, amount);
            st.setInt(2, wallet.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public double getBalanceByDeposit(int id) {
        String sql = "SELECT * FROM wallet WHERE wallet_id = ?";
        try (Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
           while (rs.next()){
               Wallet wid = new Wallet();
               wid.setId(rs.getInt(1));
               wid.setBalance(rs.getDouble(2));
               wid.setUser_id(rs.getInt(3));
               
               return wid.getBalance();
           }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Wallet getWalletByID(Wallet wallet) {
        String sql = "SELECT * FROM swpproject.wallet WHERE id = ?";
        try (Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, wallet.getUser_id());
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Wallet w = new Wallet();
                    w.setId(rs.getInt("id"));
                    w.setBalance(rs.getDouble("balance"));
                    w.setUser_id(rs.getInt("user_id"));         
                    return w;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertStatus(String status, int Wallet_id){
            String sql = "insert into vnpay_transaction(status,wallet_id) values (                                                                                                                                                                                                                                                                                        ,?)";
            try (Connection con = getConnection(DB_URL, USER_NAME, PASSWORD);
                  PreparedStatement st = con.prepareStatement(sql))  {
                st.setString(1, status);
                st.setInt(2, Wallet_id);
                st.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    
    public static void main(String[] args) {
        DepositDAO dao = new DepositDAO();
        double j = dao.getBalanceByDeposit(1);
        System.out.println(j);
    }
}
