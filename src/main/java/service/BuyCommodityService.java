package service;

import domain.Commodity;
import domain.Order;
import domain.OrderDetails;
import domain.Shopcart;

import java.util.List;

/**
 * @Author: suyl
 * @Date: 2019/3/25 17:50
 * @Descritpion: 购买商品的操作
 */

public interface BuyCommodityService {
    Commodity findDetails(String id);

    List<Commodity> findTopFive();

    int searCollection(String id, String email);

    int addShopCart(Shopcart shopcart);

    int findIsAddShopCart(String cid,String email);

    int payment(String buyEmail, double balance);

    void delOrders(Order order);

    int generateOrder(Order order);

    Commodity findCommodity(String cid);

    int generateOrderDetails(OrderDetails orderDetails);

    void delOrdersDetails(OrderDetails orderDetails);

    List<Commodity> findCommodities(String[] ids);

    void modifyNum(String cid, String email);

    Integer findCnum(String id, String buyEmail);

    int delShopcart(String[] ids);

    void modifyIsSellOut(String cid, Integer cnum);

    int findDetailsNum(String id);

    int delMore(String[] ids);

    int delOne(String id);
}
