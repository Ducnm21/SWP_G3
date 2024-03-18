/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class CartXProduct {

    private int cart_id;
    private int product_id;
    private String status;
    private String topic;
    private String customer;
    private String contactmethod;
    private double price;
    private String bearingtransactionfees;
    private int transactionfees;

    public CartXProduct() {
    }

    public CartXProduct(int cart_id, int product_id, String status) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.status = status;
    }

    public CartXProduct(int cart_id, int product_id, String status, double price, int transactionfees) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.status = status;
        this.price = price;
        this.transactionfees = transactionfees;
    }

    public CartXProduct(int cart_id, int product_id, String status, String topic, String customer, String contactmethod, double price, String bearingtransactionfees, int transactionfees) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.status = status;
        this.topic = topic;
        this.customer = customer;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getContactmethod() {
        return contactmethod;
    }

    public void setContactmethod(String contactmethod) {
        this.contactmethod = contactmethod;
    }

    public String getBearingtransactionfees() {
        return bearingtransactionfees;
    }

    public void setBearingtransactionfees(String bearingtransactionfees) {
        this.bearingtransactionfees = bearingtransactionfees;
    }
    
    
    public int getTransactionfees() {
        return transactionfees;
    }

    public void setTransactionfees(int transactionfees) {
        this.transactionfees = transactionfees;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "CartXProduct{" + "cart_id=" + cart_id + ", product_id=" + product_id + ", status=" + status + ", topic=" + topic + ", customer=" + customer + ", contactmethod=" + contactmethod + ", price=" + price + ", bearingtransactionfees=" + bearingtransactionfees + ", transactionfees=" + transactionfees + '}';
    }

    

}
