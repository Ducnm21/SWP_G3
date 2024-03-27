/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Base64;
import java.util.Random;

/**
 *
 * @author hung1
 */
public class RandomNumber {
     public String maOTP() {
        Random rd = new Random();
        String r1 = rd.nextInt(10) + "";
        String r2 = rd.nextInt(10) + "";
        String r3 = rd.nextInt(10) + "";
        String r4 = rd.nextInt(10) + "";
        String r5 = rd.nextInt(10) + "";
        String r6 = rd.nextInt(10) + "";
        String origin = r1 + r2 + r3 + r4 + r5 + r6;
        String encodedString = Base64.getEncoder().encodeToString(origin.getBytes());
        System.out.println(encodedString.substring(0, 6));
//        byte[] decodedBytes = Base64.getDecoder().decode(origin);
//        System.out.println(decodedBytes);
        return encodedString.substring(0, 6);
    }
}
