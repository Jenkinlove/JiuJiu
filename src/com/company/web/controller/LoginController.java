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
        //ת����ҵ����ж��Ƿ���ڸ��û�
        try {
            List<User> users = userService.checkUser(user);
            for (User user1 : users) {
                System.out.println(user1);
            }
            //�½�cookie
            Cookie cookie = new Cookie("users", user.getUsername()+"-"+user.getPassword());
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


        } catch (Exception e) {
            if (e.getMessage().equals("�û������������")) {
                //���ص�¼��ҳ�����Դ�����Ϣ
                System.out.println(e.getMessage());
                model.addAttribute("error",e.getMessage());
                return "/login_register.jsp";
            }
        }
        //�ض����������ȥ��ת��ָ����λ��
        return "redirect:/result.jsp";
    }
}
