package service.impl;


import domain.*;
import mapper.AdminMapper;
import mapper.OperateMapper;
import mapper.SearCommodityMapper;
import org.springframework.stereotype.Service;
import service.OperateService;
import utils.SetPageUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(value = "operateService")
public class OperateServiceImpl implements OperateService {

    @Resource
    private SearCommodityMapper searCommodityMapper;
    @Resource
    private AdminMapper adminMapper;
    @Resource
    private OperateMapper operateMapper;


    @Override
    public List<Commodity> findSaleCommodity(String email) {
        return operateMapper.findSaleCommodity(email);
    }

    @Override
    public List<Shopcart> findMyShopcart(String email) {
        return operateMapper.findMyShopcart(email);
    }

    @Override
    public List<Commodity> findInSaleCommodity(String email) {
        return operateMapper.findInSaleCommodity(email);
    }

    @Override
    public List<Commodity> findDelCommodity(String email) {
        return operateMapper.findDelCommodity(email);
    }

    @Override
    public int delCommodity(String id) {
        return operateMapper.delCommodity(id);
    }

    @Override
    public int realDelCommodity(String id) {
        return operateMapper.realDelCommodity(id);
    }

    @Override
    public int recoveryCommodity(String id) {
        return operateMapper.recoveryCommodity(id);
    }

    @Override
    public int addCollection(String id,String email) {
        return operateMapper.addCollection(id,email);
    }

    @Override
    public int plusCollectionNum(String id) {
        return operateMapper.plusCollectionNum(id);
    }

    @Override
    public int findIsCollection(String id, String email) {
        return operateMapper.findIsCollection(id,email);
    }

    @Override
    public int delCollection(String id, String email) {
        return operateMapper.delCollection(id,email);
    }

    @Override
    public int reduceCollectionNum(String id) {
        return operateMapper.reduceCollectionNum(id);
    }

    @Override
    public List<Order> findOrders(String email) {
        return operateMapper.findOrders(email);
    }


    @Override
    public int updateCommodity(String id, String cname, Double cprice, Integer cnum, Double remarks, String bigType, String smallType, String describes) {
        return operateMapper.updateCommodity(id,cname,cprice,cnum,remarks,bigType,smallType,describes);
    }

    @Override
    public PageBean<Commodity> commodity(int pageCode, int pageSize, Map<String, Object> conMap) {
        PageBean<Commodity> pageBean = new PageBean<Commodity>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean, adminMapper,operateMapper,searCommodityMapper, pageCode, pageSize, conMap,3,"");
        List<Commodity> commodityList = operateMapper.commodity(setPage);
        pageBean.setBeanList(commodityList);
        return pageBean;
    }

    @Override
    public List<Commodity> findCollection(String email) {
        return operateMapper.findCollection(email);
    }

    @Override
    public List<Order> findSendOrder(String email) {
        return operateMapper.findSendOrder(email);
    }
}
