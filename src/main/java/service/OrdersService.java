package service;

import domain.OrderDetails;

import java.util.List;

/**
 * @Author: suyl
 * @Date: 2019/4/6 11:01
 * @Descritpion: 订单操作
 */
public interface OrdersService {
    int delOrders(String id);

    int delOrderDetails(String id);

    int confirmReceipt(String id);

    List<OrderDetails> seeDetails(String id);

    int sendCommodity(String id);

    int delSend(String id);
}
