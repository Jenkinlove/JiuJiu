package com.company.web.controller;

import com.company.domain.User;
import com.company.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    @Resource(name = "userService")
    UserService userService;

    @RequestMapping("saveUser")
    public String saveUser(@Valid User user, BindingResult result, Model model){
        if(result.getErrorCount()!=0){
            //��ȡУ������ֶμ���Ϣ
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println(fieldError.getField()+":"+fieldError.getDefaultMessage());
                model.addAttribute(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return "/login_register.jsp";
        }
        //ҵ��㴦�� �����ݿ��������
        userService.saveUser(user);

        return "/login_register.jsp";
    }
}
