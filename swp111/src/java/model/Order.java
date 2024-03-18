/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Order {

    private int id;
    private int user_id;
    private String status;
    private String customer;
    private String topic;
    private String contactmethod;
    private String publicprivate;
    private int price;
    private String bearingtransactionfees;
    private int transactionfees;
    private int actualreceived;
    private String description;
    private String hiddencontent;
    private String created_at;
    private String updated_at;
    

    public Order() {
    }

    public Order(int id, String status, String customer, String topic, String contactmethod, String publicprivate, int price, String bearingtransactionfees, int transactionfees, int actualreceived, String description, String hiddencontent, String created_at, String updated_at, int user_id) {
        this.id = id;
        this.status = status;
        this.customer = customer;
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


    public Order(int id, String topic, String contactmethod, int price, String bearingtransactionfees, int transactionfees, int actualreceived, String created_at, String updated_at) {
        this.id = id;
        this.topic = topic;
        this.contactmethod = contactmethod;
        this.price = price;
        this.bearingtransactionfees = bearingtransactionfees;
        this.transactionfees = transactionfees;
        this.actualreceived = actualreceived;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

                        
    public Order(int id, int user_id, String status, String customer, String topic, String contactmethod, String publicprivate, int price, String bearingtransactionfees, int transactionfees, int actualreceived, String description, String hiddencontent, String created_at, String updated_at) {
        this.id = id;
        this.user_id = user_id;
        this.status = status;
        this.customer = customer;
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
    }
    
    

    
 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
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

    public int getActualreceived() {
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

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", user_id=" + user_id + ", status=" + status + ", customer=" + customer + ", topic=" + topic + ", contactmethod=" + contactmethod + ", publicprivate=" + publicprivate + ", price=" + price + ", bearingtransactionfees=" + bearingtransactionfees + ", transactionfees=" + transactionfees + ", actualreceived=" + actualreceived + ", description=" + description + ", hiddencontent=" + hiddencontent + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }

}
