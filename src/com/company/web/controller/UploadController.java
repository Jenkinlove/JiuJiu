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

        //确定上传地址
        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("/img/img_user");
        File uploadPath = new File(realPath);
        if(!uploadPath.exists()){
            uploadPath.mkdirs();
        }
        //确认最终地址
        String originalFilename = file.getOriginalFilename();
        uploadPath=new File(uploadPath+"/"+originalFilename);


        //开始上传
        file.transferTo(uploadPath);


        return "/update_info.jsp";
    }
}
