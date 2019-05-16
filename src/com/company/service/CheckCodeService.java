package com.company.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;

public interface CheckCodeService {
    public void doGet(HttpServletRequest request, HttpServletResponse response);
    public Color getRandomColor(int minColor, int maxColor);
    void doPost(HttpServletRequest request, HttpServletResponse response);
}
