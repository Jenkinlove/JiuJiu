package com.company.dao;

import com.company.domain.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
    @Override
    public void saveUser(User user) {
        this.getHibernateTemplate().save(user);

    }

    @Override
    public List<User> checkUser(User user) {
        Criteria criteria = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(User.class);
        criteria.add(Restrictions.eq("username",user.getUsername()));
        criteria.add(Restrictions.eq("password",user.getPassword()));
        List<User> list = criteria.list();
        return list;
    }
}
