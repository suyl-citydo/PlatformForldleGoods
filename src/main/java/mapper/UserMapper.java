package mapper;

import domain.Commodity;
import domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    void register(@Param("id") String id,@Param("email") String email,@Param("head") String head);

    User findUser(String email);

    int findShopCartNum(String email);

    int updateUserInfo(@Param("email") String email,@Param("newName") String newName,@Param("name") String name,@Param("phone") String phone,@Param("sex") String sex,@Param("age") Integer age,@Param("province") String province,@Param("city") String city,@Param("county") String county,@Param("introduce") String introduce);

    List<Commodity> findDiscount();

    List<Commodity> findThreeTop();

    List<Commodity> findIndex();

    List<Commodity> findMore();

    List<Commodity> findFirstFloor();

    List<Commodity> findSecondFloor();

    List<Commodity> findThreeFloor();

    List<Commodity> findCommodity();

    void modifyIsNew(String[] ids);
}
