/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 *
 * @author 84353
 */
public class CaptchaGenerate {

    public static final String ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    public static final int WIDTH = 150;
    public static final int HEIGHT = 50;

    public static String generateCaptcha() {
        Random ran = new Random();
        StringBuilder cap = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            cap.append(ALPHABET.charAt(ran.nextInt(ALPHABET.length())));
        }
        return cap.toString();
    }

    public static BufferedImage genImage(String captcha) {
        BufferedImage img = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = img.createGraphics();
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, WIDTH, HEIGHT);
        graphics.setColor(Color.BLACK);
        graphics.setFont(new Font("Arial", Font.BOLD, 20));

        for (int i = 0; i < captcha.length(); i++) {
            int x = (int) (i * WIDTH / (double) captcha.length());
            int y = HEIGHT / 2 + 5;
            graphics.drawChars(captcha.toCharArray(), i, 1, x, y);
        }

        for (int i = 0; i < 5; i++) {
            graphics.setColor(new Color(150 + new Random().nextInt(100), 150 + new Random().nextInt(100), 150 + new Random().nextInt(100)));
            int x1 = new Random().nextInt(WIDTH);
            int y1 = new Random().nextInt(HEIGHT);
            int x2 = new Random().nextInt(WIDTH);
            int y2 = new Random().nextInt(HEIGHT);
            graphics.drawLine(x1, y1, x2, y2);
        }

        graphics.dispose();
        return img;
    }

    public static BufferedImage getCaptchaImage() {
        String captchaText = generateCaptcha();
        return genImage(captchaText);
    }
}
