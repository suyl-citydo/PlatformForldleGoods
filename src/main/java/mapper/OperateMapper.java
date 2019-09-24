package mapper;

import domain.Commodity;
import domain.Order;
import domain.Shopcart;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OperateMapper {
    List<Commodity> findSaleCommodity(String email);

    List<Shopcart> findMyShopcart(String email);

    List<Commodity> findInSaleCommodity(@Param("email") String email);

    List<Commodity> findDelCommodity(String email);

    int delCommodity(String id);

    int realDelCommodity(String id);

    int recoveryCommodity(String id);

    int addCollection(@Param("id") String id,@Param("email") String email);

    int plusCollectionNum(@Param("id") String id);

    int findIsCollection(@Param("id") String id,@Param("email") String email);

    int delCollection(@Param("id") String id,@Param("email") String email);

    int reduceCollectionNum(@Param("id") String id);

    List<Order> findOrders(@Param("email") String email);

    int findOrdersNum(@Param("email") String email);

    int updateCommodity(@Param("id") String id,@Param("cname") String cname,@Param("cprice") Double cprice,@Param("cnum") Integer cnum,@Param("remarks") Double remarks,@Param("bigType") String bigType,@Param("smallType") String smallType,@Param("describes") String describes);

    int commodityCount();

    List<Commodity> commodity(Map<String, Object> setPage);

    List<Commodity> findCollection(@Param("email") String email);

    List<Order> findSendOrder(@Param("email") String email);
}

