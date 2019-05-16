package com.company.web.controller;

import com.company.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
    @RequestMapping("test")
    public String test(User user,String remember){
        System.out.println(user+"--"+remember);
        return "/result.jsp";
    }

    @RequestMapping("test2")
    public String test2(User user){
        System.out.println(user);
        return "/result.jsp";
    }
}
