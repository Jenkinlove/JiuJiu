package com.company.dao;

import com.company.domain.Entangler;
import com.company.domain.EntanglerComment;
import com.company.domain.User;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.*;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = false)
public class EntanglerDaoImpl extends HibernateDaoSupport implements EntanglerDao {


    @Override
    public void saveEntangler(Entangler entangler) {
        System.out.println("entanglerDao"+"----"+entangler);
        this.getHibernateTemplate().save(entangler);
       /* this.getHibernateTemplate().execute(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {
                session.save(entangler);
                return null;
            }
        });*/
    }

    @Override
    public List<Entangler> getAllEntangler() {

        //设置条件
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Entangler.class);
        detachedCriteria.add(Restrictions.eq("isprivacy",0));
        List<Entangler> entanglerList = (List<Entangler>)this.getHibernateTemplate().findByCriteria(detachedCriteria);


        return entanglerList;
    }


    @Override
    public Entangler getEntangler(int en_id) {

        System.out.println(en_id);

        //设置条件
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Entangler.class);
        detachedCriteria.add(Restrictions.eq("en_id",en_id));
        List<Entangler> list = (List<Entangler>)this.getHibernateTemplate().findByCriteria(detachedCriteria);
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public Integer getTotalCount(DetachedCriteria detachedCriteria) {
        detachedCriteria.setProjection(Projections.rowCount());
        List<Long> list = (List<Long>)this.getHibernateTemplate().findByCriteria(detachedCriteria);
        if(list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<Entangler> getPageList(DetachedCriteria detachedCriteria, Integer page, int pageSize) {
        //执行查询
        detachedCriteria.setProjection(null);
        detachedCriteria.addOrder(Order.desc("en_date"));
        List<Entangler> list =
                (List<Entangler>) this.getHibernateTemplate().findByCriteria(detachedCriteria, page,pageSize);
      /*  Criteria criteria = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Entangler.class);
        criteria.addOrder(Order.desc("en_date"));
        criteria.setFirstResult(page);
        criteria.setMaxResults(pageSize);
        List<Entangler> list = criteria.list();*/

        return list;
    }

    @Override
    public  List<Entangler> getPersonalEntangler(DetachedCriteria detachedCriteria, User user) {
        detachedCriteria.setProjection(null);
        detachedCriteria.add(Restrictions.eq("user",user));
        detachedCriteria.addOrder(Order.desc("en_date"));
        List<Entangler> list =
                (List<Entangler>)this.getHibernateTemplate().findByCriteria(detachedCriteria);
        return list;
    }

    @Override
    public void delEntangler(Integer en_id) {
       /* this.getHibernateTemplate().delete(entangler);*/
        Entangler entangler = this.getHibernateTemplate().get(Entangler.class, en_id);
        this.getHibernateTemplate().delete(entangler);
       /* this.getHibernateTemplate().execute(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {
                session.delete(entangler);
                return null;
            }
        });*/


    }

    @Override
    public List<EntanglerComment> getEntanglerComment(Entangler entangler) {

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(EntanglerComment.class);
        detachedCriteria.add(Restrictions.eq("entangler", entangler));
        List<EntanglerComment> list =(List<EntanglerComment>) this.getHibernateTemplate().findByCriteria(detachedCriteria);

        return list;
    }


}
