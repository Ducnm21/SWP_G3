/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class News {
    private int news_id;
    private String content;
    private int user_id;
    private int order_id;
    private int is_seen;

    public News() {
    }

    public News(int news_id, String content, int user_id, int order_id, int is_seen) {
        this.news_id = news_id;
        this.content = content;
        this.user_id = user_id;
        this.order_id = order_id;
        this.is_seen = is_seen;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getIs_seen() {
        return is_seen;
    }

    public void setIs_seen(int is_seen) {
        this.is_seen = is_seen;
    }

    @Override
    public String toString() {
        return "News{" + "news_id=" + news_id + ", content=" + content + ", user_id=" + user_id + ", order_id=" + order_id + ", is_seen=" + is_seen + '}';
    }

   
}
