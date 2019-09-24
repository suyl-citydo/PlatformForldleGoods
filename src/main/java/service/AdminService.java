package service;

import domain.*;

import java.util.List;
import java.util.Map;

/**
 * @Author: suyl
 * @Date: 2019/4/16 20:41
 * @Descritpion: 管理员
 */
public interface AdminService {
    Admin adminLogin(Admin admin);

    int delUser(String id);

    int delCommodity(String id);

    void delOrder(String id);

    PageBean<User> toUserManage(int pageCode, int pageSize,Map<String, Object> conMap);

    PageBean<Commodity> toCommodityManage(int pageCode, int pageSize, Map<String, Object> conMap);

    PageBean<Order> toOrderManage(int pageCode, int pageSize, Map<String, Object> conMap);

    PageBean<User> findUserByCon(int pageCode, int pageSize, Map<String, Object> conMap);

    PageBean<Commodity> findCommodityByCon(int pageCode, int pageSize, Map<String, Object> conMap);

    PageBean<Order> findOrderByCon(int pageCode, int pageSize, Map<String, Object> conMap);

    User findUserInfo(String email);

    int updateUserInfo(String email, String newName, String name, String phone, String sex, Integer age, String province, String city, String county, String introduce);
}
