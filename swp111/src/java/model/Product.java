/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Product {

    private int product_id;
    private String status;
    private String topic;
    private String contactmethod;
    private String publicprivate;
    private int price;
    private String bearingtransactionfees;
    private int transactionfees;
    private double actualreceived;
    private String description;
    private String hiddencontent;
    private String created_at;
    private String updated_at;
    private int user_id;

    public Product() {
    }

    public Product(int product_id, String status, String topic, String contactmethod, String publicprivate, int price, String bearingtransactionfees, int transactionfees, double actualreceived, String description, String hiddencontent, int user_id) {
        this.product_id = product_id;
        this.status = status;
        this.topic = topic;
        this.contactmethod = contactmethod;
        this.publicprivate = publicprivate;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
        this.actualreceived = actualreceived;
        this.description = description;
        this.hiddencontent = hiddencontent;
        this.user_id = user_id;

        
    }

    public Product(int product_id, String status, String topic, String contactmethod, String publicprivate, int price, String bearingtransactionfees, int transactionfees, double actualreceived, String description, String hiddencontent, String created_at, String updated_at, int user_id) {
        this.product_id = product_id;
        this.status = status;        
        this.topic = topic;
        this.contactmethod = contactmethod;
        this.publicprivate = publicprivate;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
        this.actualreceived = actualreceived;
        this.description = description;
        this.hiddencontent = hiddencontent;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.user_id = user_id;
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

    public String getPublicprivate() {
        return publicprivate;
    }

    public void setPublicprivate(String publicprivate) {
        this.publicprivate = publicprivate;
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

    public double getActualreceived() {
        return actualreceived;
    }

    public void setActualreceived(int actualreceived) {
        this.actualreceived = actualreceived;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHiddencontent() {
        return hiddencontent;
    }

    public void setHiddencontent(String hiddencontent) {
        this.hiddencontent = hiddencontent;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }



    
}
