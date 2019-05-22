package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Getter@Setter
@Component("entanglerComment")
public class EntanglerComment {
    private Integer ec_id;
    private Date ec_date;
    private String en_comment;
    private Integer en_com_id;
    private Integer user_com_id;

    //һ������ֻ����һ������
    private Entangler entangler;

    //һ������ֻ����һ���û�
    private User user;

    @Override
    public String toString() {
        return "EntanglerComment{" +
                "ec_id=" + ec_id +
                ", ec_date=" + ec_date +
                ", en_comment='" + en_comment + '\'' +
                ", en_com_id=" + en_com_id +
                ", user=" + user +
                '}';
    }
}
