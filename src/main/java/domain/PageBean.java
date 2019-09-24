package domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

public class PageBean<T> implements Serializable {
    //当前页
    private int pageCode;
    //总页数=总条数/每页显示的条数
    private int totalPage;
    //总记录数
    private int totalCount;
    //每页显示的记录条数
    private int pageSize;
    //每页显示的记录条数
    private List<T> beanList;

    public int getPageCode() {
        return pageCode;
    }

    public void setPageCode(int pageCode) {
        this.pageCode = pageCode;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getBeanList() {
        return beanList;
    }

    public void setBeanList(List<T> beanList) {
        this.beanList = beanList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PageBean<?> pageBean = (PageBean<?>) o;
        return pageCode == pageBean.pageCode &&
                totalPage == pageBean.totalPage &&
                totalCount == pageBean.totalCount &&
                pageSize == pageBean.pageSize &&
                Objects.equals(beanList, pageBean.beanList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pageCode, totalPage, totalCount, pageSize, beanList);
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "pageCode=" + pageCode +
                ", totalPage=" + totalPage +
                ", totalCount=" + totalCount +
                ", pageSize=" + pageSize +
                ", beanList=" + beanList +
                '}';
    }
}

