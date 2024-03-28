
package model;


public class Conflict {
    private int requets_id;
    private int sender_buyer_id;
    private String status;
    private String right_side;
    private String senderName;
    private int product_id;

    public Conflict() {
    }

    public Conflict(int requets_id, int sender_buyer_id, String status, String right_side, String senderName, int product_id) {
        this.requets_id = requets_id;
        this.sender_buyer_id = sender_buyer_id;
        this.status = status;
        this.right_side = right_side;
        this.senderName = senderName;
        this.product_id = product_id;
    }

    public Conflict(int requets_id, int sender_buyer_id, String status, String right_side, int product_id) {
        this.requets_id = requets_id;
        this.sender_buyer_id = sender_buyer_id;
        this.status = status;
        this.right_side = right_side;
        this.product_id = product_id;
    }

    
    public int getRequets_id() {
        return requets_id;
    }

    public void setRequets_id(int requets_id) {
        this.requets_id = requets_id;
    }

    public int getSender_buyer_id() {
        return sender_buyer_id;
    }

    public void setSender_buyer_id(int sender_buyer_id) {
        this.sender_buyer_id = sender_buyer_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRight_side() {
        return right_side;
    }

    public void setRight_side(String right_side) {
        this.right_side = right_side;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    @Override
    public String toString() {
        return "Conflict{" + "requets_id=" + requets_id + ", sender_buyer_id=" + sender_buyer_id + ", status=" + status + ", right_side=" + right_side + ", senderName=" + senderName + ", product_id=" + product_id + '}';
    }

  
 
}
