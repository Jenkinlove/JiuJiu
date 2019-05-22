package com.company.web.controller;

import com.company.domain.User;
import com.company.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Resource(name = "user")
    User user;

    @Resource(name = "userService")
    UserService userService;

    @RequestMapping("login")
    public String login(String uname, String pwd, String remember, Model model,
                        HttpServletResponse response,HttpSession session) {
        user.setUsername(uname);
        user.setPassword(pwd);
        //System.out.println(user+"--"+remember);
        //转发给业务层判断是否存在该用户

        User resUser = userService.checkUser(user);
        if (resUser == null) {
            model.addAttribute("error", "用户名或密码错误");
            return "/login_register.jsp";
        } else {
//            System.out.println(resUser);
            session.setAttribute("resUser", resUser);

            //新建cookie
            Cookie cookie = new Cookie("users", user.getUsername() + "-" + user.getPassword());
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

            //重定向，让浏览器去跳转到指定的位置
            /*return "redirect:/getPageData/1";*/
            return "redirect:/getPageData/1";
        }

    }

    @RequestMapping("loginout")
    public String loginOut(HttpSession session){
        //清空当前用户session
        session.removeAttribute("resUser");
        return "redirect:/getPageData/1";
    }




}
