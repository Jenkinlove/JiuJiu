package com.company.service;


import com.company.domain.Entangler;
import com.company.domain.EntanglerComment;
import com.company.domain.PageBean;
import com.company.domain.User;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface EntanglerService {
    public void saveEntangler(Entangler entangler);

    public List<Entangler> getAllEntangler();


    Entangler getEntangler(int en_id);


    PageBean getPageList(DetachedCriteria detachedCriteria, Integer page, int i);

    List<Entangler> getPersonalEntangler(DetachedCriteria detachedCriteria, User user);

    public void delEntangler(Integer en_id);

    List<EntanglerComment> getEntanglerComment(Entangler entangler);
}
