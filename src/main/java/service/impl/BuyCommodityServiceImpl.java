package service.impl;

import domain.Commodity;
import domain.Order;
import domain.OrderDetails;
import domain.Shopcart;
import mapper.BuyCommodityMapper;
import org.springframework.stereotype.Service;
import service.BuyCommodityService;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: suyl
 * @Date: 2019/3/25 17:51
 * @Descritpion: 购买商品的操作
 */

@Service(value = "buyCommodityService")
public class BuyCommodityServiceImpl implements BuyCommodityService {

    @Resource
    BuyCommodityMapper buyCommodityMapper;

    @Override
    public Commodity findDetails(String id) {
        return buyCommodityMapper.findDetails(id);
    }

    @Override
    public List<Commodity> findTopFive() {
        return buyCommodityMapper.findTopFive();
    }

    @Override
    public int searCollection(String id, String email) {
        return buyCommodityMapper.searCollection(id,email);
    }

    @Override
    public int addShopCart(Shopcart shopcart) {
        return buyCommodityMapper.addShopCart(shopcart);
    }

    @Override
    public int findIsAddShopCart(String cid,String email) {
        return buyCommodityMapper.findIsAddShopCart(cid,email);
    }


    @Override
    public int payment(String buyEmail, double balance) {
        return buyCommodityMapper.payment(buyEmail,balance);
    }

    @Override
    public void delOrders(Order order) {
        buyCommodityMapper.delOrders(order);
    }

    @Override
    public int generateOrder(Order order) {
        return buyCommodityMapper.generateOrder(order);
    }

    @Override
    public Commodity findCommodity(String cid) {
        return buyCommodityMapper.findCommodity(cid);
    }

    @Override
    public int generateOrderDetails(OrderDetails orderDetails) {
        return buyCommodityMapper.generateOrderDetails(orderDetails);
    }

    @Override
    public void delOrdersDetails(OrderDetails orderDetails) {
        buyCommodityMapper.delOrdersDetails(orderDetails);
    }

    @Override
    public List<Commodity> findCommodities(String[] ids) {
        return buyCommodityMapper.findCommodities(ids);
    }

    @Override
    public void modifyNum(String cid, String email) {
        buyCommodityMapper.modifyNum(cid, email);
    }

    @Override
    public Integer findCnum(String id, String buyEmail) {
        return buyCommodityMapper.findCnum(id,buyEmail);
    }

    @Override
    public int delShopcart(String[] ids) {
        return buyCommodityMapper.delShopcart(ids);
    }

    @Override
    public void modifyIsSellOut(String cid, Integer cnum) {
        buyCommodityMapper.modifyIsSellOut(cid,cnum);
    }

    @Override
    public int findDetailsNum(String id) {
        return buyCommodityMapper.findDetailsNum(id);
    }

    @Override
    public int delMore(String[] ids) {
        return buyCommodityMapper.delShopcart(ids);
    }

    @Override
    public int delOne(String id) {
        return buyCommodityMapper.delOne(id);
    }
}
