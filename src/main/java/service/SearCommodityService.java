package service;


import domain.Commodity;
import domain.PageBean;
import domain.User;

import java.util.List;
import java.util.Map;

public interface SearCommodityService {

    List<Commodity> findByConPage(Integer cprice, Integer isCollection, String startTime, String endTime);

    List<Commodity> searchCommodity(String title);

    PageBean<Commodity> findSmallCommodity(int pageCode, int pageSize, Map<String, Object> conMap, String smallType);

    PageBean<Commodity> findBigCommodity(int pageCode, int pageSize, Map<String, Object> conMap, String bigType);
}
