package service.impl;

import domain.*;
import mapper.AdminMapper;
import mapper.OperateMapper;
import mapper.SearCommodityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import service.AdminService;
import utils.SetPageUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author: suyl
 * @Date: 2019/4/16 20:42
 * @Descritpion: 管理员
 */

@Service(value = "adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    private SearCommodityMapper searCommodityMapper;
    @Resource
    private AdminMapper adminMapper;
    @Resource
    private OperateMapper operateMapper;

    @Override
    public Admin adminLogin(Admin admin) {
        return adminMapper.adminLogin(admin);
    }

    @Override
    public int delUser(String id) {
        return adminMapper.delUser(id);
    }

    @Override
    public int delCommodity(String id) {
        return adminMapper.delCommodity(id);
    }

    @Override
    public void delOrder(String id) {
        adminMapper.delOrder(id);
    }

    @Override
    public PageBean<User> toUserManage(int pageCode, int pageSize, Map<String,Object> conMap) {
        PageBean<User> pageBean = new PageBean<User>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean,adminMapper,operateMapper, searCommodityMapper,pageCode, pageSize, conMap,0,"");
        List<User> userList = adminMapper.toUserManage(setPage);
        pageBean.setBeanList(userList);
        return pageBean;
    }

    @Override
    public PageBean<Commodity> toCommodityManage(int pageCode, int pageSize, Map<String, Object> conMap) {
        PageBean<Commodity> pageBean = new PageBean<Commodity>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean, adminMapper,operateMapper,searCommodityMapper, pageCode, pageSize, conMap,1,"");
        List<Commodity> commodityList = adminMapper.toCommodityManage(setPage);
        pageBean.setBeanList(commodityList);
        return pageBean;
    }

    @Override
    public PageBean<Order> toOrderManage(int pageCode, int pageSize, Map<String, Object> conMap) {
        PageBean<Order> pageBean = new PageBean<Order>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean, adminMapper,operateMapper, searCommodityMapper,pageCode, pageSize, conMap,2,"");
        List<Order>  orderList= adminMapper.toOrderManage(setPage);
        pageBean.setBeanList(orderList);
        return pageBean;
    }

    @Override
    public PageBean<User> findUserByCon(int pageCode, int pageSize, Map<String, Object> conMap) {
        PageBean<User> pageBean = new PageBean<User>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean, adminMapper,operateMapper, searCommodityMapper,pageCode, pageSize, conMap,6,String.valueOf(conMap.get("name")));
        List<User>  userList= adminMapper.findUserByCon(setPage);
        pageBean.setBeanList(userList);
        return pageBean;
    }

    @Override
    public PageBean<Commodity> findCommodityByCon(int pageCode, int pageSize, Map<String, Object> conMap) {
        PageBean<Commodity> pageBean = new PageBean<Commodity>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean, adminMapper,operateMapper, searCommodityMapper,pageCode, pageSize, conMap,7,String.valueOf(conMap.get("name")));
        List<Commodity> commodityList= adminMapper.findCommodityByCon(setPage);
        pageBean.setBeanList(commodityList);
        return pageBean;
    }

    @Override
    public PageBean<Order> findOrderByCon(int pageCode, int pageSize, Map<String, Object> conMap) {
        PageBean<Order> pageBean = new PageBean<Order>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean, adminMapper,operateMapper, searCommodityMapper,pageCode, pageSize, conMap,8,String.valueOf(conMap.get("name")));
        List<Order> orderList= adminMapper.findOrderByCon(setPage);
        pageBean.setBeanList(orderList);
        return pageBean;
    }

    @Override
    public User findUserInfo(String email) {
        return adminMapper.findUserInfo(email);
    }

    @Override
    public int updateUserInfo(String email, String newName, String name, String phone, String sex, Integer age, String province, String city, String county, String introduce) {
        return adminMapper.updateUserInfo(email,newName,name,phone,sex,age,province,city,county,introduce);
    }
}
