package service.impl;

import domain.OrderDetails;
import mapper.OrdersMapper;
import org.springframework.stereotype.Service;
import service.OrdersService;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: suyl
 * @Date: 2019/4/6 11:02
 * @Descritpion: 订单操作
 */

@Service(value = "ordersService")
public class OrdersServiceImpl implements OrdersService {

    @Resource
    private OrdersMapper ordersMapper;

    @Override
    public int delOrders(String id) {
        return ordersMapper.delOrders(id);
    }

    @Override
    public int delOrderDetails(String id) {
        return ordersMapper.delOrderDetails(id);
    }

    @Override
    public int confirmReceipt(String id) {
        return ordersMapper.confirmReceipt(id);
    }

    @Override
    public List<OrderDetails> seeDetails(String id) {
        return ordersMapper.seeDetails(id);
    }

    @Override
    public int sendCommodity(String id) {
        return ordersMapper.sendCommodity(id);
    }

    @Override
    public int delSend(String id) {
        return ordersMapper.delSend(id);
    }
}
