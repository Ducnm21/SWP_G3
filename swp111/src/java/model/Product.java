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
    private double price;
    private String bearingtransactionfees;
    private double transactionfees;
    private double actualreceived;
    private String description;
    private String hiddencontent;
    private String created_at;
    private String updated_at;
    private int user_id;
    private String sellerName;
    private int isConfirm;

    public Product() {
    }

    public Product(int product_id, String status, String topic, String contactmethod, String publicprivate, double price, String bearingtransactionfees, double transactionfees, double actualreceived, String description, String hiddencontent, String created_at, String updated_at, int user_id, String sellerName) {
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
        this.sellerName = sellerName;
    }

    public Product(int product_id, String status, String topic, String contactmethod, String publicprivate, double price, String bearingtransactionfees, double transactionfees, double actualreceived, String description, String hiddencontent, int user_id) {
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

    public Product(int product_id, String status, String topic, String contactmethod, String publicprivate, double price, String bearingtransactionfees, double transactionfees, double actualreceived, String description, String hiddencontent, String created_at, String updated_at, int user_id) {
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

    public Product(int product_id, String status, String topic, String contactmethod, String publicprivate, double price, String bearingtransactionfees, double transactionfees, double actualreceived, String description, String hiddencontent, String created_at, String updated_at, int user_id, int isConfirm) {
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
        this.isConfirm = isConfirm;
    }

    public int getIsConfirm() {
        return isConfirm;
    }

    public void setIsConfirm(int isConfirm) {
        this.isConfirm = isConfirm;
    }

    public Product(double price) {
        this.price = price;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBearingtransactionfees() {
        return bearingtransactionfees;
    }

    public void setBearingtransactionfees(String bearingtransactionfees) {
        this.bearingtransactionfees = bearingtransactionfees;
    }

    public double getTransactionfees() {
        return transactionfees;
    }

    public void setTransactionfees(double transactionfees) {
        this.transactionfees = transactionfees;
    }

    public double getActualreceived() {
        return actualreceived;
    }

    public void setActualreceived(double actualreceived) {
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

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", status=" + status + ", topic=" + topic + ", contactmethod=" + contactmethod + ", publicprivate=" + publicprivate + ", price=" + price + ", bearingtransactionfees=" + bearingtransactionfees + ", transactionfees=" + transactionfees + ", actualreceived=" + actualreceived + ", description=" + description + ", hiddencontent=" + hiddencontent + ", created_at=" + created_at + ", updated_at=" + updated_at + ", user_id=" + user_id + ", sellerName=" + sellerName + '}';
    }

}
