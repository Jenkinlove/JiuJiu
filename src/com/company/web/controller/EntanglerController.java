package com.company.web.controller;

import com.company.domain.Entangler;
import com.company.domain.EntanglerComment;
import com.company.domain.PageBean;
import com.company.domain.User;
import com.company.service.EntanglerCommentService;
import com.company.service.EntanglerService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@Scope("prototype")
public class EntanglerController {

    @Resource(name = "entanglerService")
    private EntanglerService entanglerService;

    @Resource(name = "entanglerComment")
    private EntanglerComment entanglerComment;

    @Resource(name = "entanglerCommentService")
    private EntanglerCommentService entanglerCommentService;


    @RequestMapping("saveEntangler")
    public String saveEntangler(Entangler entangler, String[] en_img, HttpSession session){

        User resUser = (User) session.getAttribute("resUser");
        //System.out.println("saveEntangler"+resUser);
        entangler.setEn_date(new Date());
        entangler.setUser_en_id(resUser.getUid());

        //将获取的en_img图片数组转化为字符串，并用逗号隔开
        StringBuffer buffer = new StringBuffer();
        if(en_img!=null && en_img.length>0){
            for(int i=0;i<en_img.length;i++){
                buffer.append(en_img[i]);
                if((i+1) != en_img.length){
                    buffer.append(",");
                }
            }
        }
        String simg=buffer.toString();
        entangler.setEn_img(simg);



        //判断isprivacy是否为空，若为空设为0
        if(entangler.getIsprivacy()==null){
            entangler.setIsprivacy(0);
        }else{
            entangler.setIsprivacy(1);
        }



        //双向维护
        entangler.setUser(resUser);
        resUser.getEntanglers().add(entangler);

        System.out.println(entangler);

        //调用业务层  把纠结上传给数据库
        entanglerService.saveEntangler(entangler);


        return "/getPageData/1";
    }

    @RequestMapping("/getAllEntangler")
    public String getAllEntangler(Model model){

        //调用业务层，获取所有非隐私的纠结
        List<Entangler> entanglerList= entanglerService.getAllEntangler();

        /*for (Entangler entangler : entanglerList) {
            System.out.println(entangler);
        }*/
        System.out.println(entanglerList);

        //将获取的纠结列表传给page.jsp
        model.addAttribute("entanglerList",entanglerList);

        return "/page.jsp";
    }

    @RequestMapping("getPageData/{page}")
    public String getPageData(@PathVariable Integer page,Model model){
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Entangler.class);
        PageBean pageBean= entanglerService.getPageList(detachedCriteria,page,5);

        model.addAttribute("entanglerList",pageBean.getList());
        model.addAttribute("pageBean",pageBean);
        return "/page.jsp";
    }

    @RequestMapping("saveEntanglerComment/{id}/{commentContent}")
    public String saveEntanglerComment(HttpSession session, @PathVariable String id,
                                       @PathVariable String commentContent,Model model){
        int en_id = Integer.parseInt(id);
        System.out.println(en_id+"--"+commentContent);

        User resUser =(User) session.getAttribute("resUser");
        entanglerComment.setEn_com_id(en_id);
        entanglerComment.setEn_comment(commentContent);
        entanglerComment.setEc_date(new Date());


        //根据en_id 查出响应的纠结
        Entangler entangler=entanglerService.getEntangler(en_id);
        System.out.println(entangler);

        //双向维护
        entanglerComment.setEntangler(entangler);
        entanglerComment.setUser(resUser);
        resUser.getComments().add(entanglerComment);
        entangler.getEntanglerComments().add(entanglerComment);
        System.out.println(entanglerComment);

        //调用业务层  把纠结评论上传给数据库
        entanglerCommentService.saveEntanglerComment(entanglerComment);

        return "redirect:/getPageData/1";
    }

    @RequestMapping("personPage")
    public String psersonPage(HttpSession session,Model model){
        User resUser =(User) session.getAttribute("resUser");
        Integer uid = resUser.getUid();

        //根据uid获得此用户所写的纠结
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Entangler.class);
        List<Entangler> entanglerList=entanglerService.getPersonalEntangler(detachedCriteria,resUser);
        for (Entangler entangler : entanglerList) {
            System.out.println(entangler);
        }
        model.addAttribute("entanglerList",entanglerList);

        return "/personal_center.jsp";
    }


    @RequestMapping("deleteEntangler/{en_id}")
    public String deleteEntangler(@PathVariable Integer en_id){
//        int en_id = Integer.parseInt(id);
        //调用业务层，通过en_id删除掉对应的纠结
      /*  DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Entangler.class);
        Entangler entangler=entanglerService.getEntangler(en_id);
        System.out.println(entangler);*/

        entanglerService.delEntangler(en_id);


        return "redirect:/personPage";
//        return "/result.jsp";
    }





}
