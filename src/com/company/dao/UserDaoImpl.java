package com.company.dao;

import com.company.domain.User;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(readOnly = false)
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
    @Override
    public void saveUser(User user) {
        this.getHibernateTemplate().save(user);
        /*this.getHibernateTemplate().execute(new HibernateCallback<User>() {
            @Override
            public User doInHibernate(Session session) throws HibernateException {
                session.save(user);
                return null;
            }
        });*/
    }

    @Override
    public User checkUser(String username,String password) {
        System.out.println("dao"+username+password);
        //设置条件
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
        detachedCriteria.add(Restrictions.eq("username",username));
        detachedCriteria.add(Restrictions.eq("password",password));
        //使用QBC查询
        List<User> list = ( List<User>)this.getHibernateTemplate().findByCriteria(detachedCriteria);
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public void updateUser(User user) {
        this.getHibernateTemplate().update(user);
    }
}
