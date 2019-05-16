package com.company.service;

import org.springframework.stereotype.Service;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Random;

@Service("checkCodeService")
class CheckCodeImpl implements CheckCodeService {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)  {

        String codeChars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        // 获得验证码集合的长度
        int charsLength = codeChars.length();
        // 下面3条记录是关闭客户端浏览器的缓冲区

        // 这3条语句都可以关闭浏览器的缓冲区，但是由于浏览器的版本不同，对这3条语句的支持也不同

        // 因此，为了保险起见，同时使用这3条语句来关闭浏览器的缓冲区
        response.setHeader("ragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // 设置图形验证码的长和宽
        int width = 90, height = 30;
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        Random random = new Random();
        g.setColor(getRandomColor(180, 250));

        g.fillRect(0, 0, width, height);

        g.setFont(new Font("Times New Roman", Font.ITALIC, height));

        g.setColor(getRandomColor(120, 180));
        // 用户保存最后随机生成的验证码
        StringBuffer validationCode = new StringBuffer();
        // 验证码的随机字体
        String[] fontNames = { "Times New Roman", "Book antiqua", "Arial" };

        // 随机生成4个验证码
        for (int i = 0; i < 4; i++) {
            // 随机设置当前验证码的字符的字体
            g.setFont(new Font(fontNames[random.nextInt(3)], Font.ITALIC,
                    height));
            // 随机获得当前验证码的字符
            char codeChar = codeChars.charAt(random.nextInt(charsLength));
            validationCode.append(codeChar);
            // 随机设置当前验证码字符的颜色
            g.setColor(getRandomColor(10, 100));
            // 在图形上输出验证码字符，x和y都是随机生成的
            g.drawString(String.valueOf(codeChar), 16 * i + random.nextInt(7),
                    height - random.nextInt(6));
        }

        // 获得HttpSession对象

        HttpSession session = request.getSession();

        // 设置session对象5分钟失效

        session.setMaxInactiveInterval(5 * 60);

        // 将验证码保存在session对象中,key为validation_code

        session.setAttribute("validation_code", validationCode.toString());
        System.out.println(validationCode.toString());
        //关闭Graphics对象

        g.dispose();

        OutputStream outS = null;
        try {
            outS = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            ImageIO.write(image, "JPEG", outS);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @Override
    public Color getRandomColor(int minColor, int maxColor) {
        Random random = new Random();
        if(minColor > 255){
            minColor = 255;
        }
        if(maxColor > 255){
            maxColor = 255;
        }
        //获得r的随机颜色值
        int red = minColor+random.nextInt(maxColor-minColor);
        int green = minColor + random.nextInt(maxColor-minColor);
        int blue = minColor + random.nextInt(maxColor-minColor);
        return new Color(red,green,blue);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)   {

        doGet(request, response);
    }
}
