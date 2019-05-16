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
        // �����֤�뼯�ϵĳ���
        int charsLength = codeChars.length();
        // ����3����¼�ǹرտͻ���������Ļ�����

        // ��3����䶼���Թر�������Ļ���������������������İ汾��ͬ������3������֧��Ҳ��ͬ

        // ��ˣ�Ϊ�˱��������ͬʱʹ����3��������ر�������Ļ�����
        response.setHeader("ragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // ����ͼ����֤��ĳ��Ϳ�
        int width = 90, height = 30;
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        Random random = new Random();
        g.setColor(getRandomColor(180, 250));

        g.fillRect(0, 0, width, height);

        g.setFont(new Font("Times New Roman", Font.ITALIC, height));

        g.setColor(getRandomColor(120, 180));
        // �û��������������ɵ���֤��
        StringBuffer validationCode = new StringBuffer();
        // ��֤����������
        String[] fontNames = { "Times New Roman", "Book antiqua", "Arial" };

        // �������4����֤��
        for (int i = 0; i < 4; i++) {
            // ������õ�ǰ��֤����ַ�������
            g.setFont(new Font(fontNames[random.nextInt(3)], Font.ITALIC,
                    height));
            // �����õ�ǰ��֤����ַ�
            char codeChar = codeChars.charAt(random.nextInt(charsLength));
            validationCode.append(codeChar);
            // ������õ�ǰ��֤���ַ�����ɫ
            g.setColor(getRandomColor(10, 100));
            // ��ͼ���������֤���ַ���x��y����������ɵ�
            g.drawString(String.valueOf(codeChar), 16 * i + random.nextInt(7),
                    height - random.nextInt(6));
        }

        // ���HttpSession����

        HttpSession session = request.getSession();

        // ����session����5����ʧЧ

        session.setMaxInactiveInterval(5 * 60);

        // ����֤�뱣����session������,keyΪvalidation_code

        session.setAttribute("validation_code", validationCode.toString());
        System.out.println(validationCode.toString());
        //�ر�Graphics����

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
        //���r�������ɫֵ
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
