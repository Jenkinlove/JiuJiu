package com.company.web.controller;

import com.company.domain.Answer;
import com.company.service.AnswerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class AnswerController {

    @Resource(name = "answerService")
    private AnswerService answerService;

    @RequestMapping("answer")
    public String answer(Model model){
        Answer answer = answerService.getAnswer();
        model.addAttribute("answer",answer);
        return "/answersBooks.jsp";
    }
}
