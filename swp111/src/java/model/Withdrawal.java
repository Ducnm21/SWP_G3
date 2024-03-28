/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.logging.Logger;



/**
 *
 * @author Admin
 */
public class Withdrawal extends Wallet{
    private int withdrawal_id;
    private double amount;
    private String create_datetime;
    private String status;
    private String bank_user;
    private String bank_number;
    private String bank_name;
    private String update_datetime;

    public Withdrawal() {
    }



    public Withdrawal(int withdrawal_id,  int id, double amount, String create_datetime, String status, String bank_user, String bank_number, String bank_name, String update_datetime) {
        super(id);
        this.withdrawal_id = withdrawal_id;
        this.amount = amount;
        this.create_datetime = create_datetime;
        this.status = status;
        this.bank_user = bank_user;
        this.bank_number = bank_number;
        this.bank_name = bank_name;
        this.update_datetime = update_datetime;
    }

    

   

    public Withdrawal(double amount, String status, String bank_user, String bank_number, String bank_name, int id) {
        super(id);
        this.amount = amount;
        this.status = status;
        this.bank_user = bank_user;
        this.bank_number = bank_number;
        this.bank_name = bank_name;
    }

    public String getBank_number() {
        return bank_number;
    }

    public void setBank_number(String bank_number) {
        this.bank_number = bank_number;
    }

    public int getWithdrawal_id() {
        return withdrawal_id;
    }

    public void setWithdrawal_id(int withdrawal_id) {
        this.withdrawal_id = withdrawal_id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

 

    public String getCreate_datetime() {
        return create_datetime;
    }

    public void setCreate_datetime(String create_datetime) {
        this.create_datetime = create_datetime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBank_user() {
        return bank_user;
    }

    public void setBank_user(String bank_user) {
        this.bank_user = bank_user;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getUpdate_datetime() {
        return update_datetime;
    }

    public void setUpdate_datetime(String update_datetime) {
        this.update_datetime = update_datetime;
    }

    @Override
    public String toString() {
        return "Withdrawal{" + "withdrawal_id=" + withdrawal_id + ", amount=" + amount + ", create_datetime=" + create_datetime + ", status=" + status + ", bank_user=" + bank_user + ", bank_number=" + bank_number + ", bank_name=" + bank_name + ", update_datetime=" + update_datetime + '}';
    }

 

    

   
    
    
    
    
    
           
    
    
    
    
}
