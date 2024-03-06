package model;

/**
 *
 * @author VIVO-S15
 */
public class User {

    private int id;
    private String username;
    private String password;
    private String email;
    private String mobile;
    private String fullname;
    private String created_at;
    private String deleted_by;
    private String updated_by;
    private int is_admin;
    private String banned;

    public User() {
    }

    public User(String username, String encode, String email, String mobile, String fullname) {
        this.username = username;
        this.password = encode;
        this.email = email;
        this.mobile = mobile;
        this.fullname = fullname;
    }



    public User(int id, String username, String password, String email, String mobile, String fullname, String created_at, String deleted_by, String updated_by, int is_admin, String banned) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.mobile = mobile;
        this.fullname = fullname;
        this.created_at = created_at;
        this.deleted_by = deleted_by;
        this.updated_by = updated_by;
        this.is_admin = is_admin;
        this.banned = banned;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getIs_admin() {
        return is_admin;
    }

    public void setIs_admin(int is_admin) {
        this.is_admin = is_admin;
    }

    public String getBanned() {
        return banned;
    }

    public void setBanned(String banned) {
        this.banned = banned;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", mobile=" + mobile + ", fullname=" + fullname + ", created_at=" + created_at + ", deleted_by=" + deleted_by + ", updated_by=" + updated_by + ", is_admin=" + is_admin + ", banned=" + banned + '}';
    }

}
