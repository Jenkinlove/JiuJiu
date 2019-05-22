package com.company.dao;

import com.company.domain.Entangler;
import com.company.domain.EntanglerComment;
import com.company.domain.User;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface EntanglerDao {

    public void saveEntangler(Entangler entangler);

    public List<Entangler> getAllEntangler();


    Entangler getEntangler(int en_id);


    Integer getTotalCount(DetachedCriteria detachedCriteria);

    List<Entangler> getPageList(DetachedCriteria detachedCriteria, Integer page, int pageSize);

    List<Entangler> getPersonalEntangler(DetachedCriteria detachedCriteria, User user);

    public void delEntangler(Integer en_id);

    List<EntanglerComment> getEntanglerComment(Entangler entangler);
}
    
