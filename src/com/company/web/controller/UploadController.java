package com.company.web.controller;

import com.company.service.EntanglerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
public class UploadController {

    @RequestMapping("upload")
    public String upload(@RequestParam("file")CommonsMultipartFile file, HttpSession session ,
                         Model model) throws IOException {

        //ȷ���ϴ���ַ
        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("/img/img_user");
        File uploadPath = new File(realPath);
        if(!uploadPath.exists()){
            uploadPath.mkdirs();
        }
        //ȷ�����յ�ַ
        String originalFilename = file.getOriginalFilename();
        uploadPath=new File(uploadPath+"/"+originalFilename);


        //��ʼ�ϴ�
        file.transferTo(uploadPath);


        return "/update_info.jsp";
    }
}
