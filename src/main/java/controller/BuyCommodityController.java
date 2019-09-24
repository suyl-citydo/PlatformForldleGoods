package controller;

import domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.BuyCommodityService;
import service.UserService;
import utils.TimeUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @Author: suyl
 * @Date: 2019/3/25 17:48
 * @Descritpion: 购买商品的操作
 */

@Controller
public class BuyCommodityController {
    @Resource
    BuyCommodityService buyCommodityService;
    @Resource
    UserService userService;

    //商品细节
    @RequestMapping(value = "/details")
    public String findDetails(@RequestParam String id, HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "请先登录！");
            return "/jsp/user/login.jsp";
        } else {
            Commodity details = buyCommodityService.findDetails(id);
            //收藏商品推荐，收藏前五
            List<Commodity> topFive = buyCommodityService.findTopFive();
            //查询该商品是否被该用户收藏
            int isCollection = buyCommodityService.searCollection(id, user.getEmail());
            request.setAttribute("details", details);
            request.setAttribute("topFive", topFive);
            request.setAttribute("isCollection", isCollection);
            return "/jsp/user/details.jsp";
        }
    }

    //加入购物车
    @RequestMapping("/addShopCart")
    public void addShopCart(@RequestParam String cid, @RequestParam String cname, @RequestParam String cdescribes, @RequestParam String curl, @RequestParam double cprice, @RequestParam Integer cnum, @RequestParam String email, @RequestParam String address, HttpSession session, HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        response.setCharacterEncoding("utf-8");
        try {
            if (email.equals(user.getEmail())) {
                response.getWriter().print("不能加入自己的商品");
            } else {
                Shopcart shopcart = new Shopcart();
                String id = UUID.randomUUID().toString().replace("-", "");
                shopcart.setId(id);
                shopcart.setCid(cid);
                shopcart.setEmail(user.getEmail());
                shopcart.setCname(cname);
                shopcart.setCdescribes(cdescribes);
                shopcart.setCprice(cprice);
                shopcart.setCnum(cnum);
                shopcart.setCurl(curl);
                shopcart.setTime(TimeUtils.getTime());
                shopcart.setAddress(address);
                int searAddNum = buyCommodityService.findIsAddShopCart(cid, user.getEmail());
                if (searAddNum != 0) {
                    buyCommodityService.modifyNum(cid, user.getEmail());
                    response.getWriter().print("已经加入购物车");
                } else {
                    int addNum = buyCommodityService.addShopCart(shopcart);
                    if (addNum == 1) {
                        //刷新购物车数量
                        int shopCartNum = userService.findShopCartNum(user.getEmail());
                        session.setAttribute("shopCartNum", shopCartNum);
                        response.getWriter().print("加入成功");
                    } else {
                        response.getWriter().print("加入失败");
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //立即购买
    @RequestMapping(value = "/ImmedPur")
    public String buyCommodity(@RequestParam double balance, @RequestParam String cid, @RequestParam String cname, @RequestParam String cprice, @RequestParam String cnum, @RequestParam String address, @RequestParam String buyName, @RequestParam String buyPhone, HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        String id = UUID.randomUUID().toString().replace("-", "");
        String time = TimeUtils.getTime();
        String buyEmail = user.getEmail();
        Integer status = 0;
        double totalPrice = Double.parseDouble(cprice) * Integer.parseInt(cnum);
        Order order = new Order(id, buyEmail, buyName, buyPhone, totalPrice, Integer.parseInt(cnum), address, status, time);
        //创建订单
        int isSuccess = buyCommodityService.generateOrder(order);
        if (isSuccess == 1) {
            //创建订单明细
            String detailsId = UUID.randomUUID().toString().replace("-", "");
            Commodity commodity = buyCommodityService.findCommodity(cid);
            //通过email获取卖方信息
            User sellerUser = userService.findUser(commodity.getEmail());
            OrderDetails orderDetails = new OrderDetails(detailsId, id, cid, commodity.getUrl(), cname, commodity.getEmail(), sellerUser.getPhone(), buyEmail, buyName, buyPhone, Integer.parseInt(cnum), Double.parseDouble(cprice), totalPrice, commodity.getDescribes(), time);
            buyCommodityService.modifyIsSellOut(cid,Integer.parseInt(cnum));
            //写入订单详细表
            int isDetails = buyCommodityService.generateOrderDetails(orderDetails);
            if (isDetails == 1) {
                //扣除金额
                int isDeduction = buyCommodityService.payment(buyEmail, balance);
                if (isDeduction == 1) {
                    User refreshUser = userService.findUser(buyEmail);
                    session.setAttribute("user", refreshUser);
                    request.setAttribute("msg", "付款成功");
                    return "information.do?email=" + buyEmail;
                } else {
                    buyCommodityService.delOrders(order);
                    buyCommodityService.delOrdersDetails(orderDetails);
                    request.setAttribute("msg", "付款失败");
                    return "/jsp/user/shopcart.jsp";
                }
            } else {
                buyCommodityService.delOrders(order);
                request.setAttribute("msg", "付款失败");
                return "/jsp/user/shopcart.jsp";
            }
        } else {
            request.setAttribute("msg", "下单失败");
            return "/jsp/user/shopcart.jsp";
        }
    }

    //加入购物车后购买商品
    @RequestMapping("/payment")
    public String payment(@RequestParam String[] ids, @RequestParam double balance, @RequestParam Integer totalCnum, @RequestParam double priceTotal, HttpSession session, HttpServletRequest request) {
        String time = TimeUtils.getTime();
        String id = UUID.randomUUID().toString().replace("-", "");
        User user = (User) session.getAttribute("user");
        String buyEmail = user.getEmail();
        String address = user.getProvince() + user.getCity() + user.getCounty();
        String buyName = user.getName();
        String buyPhone = user.getPhone();
        Integer status = 0;
        Order order = new Order(id, buyEmail, buyName, buyPhone, priceTotal, totalCnum, address, status, time);
        int isSuccess = buyCommodityService.generateOrder(order);
        int isDetails = 0;
        OrderDetails orderDetails = null;
        if (isSuccess == 1) {
            //循环写入详细表
            List<Commodity> commodities = buyCommodityService.findCommodities(ids);
            for (String s : ids) {
                String detailsId = UUID.randomUUID().toString().replace("-", "");
                String url = "";
                String cname = "";
                String cemail = "";
                String sellPhone = "";
                Integer cnum = 0;
                double cprice = 0;
                double ctotalPrice = 0;
                String cdesc = "";
                String cid = "";
                for (Commodity commodity : commodities) {
                    if (commodity.getId().equals(s)) {
                        url = commodity.getUrl();
                        cname = commodity.getCname();
                        cemail = commodity.getEmail();
                        cprice = commodity.getRemarks();
                        cnum = buyCommodityService.findCnum(s, buyEmail);
                        ctotalPrice = cprice * cnum;
                        cdesc = commodity.getDescribes();
                        User buyUser = userService.findUser(cemail);
                        sellPhone = buyUser.getPhone();
                        cid=commodity.getId();
                    }
                }
                orderDetails = new OrderDetails(detailsId, id, s, url, cname, cemail, sellPhone, buyEmail, buyName, buyPhone, cnum, cprice, ctotalPrice, cdesc, time);
                //修改我在售商品的状态
                buyCommodityService.modifyIsSellOut(cid,cnum);
                isDetails += buyCommodityService.generateOrderDetails(orderDetails);
            }
            if (isDetails == ids.length) {
                //扣除金额
                int isDeduction = buyCommodityService.payment(buyEmail, balance);
                if (isDeduction == 1) {
                    User refreshUser = userService.findUser(buyEmail);
                    //清除选中的购物车商品
                    int isDel = buyCommodityService.delShopcart(ids);
                    session.setAttribute("user", refreshUser);
                    //更新购物车
                    int shopCartNum = userService.findShopCartNum(user.getEmail());
                    session.setAttribute("shopCartNum",shopCartNum);
                    request.setAttribute("msg", "付款成功");
                    return "information.do?email=" + buyEmail;
                } else {
                    buyCommodityService.delOrders(order);
                    buyCommodityService.delOrdersDetails(orderDetails);
                    request.setAttribute("msg", "付款失败");
                    return "/jsp/user/shopcart.jsp";
                }
            }
            else {
                request.setAttribute("msg", "下单失败");
                return "/jsp/user/shopcart.jsp";
            }
        } else {
            request.setAttribute("msg", "下单失败");
            return "/jsp/user/shopcart.jsp";
        }
    }

    //ajax查询商品数量是否充足
    @RequestMapping(value = "/findDetailsNum")
    public void findDetailsNum(@RequestParam String id,HttpServletResponse response){
        int detailsNum=buyCommodityService.findDetailsNum(id);
        try {
            response.getWriter().print(detailsNum);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //ajax购物车删除商品
    @RequestMapping(value = "/delMore")
    public String delMore(@RequestParam String[] ids,HttpServletResponse response,HttpSession session){
        response.setCharacterEncoding("utf-8");
        User user = (User) session.getAttribute("user");
        int isDel=buyCommodityService.delMore(ids);
        try {
            if (isDel>0){
                response.getWriter().print("删除成功");
            }else {
                response.getWriter().print("删除失败");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "shopcart.do?email="+user.getEmail();
    }

    //购物车删除单个商品
    @RequestMapping(value = "/delOne")
    public String delOne(@RequestParam String id,HttpServletRequest request,HttpSession session){
        int isDel=buyCommodityService.delOne(id);
        User user = (User) session.getAttribute("user");
        if (isDel>0){
            request.setAttribute("msg","删除成功");
        }else {
            request.setAttribute("msg","删除失败");
        }
        return "shopcart.do?email="+user.getEmail();
    }
}