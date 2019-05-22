package com.company.dao;

import com.company.domain.Entangler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class EntanglerDelDaoImpl extends JdbcDaoSupport implements EntanglerDelDao {
    @Override
    public void delEntangler(Entangler entangler) {
        this.getJdbcTemplate().update("delete from entangler_comment where en_id=?",
                entangler.getEn_id());
        this.getJdbcTemplate().update("delete from entangler where en_id=?",entangler.getEn_id());

    }
}
