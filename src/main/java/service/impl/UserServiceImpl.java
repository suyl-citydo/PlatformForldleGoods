package service.impl;

import domain.Commodity;
import domain.User;
import mapper.UserMapper;
import org.springframework.stereotype.Service;
import service.UserService;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "userServcie")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    //将用户信息写入数据库
    @Override
    public void register(String id, String email,String head) {
        userMapper.register(id,email,head);
    }

    @Override
    public User findUser(String email) {
        return userMapper.findUser(email);
    }

    @Override
    public int findShopCartNum(String email) {
        return userMapper.findShopCartNum(email);
    }

    @Override
    public int updateUserInfo(String email,String newName, String name, String phone, String sex, Integer age, String province, String city, String county, String introduce) {
        return userMapper.updateUserInfo(email,newName,name,phone,sex,age,province,city,county,introduce);
    }

    @Override
    public List<Commodity> findDiscount() {
        return userMapper.findDiscount();
    }

    @Override
    public List<Commodity> findThreeTop() {
        return userMapper.findThreeTop();
    }

    @Override
    public List<Commodity> findIndex() {
        return userMapper.findIndex();
    }

    @Override
    public List<Commodity> findMore() {
        return userMapper.findMore();
    }

    @Override
    public List<Commodity> findFirstFloor() {
        return userMapper.findFirstFloor();
    }

    @Override
    public List<Commodity> findSecondFloor() {
        return userMapper.findSecondFloor();
    }

    @Override
    public List<Commodity> findThreeFloor() {
        return userMapper.findThreeFloor();
    }

    @Override
    public List<Commodity> findCommodity() {
        return userMapper.findCommodity();
    }

    @Override
    public void modifyIsNew(String[] ids) {
        userMapper.modifyIsNew(ids);
    }
}
