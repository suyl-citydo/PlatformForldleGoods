package controller;

import domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.BuyCommodityService;
import service.OperateService;
import service.OrdersService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class OperateCommodityController {

    @Resource
    private OperateService operateService;
    @Resource
    private OrdersService ordersService;
    @Resource
    private BuyCommodityService buyCommodityService;

    //返回所有商品
    @RequestMapping(value = "/commodity")
    public String commodity(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                                    @RequestParam(value = "pageSize", defaultValue = "6", required = false) int pageSize,
                                    HttpServletRequest request,HttpSession session) {
        User user=(User)session.getAttribute("user");
        if(user==null){
            request.setAttribute("msg","请先登录！");
            return "jsp/user/login.jsp";
        }else {
            Map<String, Object> conMap = new HashMap<String, Object>();
            PageBean<Commodity> pageBean = operateService.commodity(pageCode, pageSize,conMap);
            request.setAttribute("page",pageBean);
            return "jsp/user/commodity.jsp";
        }
    }

    //查找我各个tab的商品
    @RequestMapping(value = "/information")
    public String information(@RequestParam String email,HttpSession session,@RequestParam(required = false) String id,@RequestParam(required = false) String cid, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        //查找information各个分页的商品以及商品的记录数
        if (session.getAttribute("user") != null && user.getEmail().equals(email)) {
            //获取我已售商品及其记录数
            List<Commodity> SaleCommodity = operateService.findSaleCommodity(email);
            int SaleNum = SaleCommodity.size();
            //获取我在售商品及其记录数
            List<Commodity> inSaleCommodity = operateService.findInSaleCommodity(email);
            int inSaleNum = inSaleCommodity.size();
            //获取收藏商品
            List<Commodity> inCollection=operateService.findCollection(email);
            int collectionNum=inCollection.size();
            //获取我删除的商品及其记录数
            List<Commodity> delCommodity = operateService.findDelCommodity(email);
            int delNum = delCommodity.size();
            //获取订单记录和记录数
            List<Order> orderList=operateService.findOrders(email);
            int orderNum=orderList.size();
            //获取发货订单记录
            List<Order> sendOrder=operateService.findSendOrder(email);
            int sendNum=sendOrder.size();
            List<OrderDetails> orderDetails;
            if(id!=null){
                if(id.length()>32){
                    String oriderId=id.substring(0,32);
                    orderDetails = ordersService.seeDetails(oriderId);
                    request.setAttribute("orderDetails",orderDetails);
                }else {
                    request.setAttribute("orderDetails", null);
                }
            }else {
                request.setAttribute("orderDetails", null);
            }
            if(cid!=null){
                Commodity commodity = buyCommodityService.findCommodity(cid);
                request.setAttribute("commodity",commodity);
            }else {
                request.setAttribute("commodity", null);
            }
            request.setAttribute("SaleCommodity", SaleCommodity);
            request.setAttribute("inSaleCommodity", inSaleCommodity);
            request.setAttribute("inCollection", inCollection);
            request.setAttribute("delCommodity", delCommodity);
            request.setAttribute("orderList",orderList);
            request.setAttribute("sendOrder", sendOrder);
            request.setAttribute("SaleNum", SaleNum);
            request.setAttribute("inSaleNum", inSaleNum);
            request.setAttribute("collectionNum", collectionNum);
            request.setAttribute("delNum", delNum);
            request.setAttribute("orderNum",orderNum);
            request.setAttribute("sendNum", sendNum);
            return "/jsp/user/information.jsp";
        } else {
            request.setAttribute("msg", "请先登录！");
            return "/jsp/user/login.jsp";
        }
    }


    //假删除我的商品
    @RequestMapping(value = "/delSaleCommodity")
    public String delSaleCommodity(@RequestParam String id, HttpServletRequest request, HttpSession session) {
        int i = operateService.delCommodity(id);
        String delSaleMsg = null;
        if (i == 1) {
            delSaleMsg = "删除成功！";
            request.setAttribute("msg", delSaleMsg);
        } else {
            delSaleMsg = "删除失败！";
            request.setAttribute("msg", delSaleMsg);
        }
        User user = (User) session.getAttribute("user");
        return "information.do?email=" + user.getEmail();
    }


    //恢复假删除的商品
    @RequestMapping(value = "/recoveryCommodity")
    public String recoveryCommodity(@RequestParam String id, HttpServletRequest request, HttpSession session) {
        int flag = operateService.recoveryCommodity(id);
        String recoveryMsg = null;
        if (flag == 1) {
            recoveryMsg = "恢复成功！";
            request.setAttribute("msg", recoveryMsg);
        } else {
            recoveryMsg = "恢复失败！";
            request.setAttribute("msg", recoveryMsg);
        }
        User user = (User) session.getAttribute("user");
        return "information.do?email=" + user.getEmail();
    }


    //真正删除商品
    @RequestMapping(value = "/realDelCommodity")
    public String realDelCommodity(@RequestParam String id, HttpServletRequest request, HttpSession session) {
        int flag = operateService.realDelCommodity(id);
        String realDelMsg = null;
        if (flag == 1) {
            realDelMsg = "删除成功！";
            request.setAttribute("msg", realDelMsg);
        } else {
            realDelMsg = "删除失败！";
            request.setAttribute("msg", realDelMsg);
        }
        User user = (User) session.getAttribute("user");
        return "information.do?email=" + user.getEmail();
    }

    //购物车
    @RequestMapping(value = "/shopcart")
    public String shopcart(@RequestParam String email, HttpSession session, HttpServletRequest request) {
        User user=(User) session.getAttribute("user");
        if (user!= null&&!email.equals("")) {
            List<Shopcart> myShopcart = operateService.findMyShopcart(user.getEmail());
            request.setAttribute("myShopcart", myShopcart);
            return "/jsp/user/shopcart.jsp";
        } else {
            request.setAttribute("msg", "请先登录！");
            return "/jsp/user/login.jsp";
        }
    }

    //ajax收藏功能
    @RequestMapping(value = "/addCollection")
    public void Collection(@RequestParam String id,@RequestParam String email,HttpServletResponse response,HttpSession session,HttpServletRequest request){
        response.setCharacterEncoding("utf-8");
        User user = (User) session.getAttribute("user");
        if(email.equals(user.getEmail())){
            try {
                response.getWriter().print("不能收藏自己的商品");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            //查找是否已经收藏过，再次点击取消收藏
            int isCollection=operateService.findIsCollection(id,user.getEmail());
            if(isCollection>0){
                int delNum=operateService.delCollection(id,user.getEmail());
                int reduceNum=operateService.reduceCollectionNum(id);
                try {
                    if(delNum!=0&&reduceNum!=0){
                        response.getWriter().print("取消收藏");
                    }else {
                        response.getWriter().print("取消收藏失败");
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                int addNum=operateService.addCollection(id,user.getEmail());
                int plusNum=operateService.plusCollectionNum(id);
                try {
                    if(addNum!=0&&plusNum!=0){
                        response.getWriter().print("收藏成功");
                    }else {
                        response.getWriter().print("收藏失败");
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //定位到修改页面，回显信息
    @RequestMapping(value = "/findUpdatePage")
    public String findUpdatePage(@RequestParam String id,HttpSession session){
        User user=(User)session.getAttribute("user");
        return "information.do?email="+user.getEmail()+"&cid="+id;
    }

    //修改信息
    @RequestMapping(value = "/updateCommodity")
    public void updateCommodity(HttpServletResponse response,HttpServletRequest request,@RequestParam String id,@RequestParam String cname,@RequestParam String cprice,@RequestParam String cnum,@RequestParam String remarks,@RequestParam String bigType,@RequestParam String smallType,@RequestParam String describes){
        int isUpdate=operateService.updateCommodity(id,cname,Double.parseDouble(cprice),Integer.parseInt(cnum),Double.parseDouble(remarks),bigType,smallType,describes);
        response.setCharacterEncoding("utf-8");
        try {
            if (isUpdate==1){
                response.getWriter().print("更新成功");
            }else {
                response.getWriter().print("更新失败");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //删除收藏
    @RequestMapping(value = "/delCollection")
    public String delCollection(@RequestParam String id,HttpServletRequest request,HttpSession session){
        User user=(User)session.getAttribute("user");
        int isDel=operateService.delCollection(id,user.getEmail());
        if(isDel==1){
            request.setAttribute("msg","删除成功！");
        }else {
            request.setAttribute("msg","删除成功！");
        }
        return "information.do?email=" + user.getEmail();
    }
}
