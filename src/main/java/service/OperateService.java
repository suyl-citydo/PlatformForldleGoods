package service;

import domain.Commodity;
import domain.Order;
import domain.PageBean;
import domain.Shopcart;

import java.util.List;
import java.util.Map;

public interface OperateService {

    List<Commodity> findSaleCommodity(String email);

    List<Shopcart> findMyShopcart(String email);

    List<Commodity> findInSaleCommodity(String email);

    List<Commodity> findDelCommodity(String email);

    int delCommodity(String id);

    int realDelCommodity(String id);

    int recoveryCommodity(String id);

    int addCollection(String id,String email);

    int plusCollectionNum(String id);

    int findIsCollection(String id, String email);

    int delCollection(String id, String email);

    int reduceCollectionNum(String id);

    List<Order> findOrders(String email);

    int updateCommodity(String id, String cname, Double cprice, Integer cnum, Double remarks, String bigType, String smallType, String describes);

    PageBean<Commodity> commodity(int pageCode, int pageSize, Map<String, Object> conMap);

    List<Commodity> findCollection(String email);

    List<Order> findSendOrder(String email);
}
