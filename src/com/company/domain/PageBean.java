package com.company.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter@Getter
public class PageBean<T> {
    /*��ǰҳ*/
    private Integer currentPage;
    /*һҳ����������*/
    private Integer pageSize;
    /*��ǰ��ѯ�ĽǱ�*/
    private Integer index;
    /*�ܼ�¼��*/
    private Integer totalCount;
    /*��ҳ��*/
    private Integer totalPage;
    /*��ǰҳ������*/
    private List<T> list;

    /*�����ǰҳû������,Ĭ������Ϊ��1ҳ*/
    public void setCurrentPage(Integer currentPage) {
        if (currentPage == null) {
            currentPage = 1;
        }
        this.currentPage = currentPage;
    }
    /*���û�����õ�ǰҳ�ܼ�¼����,����Ĭ�ϼ�¼��Ϊһҳ5��*/
    public void setPageSize(Integer pageSize) {
        if (pageSize == null) {
            pageSize = 5;
        }
        this.pageSize = pageSize;
    }
    /*���㵱ǰҳ�����ݿ⵱�в�ѯ��λ��*/
    public Integer getIndex() {
        return (currentPage-1)*pageSize;
    }
    /*������ҳ��*/
    public Integer getTotalPage() {
        double ceil = Math.ceil(totalCount * 1.0 / pageSize);
        return (int)ceil;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", index=" + index +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                '}';
    }
}
