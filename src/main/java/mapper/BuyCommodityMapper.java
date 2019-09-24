package mapper;

import domain.Commodity;
import domain.Order;
import domain.OrderDetails;
import domain.Shopcart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: suyl
 * @Date: 2019/3/25 17:51
 * @Descritpion: 购买商品的操作
 */
public interface BuyCommodityMapper {
    Commodity findDetails(String id);

    List<Commodity> findTopFive();

    int searCollection(@Param("id") String id, @Param("email") String email);

    int addShopCart(Shopcart shopcart);

    int findIsAddShopCart(@Param("cid") String cid, @Param("email") String email);

    int payment(@Param("email") String buyEmail, @Param("balance") double balance);

    void delOrders(Order order);

    int generateOrder(Order order);

    Commodity findCommodity(@Param("cid") String cid);

    int generateOrderDetails(OrderDetails orderDetails);

    void delOrdersDetails(OrderDetails orderDetails);

    List<Commodity> findCommodities(String[] ids);

    void modifyNum(@Param("cid") String cid, @Param("email") String email);

    Integer findCnum(@Param("cid") String id,@Param("email") String buyEmail);

    int delShopcart(String[] ids);

    void modifyIsSellOut(@Param("cid") String cid,@Param("cnum") Integer cnum);

    int findDetailsNum(@Param("id") String id);

    int delOne(@Param("id") String id);
}
