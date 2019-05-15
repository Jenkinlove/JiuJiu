package com.company.web.controller;

import com.company.domain.User;
import com.company.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Resource(name = "userService")
    UserService userService;

    @RequestMapping("login")
    public String login(User user, String remember, Model model, HttpServletResponse response){
        System.out.println(user+"--"+remember);
        //转发给业务层判断是否存在该用户
        try {
            List<User> users = userService.checkUser(user);
            for (User user1 : users) {
                System.out.println(user1);
            }
            //新建cookie
            Cookie cookie = new Cookie("users", user.getUsername()+"-"+user.getPassword());
            //System.out.println(name+" "+pwd);
            //2 判断remeber
            if (remember != null && remember.equals("yes")) {
                // "yes" 勾选了--- 设置有效时间为一个月
                cookie.setMaxAge(60 * 60 * 24 * 30);
            } else {
                // null 没勾选 --- 设置cookie的有效时间为0
                cookie.setMaxAge(0);
            }
            response.addCookie(cookie);


        } catch (Exception e) {
            if (e.getMessage().equals("用户名或密码错误")) {
                //跳回登录首页，回显错误信息
                System.out.println(e.getMessage());
                model.addAttribute("error",e.getMessage());
                return "/login_register.jsp";
            }
        }
        //重定向，让浏览器去跳转到指定的位置
        return "redirect:/result.jsp";
    }
}
