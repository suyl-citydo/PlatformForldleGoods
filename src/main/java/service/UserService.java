package service;

import domain.Commodity;
import domain.User;

import java.util.List;

public interface UserService {

    void register(String id, String email, String head);

    User findUser(String email);

    int findShopCartNum(String email);

    int updateUserInfo(String email,String newName, String name, String phone, String sex, Integer age, String province, String city, String county, String introduce);

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
