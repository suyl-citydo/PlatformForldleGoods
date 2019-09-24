package controller;


import domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.OrdersService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Author: suyl
 * @Date: 2019/4/6 11:01
 * @Descritpion: 订单操作
 */

@Controller
public class OrdersController {

    @Resource
    private OrdersService ordersService;

    //删除收获订单
    @RequestMapping(value = "/delOrders")
    public String delOrders(@RequestParam String id, HttpServletRequest request, HttpSession session){
        User user=(User)session.getAttribute("user");
        //删除订单
        int isDelSuccess=ordersService.delOrders(id);
        if(isDelSuccess==1){
            request.setAttribute("msg","删除成功！");
        }else {
            request.setAttribute("msg","删除失败！");
        }
        return "information.do?email="+user.getEmail();
    }

    //删除发货订单
    @RequestMapping(value = "/delSend")
    public String delSend(@RequestParam String id, HttpServletRequest request, HttpSession session){
        User user=(User)session.getAttribute("user");
        //删除订单
        int isDelSuccess=ordersService.delSend(id);
        if(isDelSuccess==1){
            request.setAttribute("msg","删除成功！");
        }else {
            request.setAttribute("msg","删除失败！");
        }
        return "information.do?email="+user.getEmail();
    }


    //确认收货
    @RequestMapping(value = "/confirmReceipt")
    public String confirmReceipt(@RequestParam String id, HttpServletRequest request, HttpSession session){
        User user=(User)session.getAttribute("user");
        int isConfirm=ordersService.confirmReceipt(id);
        if(isConfirm==1){
            request.setAttribute("msg","确认收货");
        }else {
            request.setAttribute("msg","操作失败");
        }
        return "information.do?email="+user.getEmail();
    }

    //确认发货
    @RequestMapping(value = "/sendCommodity")
    public String sendCommodity(@RequestParam String id, HttpServletRequest request, HttpSession session){
        User user=(User)session.getAttribute("user");
        int isConfirm=ordersService.sendCommodity(id);
        if(isConfirm==1){
            request.setAttribute("msg","发货成功");
        }else {
            request.setAttribute("msg","发货成功");
        }
        return "information.do?email="+user.getEmail();
    }

    //查看订单明细
    @RequestMapping(value = "seeDetails")
    public String seeDetails(@RequestParam String id,HttpSession session){
        User user=(User)session.getAttribute("user");
        return "information.do?email=" + user.getEmail() + "&id=" + id;
    }
}
