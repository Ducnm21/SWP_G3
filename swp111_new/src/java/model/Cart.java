/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

import java.util.List;

/**
 *
 * @author nguyen ngoc quang
 */
public class Cart {

    private int cart_id;
    private int product_id;
    private int user_id;
    private String status;

//    public Cart(List<Integer> order_id, int user_id, String status) {
//        this.order_id = order_id;
//        this.user_id = user_id;
//        this.status = status;
//    }

    public Cart() {
    }

    public Cart(int cart_id, int product_id, int user_id, String status) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.user_id = user_id;
        this.status = status;
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

}
