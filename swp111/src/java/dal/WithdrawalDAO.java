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
import java.util.ArrayList;
import java.util.List;

import model.Wallet;
import model.Withdrawal;

/**
 *
 * @author Admin
 */
public class WithdrawalDAO {

  
    public Withdrawal GetWithdrawalByID(int id) {
        String sql = "SELECT * FROM withdrawal where id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Withdrawal w = new Withdrawal();
                w.setWithdrawal_id(rs.getInt(1));
                w.setId(rs.getInt(2));
                w.setAmount(rs.getInt(3));
                w.setCreate_datetime(rs.getString(4));
                w.setStatus(rs.getString(5));
                w.setBank_user(rs.getString(6));
                w.setBank_number(rs.getString(7));
                w.setBank_name(rs.getString(8));
                w.setUpdate_datetime(rs.getString(9));
                return w;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void UpdateWithdrawalByID(Withdrawal w) {
        String sql = "update withdrawal\n"
                + "set amount = ?, bank_user = ?, bank_number = ?, bank_name = ?, update_datetime = ? where id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setDouble(1, w.getAmount());
            st.setString(2, w.getBank_user());
            st.setString(3, w.getBank_number());
            st.setString(4, w.getBank_name());
            st.setString(5, w.getUpdate_datetime());
            st.setInt(6, w.getWithdrawal_id());
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void UpdateWithdrawalByID2(Withdrawal w) {
        String sql = "update withdrawal\n"
                + "set status = ?, update_datetime = ? where id = ?";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, w.getStatus());
            st.setString(2, w.getUpdate_datetime());
            st.setInt(3, w.getWithdrawal_id());
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Withdrawal> GetAllWithdrawal() {
        List<Withdrawal> list = new ArrayList<>();
        String sql = "select * from withdrawal order by id desc";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Withdrawal(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));
                        
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Withdrawal> GetAllWithdrawalByWalletID(int id) {
        List<Withdrawal> list = new ArrayList<>();
        String sql = "select * from withdrawal where wallet_id = ? order by id DESC";
        try {
          PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Withdrawal(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void InsertWithdrawal(Withdrawal w) {
      
        String sql = "INSERT INTO withdrawal (`wallet_id`, `amount`, `status`, `bank_user`, `bank_number`, `bank_name` ) VALUES (?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, w.getId());
            st.setDouble(2, w.getAmount());
            st.setString(3, w.getStatus());
            st.setString(4, w.getBank_user());
            st.setString(5, w.getBank_number());
            st.setString(6, w.getBank_name());

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Withdrawal> GetAllWithdrawalByStatus(String status) {
        List<Withdrawal> list = new ArrayList<>();
        String sql = "select * from withdrawal where status = ? order by id desc";
        try {
            PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setString(1, status);
           ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Withdrawal(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Withdrawal> GetAllWithdrawalByStatusAndWalletID(int wallet_id, String status) {
        List<Withdrawal> list = new ArrayList<>();
        String sql = "select * from withdrawal where wallet_id = ? and status = ? order by id desc";
        try {
             PreparedStatement st = getConnection(DB_URL, USER_NAME, PASSWORD).prepareStatement(sql);
            st.setInt(1, wallet_id);
            st.setString(2, status);
           ResultSet rs = st.executeQuery();
            while (rs.next()) {
               list.add(new Withdrawal(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
      WithdrawalDAO wa = new WithdrawalDAO();
      Withdrawal ww = wa.GetWithdrawalByID(39);

            System.out.println(ww);
    }

}
