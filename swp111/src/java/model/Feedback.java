/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author VIVO-S15
 */
public class Feedback {

    private int feedback_id;
    private String content;
    private int sender_user_id;
    private int receiver_user_id;
    private String sender_username;

    public Feedback() {
    }

    public Feedback(int feedback_id, String content, int sender_user_id, int receiver_user_id, String sender_username) {
        this.feedback_id = feedback_id;
        this.content = content;
        this.sender_user_id = sender_user_id;
        this.receiver_user_id = receiver_user_id;
        this.sender_username = sender_username;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getSender_user_id() {
        return sender_user_id;
    }

    public void setSender_user_id(int sender_user_id) {
        this.sender_user_id = sender_user_id;
    }

    public int getReceiver_user_id() {
        return receiver_user_id;
    }

    public void setReceiver_user_id(int receiver_user_id) {
        this.receiver_user_id = receiver_user_id;
    }

    public String getSender_username() {
        return sender_username;
    }

    public void setSender_username(String sender_username) {
        this.sender_username = sender_username;
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedback_id=" + feedback_id + ", content=" + content + ", sender_user_id=" + sender_user_id + ", receiver_user_id=" + receiver_user_id + ", sender_username=" + sender_username + '}';
    }

}
