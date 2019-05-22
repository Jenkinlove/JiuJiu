package com.company.dao;

import com.company.domain.EntanglerComment;
import com.company.domain.User;
import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = false)
public class EntanglerCommentDaoImpl extends HibernateDaoSupport implements EntanglerCommentDao {

    @Override
    public void saveEntanglerComment(EntanglerComment entanglerComment) {
        this.getHibernateTemplate().save(entanglerComment);
        System.out.println(entanglerComment);

        /*this.getHibernateTemplate().execute(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {

                session.save(entanglerComment);
                return null;
            }
        });*/

//        this.getHibernateTemplate().execute(new HibernateCallback<EntanglerComment>() {
//            @Override
//            public EntanglerComment doInHibernate(Session session) throws HibernateException {
//                session.save(entanglerComment);
//                session.clear();
//                return null;
//            }
//        });
    }
}
