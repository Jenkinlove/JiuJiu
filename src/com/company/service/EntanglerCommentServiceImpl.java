package com.company.service;

import com.company.dao.EntanglerCommentDao;
import com.company.domain.EntanglerComment;
import net.bytebuddy.asm.Advice;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("entanglerCommentService")
@Transactional
public class EntanglerCommentServiceImpl implements EntanglerCommentService {

    @Resource(name = "entanglerCommentDao")
    private EntanglerCommentDao entanglerCommentDao;


    @Override
    public void saveEntanglerComment(EntanglerComment entanglerComment) {
        System.out.println("service"+entanglerComment);
        entanglerCommentDao.saveEntanglerComment(entanglerComment);
    }
}
