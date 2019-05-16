package com.company.web.controller;

import com.company.service.CheckCodeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class CheckCodeController {

    @Resource(name = "checkCodeService")
    CheckCodeService checkCodeService;

    public void doGet(HttpServletRequest request, HttpServletResponse response){
        checkCodeService.doGet(request,response);
    }
    /*public Color getRandomColor(int minColor, int maxColor){
        return peopleService.getRandomColor(0,255);
    }*/
    @RequestMapping("checkCode")
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        checkCodeService.doPost(request,response);
    }
}
