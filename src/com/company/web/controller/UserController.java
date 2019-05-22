package com.company.web.controller;

import com.company.domain.User;
import com.company.service.UserService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    @Resource(name = "userService")
    UserService userService;

    @RequestMapping("saveUser")
    @Scope("prototype")
    public String saveUser(@Valid User user, BindingResult result,
                           Model model, HttpSession session,String checkCode){
        if(result.getErrorCount()!=0){
            //��ȡУ������ֶμ���Ϣ
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println(fieldError.getField()+":"+fieldError.getDefaultMessage());
                model.addAttribute(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return "/login_register.jsp";
        }else{
            if(user.getUimage()==null){
                user.setUimage("01.jpg");
            }
            System.out.println(user);
            System.out.println("������"+checkCode);
            System.out.println("code------"+session.getAttribute("validation_code"));

            String code = (String)session.getAttribute("validation_code");
            if(checkCode.equals(code)){
                //ҵ��㴦�� �����ݿ��������
                userService.saveUser(user);
                return "/login_register.jsp";
            }else{
                model.addAttribute("codeError","��֤�����");
                return "/login_register.jsp";
            }


        }

    }

    @RequestMapping("updateInfo")
    public String updateInfo(User user,HttpSession session){
        User resUser = (User) session.getAttribute("resUser");
        System.out.println(resUser);
        System.out.println("----"+user);
        user.setUid(resUser.getUid());

        userService.updateUser(user);
        session.setAttribute("resUser",user);

        return "redirect:/personPage";
    }



}
