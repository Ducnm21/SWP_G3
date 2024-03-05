/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguyen ngoc quang
 */
public class CartXOrder {

    private int cart_id;
    private int order_id;
    private int product_id;
    private int user_id;
    private String status;
    private String topic;
    private String seller;
    private String contactmethod;
    private int price;
    private String bearingtransactionfees;
    private int transactionfees;

    public CartXOrder() {
    }

    public CartXOrder(int cart_id, int order_id, int user_id, String status, String topic, String contactmethod, int price, String bearingtransactionfees, int transactionfees) {
        this.cart_id = cart_id;
        this.order_id = order_id;
        this.user_id = user_id;
        this.status = status;
        this.topic = topic;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
    }

    public CartXOrder(int cart_id, int order_id, int user_id, String status, String topic, String seller, String contactmethod, int price, String bearingtransactionfees, int transactionfees) {
        this.cart_id = cart_id;
        this.order_id = order_id;
        this.user_id = user_id;
        this.status = status;
        this.topic = topic;
        this.seller = seller;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
    }

    public CartXOrder(int cart_id, int order_id, int product_id, int user_id, String status, String topic, String seller, String contactmethod, int price, String bearingtransactionfees, int transactionfees) {
        this.cart_id = cart_id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.user_id = user_id;
        this.status = status;
        this.topic = topic;
        this.seller = seller;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    @Override
    public String toString() {
        return "CartXOrder{" + "cart_id=" + cart_id + ", order_id=" + order_id + ", product_id=" + product_id + ", user_id=" + user_id + ", status=" + status + ", topic=" + topic + ", seller=" + seller + ", contactmethod=" + contactmethod + ", price=" + price + ", bearingtransactionfees=" + bearingtransactionfees + ", transactionfees=" + transactionfees + '}';
    }

    

}
