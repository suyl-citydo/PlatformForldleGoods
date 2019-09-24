package mapper;

import domain.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Author: suyl
 * @Date: 2019/4/16 20:43
 * @Descritpion: 管理员
 */
public interface AdminMapper {
    Admin adminLogin(Admin admin);

    int delUser(String id);

    int delCommodity(String id);

    void delOrder(String id);

    List<User> toUserManage(Map<String,Object> setPage);

    List<Commodity> toCommodityManage(Map<String, Object> setPage);

    List<Order> toOrderManage(Map<String, Object> setPage);

    List<User> findUserByCon(Map<String, Object> setPage);

    List<Commodity> findCommodityByCon(Map<String, Object> setPage);

    List<Order> findOrderByCon(Map<String, Object> setPage);

    int userCount();

    int orderCount();

    int commodityCount();

    int userConCount(@Param("name") String type);

    int commodityConCount(@Param("cname") String type);

    int orderConCount(@Param("id") String type);

    User findUserInfo(@Param("email") String email);

    int updateUserInfo(@Param("email") String email,@Param("newName") String newName,@Param("name") String name,@Param("phone") String phone,@Param("sex") String sex,@Param("age") Integer age,@Param("province") String province,@Param("city") String city,@Param("county") String county,@Param("introduce") String introduce);
}
