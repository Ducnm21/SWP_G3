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
    private String username;
    private String status;
    private String topic;
    private String contactmethod;
    private double price;
    private String bearingtransactionfees;
    private int transactionfees;
    private int seller_id;
    private String create_at;
    private double actualreceived;

    public double getActualreceived() {
        return actualreceived;
    }

    public void setActualreceived(double actualreceived) {
        this.actualreceived = actualreceived;
    }

  
    

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public CartXProduct() {
    }

    public int getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(int seller_id) {
        this.seller_id = seller_id;
    }

    public CartXProduct(int cart_id, int product_id, String status) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.status = status;
    }

    public CartXProduct(int cart_id, int product_id, int seller_id, String status, String topic, String contactmethod, double price, String bearingtransactionfees, int transactionfees, String create_at) {
        this.cart_id = cart_id;
        this.seller_id = seller_id;
        this.product_id = product_id;
        this.status = status;
        this.topic = topic;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
        this.create_at = create_at;
    }

    public CartXProduct(int cart_id, int product_id, String status, double price, int transactionfees) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.status = status;
        this.price = price;
        this.transactionfees = transactionfees;
    }

    public CartXProduct(int cart_id, int product_id, int seller_id, String status, String topic, String contactmethod, double price, String bearingtransactionfees, int transactionfees) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.status = status;
        this.topic = topic;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
        this.seller_id = seller_id;
    }

    public CartXProduct(int cart_id, int product_id, int seller_id, String username, String status, String topic, String contactmethod, double price, String bearingtransactionfees, int transactionfees, String create_at) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.username = username;
        this.status = status;
        this.topic = topic;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
        this.seller_id = seller_id;
        this.create_at = create_at;
    }

    public CartXProduct(int cart_id, int product_id,int seller_id, String status, String topic, String contactmethod, double price, String bearingtransactionfees, int transactionfees, double actualreceived) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.seller_id = seller_id;
        this.status = status;
        this.topic = topic;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
        this.actualreceived = actualreceived;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
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
        return "CartXProduct{" + "cart_id=" + cart_id + ", product_id=" + product_id + ", status=" + status + ", topic=" + topic + ", contactmethod=" + contactmethod + ", price=" + price + ", bearingtransactionfees=" + bearingtransactionfees + ", transactionfees=" + transactionfees + ", seller_id=" + seller_id + ", create_at=" + create_at + '}';
    }



}
