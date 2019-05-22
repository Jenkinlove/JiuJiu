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
        //ת����ҵ����ж��Ƿ���ڸ��û�

        User resUser = userService.checkUser(user);
        if (resUser == null) {
            model.addAttribute("error", "�û������������");
            return "/login_register.jsp";
        } else {
//            System.out.println(resUser);
            session.setAttribute("resUser", resUser);

            //�½�cookie
            Cookie cookie = new Cookie("users", user.getUsername() + "-" + user.getPassword());
            //System.out.println(name+" "+pwd);
            //2 �ж�remeber
            if (remember != null && remember.equals("yes")) {
                // "yes" ��ѡ��--- ������Чʱ��Ϊһ����
                cookie.setMaxAge(60 * 60 * 24 * 30);
            } else {
                // null û��ѡ --- ����cookie����Чʱ��Ϊ0
                cookie.setMaxAge(0);
            }
            response.addCookie(cookie);

            //�ض����������ȥ��ת��ָ����λ��
            /*return "redirect:/getPageData/1";*/
            return "redirect:/getPageData/1";
        }

    }

    @RequestMapping("loginout")
    public String loginOut(HttpSession session){
        //��յ�ǰ�û�session
        session.removeAttribute("resUser");
        return "redirect:/getPageData/1";
    }




}
