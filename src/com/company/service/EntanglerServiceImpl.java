package com.company.service;

import com.company.dao.EntanglerCommentDao;
import com.company.dao.EntanglerDao;
import com.company.dao.EntanglerDelDao;
import com.company.domain.Entangler;
import com.company.domain.EntanglerComment;
import com.company.domain.PageBean;
import com.company.domain.User;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.naming.Name;
import java.util.List;

@Service("entanglerService")
@Transactional(readOnly = false)
public class EntanglerServiceImpl implements EntanglerService {

    @Resource(name = "entanglerDao")
    private EntanglerDao entanglerDao;

    @Resource(name = "entanglerDelDao")
    private EntanglerDelDao entanglerDelDao;


    @Override
    public void saveEntangler(Entangler entangler) {
        entanglerDao.saveEntangler(entangler);
    }

    @Override
    public List<Entangler> getAllEntangler() {
        List<Entangler> entanglerList=entanglerDao.getAllEntangler();

        return entanglerList;
    }


    @Override
    public Entangler getEntangler(int en_id) {
        Entangler entangler=entanglerDao.getEntangler(en_id);
        return entangler;
    }

    @Override
    public PageBean getPageList(DetachedCriteria detachedCriteria, Integer page, int pageSize) {
        PageBean<Entangler> pageBean = new PageBean<>();

        //���õ�ǰҳ
        pageBean.setCurrentPage(page);
        //���õ�ǰҳ�ж�������
        pageBean.setPageSize(pageSize);
        //��ȡ�ܼ�¼��
        //�����ݿ⵱�в�ѯ�ܼ�¼
        Integer totalCount=entanglerDao.getTotalCount(detachedCriteria);
        //�����ܼ�¼��
        pageBean.setTotalCount(totalCount);
        //������ҳ��
        pageBean.setTotalPage(pageBean.getTotalPage());

        System.out.println("index="+pageBean.getIndex());

        //��ѯ��ǰҳ����
        List<Entangler> pageList=entanglerDao.getPageList(detachedCriteria,pageBean.getIndex(),pageSize);
        //���õ�ǰҳ����
        pageBean.setList(pageList);
        System.out.println(pageBean);

        return pageBean;
    }

    @Override
    public  List<Entangler> getPersonalEntangler(DetachedCriteria detachedCriteria, User user) {
        List<Entangler> entanglerlist=entanglerDao.getPersonalEntangler(detachedCriteria,user);
        return entanglerlist;
    }

    @Override
    public void delEntangler(Integer en_id) {
        entanglerDao.delEntangler(en_id);
    }

    @Override
    public List<EntanglerComment> getEntanglerComment(Entangler entangler) {
        List<EntanglerComment> entanglerComments=entanglerDao.getEntanglerComment(entangler);
        return entanglerComments;
    }


}
