package com.company.service;

import com.company.dao.AnswerDao;
import com.company.domain.Answer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("answerService")
@Transactional
public class AnswerServiceImpl implements AnswerService {

    @Resource(name = "answerDao")
    AnswerDao answerDao;

    @Override
    public Answer getAnswer() {
        Answer answer = answerDao.getAnswer();
        return answer;
    }
}
