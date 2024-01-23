
package model;

/**
 *

 * @author nguyen ngoc quang
 */
public class User {
    private int user_id;
    private String username;
    private String password;
    private String fullname;
    private String email;
    private String mobile;
    private String created_at;
    private String deleted_at;
    private String updated_at;


    public User() {
    }


=======
    public User(int user_id, String username, String password, String fullname, String email, String mobile) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.mobile = mobile;
    }

    public User(String username, String password, String fullname, String email, String mobile) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.mobile = mobile;
    }

    public User(int user_id, String username, String password, String email, String mobile, String created_at, String deleted_at, String updated_at) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.mobile = mobile;
        this.created_at = created_at;
        this.deleted_at = deleted_at;
        this.updated_at = updated_at;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }


    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }


    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }


    public String getDeleted_by() {
        return deleted_by;
    }

    public void setDeleted_by(String deleted_by) {
        this.deleted_by = deleted_by;
    }

    public String getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(String updated_by) {
        this.updated_by = updated_by;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", mobile=" + mobile + ", fullname=" + fullname + ", created_at=" + created_at + ", deleted_by=" + deleted_by + ", updated_by=" + updated_by + '}';
    }
    

    
}
