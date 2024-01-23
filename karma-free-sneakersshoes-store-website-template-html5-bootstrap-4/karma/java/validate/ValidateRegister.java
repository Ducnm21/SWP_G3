/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validate;

/**
 *
 * @author nguyen ngoc quang
 */
public class ValidateRegister {
    private static final String VALID_MOBILE = "^(\\(0\\d{2}\\)|0\\d{2})[-. ]?\\d{3}[-. ]?\\d{4}$";
    private static final String VALID_EMAIL = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
    private static final String VALID_PASSWORD = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$";

    public boolean CheckMobile(String mobile){
        if(mobile.matches(VALID_MOBILE)){
            return true;
        }
        
        return false;
    }
    public boolean CheckEmail(String email){
        if(email.matches(VALID_EMAIL)){
            return true;
        }
        return false;
    }
    public boolean CheckPassword(String password){
        if(password.matches(VALID_PASSWORD)){
            return true;
        }
        return false;
    }
}
