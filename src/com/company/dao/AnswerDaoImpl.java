package com.company.dao;

import com.company.domain.Answer;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.Random;

public class AnswerDaoImpl extends HibernateDaoSupport implements AnswerDao {
    @Override
    public Answer getAnswer() {
        Random random = new Random();
        int id=random.nextInt(40)+1;
        Answer answer = this.getHibernateTemplate().get(Answer.class, id);
        return answer;
    }
}
