package com.company.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Setter@Getter
public class Entangler {
    private Integer en_id;
    private Date en_date;
    private String en_aritle;
    private Integer isprivacy;
    private Integer user_en_id;
    private String en_img;

    //一个纠结只属于一个用户
    private User user;

    //一个纠结有多个评论
    private Set<EntanglerComment> entanglerComments=new HashSet<>();

    @Override
    public String toString() {
        return "Entangler{" +
                "en_id=" + en_id +
                ", en_date=" + en_date +
                ", en_aritle='" + en_aritle + '\'' +
                ", isprivacy=" + isprivacy +
                ", user_en_id=" + user_en_id +
                ", en_img='" + en_img + '\'' +
                ", user=" + user +
                ", entanglerComments=" + entanglerComments +
                '}';
    }
}
