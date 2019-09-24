package mapper;

import domain.OrderDetails;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: suyl
 * @Date: 2019/4/6 11:02
 * @Descritpion: 订单操作
 */
public interface OrdersMapper {
    int delOrders(@Param("id") String id);

    int delOrderDetails(@Param("id") String id);

    int confirmReceipt(@Param("id") String id);

    List<OrderDetails> seeDetails(@Param("orderId") String id);

    int sendCommodity(@Param("id") String id);

    int delSend(@Param("id") String id);
}
