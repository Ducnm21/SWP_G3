/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguyen ngoc quang
 */
public class Wallet {
    private int id;
    private int user_id;
    private double balance;

    public Wallet() {
    }
    
    public Wallet(int id) {
        this.id = id;
    }

    public Wallet(int id, double balance) {
        this.id = id;
        this.balance = balance;
    }

    public Wallet(int id, int user_id, double balance) {
        this.id = id;
        this.user_id = user_id;
        this.balance = balance;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Wallet{" + "id=" + id + ", user_id=" + user_id + ", balance=" + balance + '}';
    }

    

    
    
    
}
