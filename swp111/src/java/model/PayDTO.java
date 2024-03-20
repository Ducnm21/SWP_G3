/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguyen ngoc quang
 */
public class PayDTO {
    private int user_id;
    private int product_id;
    


    public PayDTO() {
    }

    public PayDTO(int user_id, int product_id) {
        this.user_id = user_id;
        this.product_id = product_id;
    }

  
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

}
