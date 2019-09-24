package controller;

import domain.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.AdminService;
import utils.UploadImg;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: suyl
 * @Date: 2019/4/16 20:41
 * @Descritpion: 管理员操作
 */
@Controller
public class AdminController {
    @Resource
    private AdminService adminService;
    private String newName="";

    //管理员登陆
    @RequestMapping(value = "/adminLogin")
    public String adminLogin(@ModelAttribute Admin admin,HttpServletRequest request,HttpSession session){
        Admin loginAdmin=adminService.adminLogin(admin);
        if(loginAdmin!=null){
            session.setAttribute("admin",admin);
            return "/jsp/admin/adminPage.jsp";
        }else {
            request.setAttribute("msg","账号或密码错误");
            return "/jsp/admin/adminLogin.jsp";
        }
    }

    //用户管理,分页
    @RequestMapping(value = "/toUserManage")
    public String toUserManage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "6", required = false) int pageSize,
                             HttpServletRequest request) {
        Map<String, Object> conMap = new HashMap<String, Object>();
        PageBean<User> pageBean = adminService.toUserManage(pageCode, pageSize,conMap);
        request.setAttribute("page",pageBean);
        return "jsp/admin/userManage.jsp";
    }

    //商品管理
    @RequestMapping(value = "/toCommodityManage")
    public String toCommodityManage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,
                             HttpServletRequest request) {
        Map<String, Object> conMap = new HashMap<String, Object>();
        PageBean<Commodity> pageBean = adminService.toCommodityManage(pageCode, pageSize,conMap);
        request.setAttribute("page",pageBean);
        return "jsp/admin/commodityManage.jsp";
    }

    //订单管理
    @RequestMapping(value = "/toOrderManage")
    public String toOrderManage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                                    @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,
                                    HttpServletRequest request) {
        Map<String, Object> conMap = new HashMap<String, Object>();
        PageBean<Order> pageBean = adminService.toOrderManage(pageCode, pageSize,conMap);
        request.setAttribute("page",pageBean);
        return "jsp/admin/orderManage.jsp";
    }

    //删除用户
    @RequestMapping(value = "/delUser")
    public String delUser(@RequestParam String id, HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
        int isDel=adminService.delUser(id);
        try {
            if(isDel==1){
                response.getWriter().print("删除成功");
            }else {
                response.getWriter().print("删除失败");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "toUserManage.do";
    }

    //删除商品
    @RequestMapping(value = "/delCommodity")
    public String delCommodity(@RequestParam String id, HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
        int isDel=adminService.delCommodity(id);
        try {
            if(isDel==1){
                response.getWriter().print("删除成功");
            }else {
                response.getWriter().print("删除失败");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "toCommodityManage.do";
    }

    //删除订单
    @RequestMapping(value = "/delOrder")
    public String delOrder(@RequestParam String id, HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
        adminService.delOrder(id);
        return "toOrderManage.do";
    }

    //根据用户名查找用户
    @RequestMapping(value = "/findUserByCon")
    public String findUserByCon(@RequestParam String name,@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                                @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,HttpServletRequest request){
        Map<String, Object> conMap = new HashMap<String, Object>();
        conMap.put("name",name);
        PageBean<User> pageBean= adminService.findUserByCon(pageCode,pageSize,conMap);
        request.setAttribute("name",name);
        request.setAttribute("page",pageBean);
        return "jsp/admin/userManage.jsp";

    }

    //根据商品名查找商品
    @RequestMapping(value = "/findCommodityByCon")
    public String findCommodityByCon(@RequestParam String name,@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                                @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,HttpServletRequest request){
        Map<String, Object> conMap = new HashMap<String, Object>();
        conMap.put("name",name);
        PageBean<Commodity> pageBean= adminService.findCommodityByCon(pageCode,pageSize,conMap);
        request.setAttribute("name",name);
        request.setAttribute("page",pageBean);
        return "jsp/admin/commodityManage.jsp";

    }

    //根据订单号查找订单
    @RequestMapping(value = "/findOrderByCon")
    public String findOrderByCon(@RequestParam String name,@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                                     @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,HttpServletRequest request){
        Map<String, Object> conMap = new HashMap<String, Object>();
        conMap.put("name",name);
        PageBean<Order> pageBean= adminService.findOrderByCon(pageCode,pageSize,conMap);
        request.setAttribute("name",name);
        request.setAttribute("page",pageBean);
        return "jsp/admin/orderManage.jsp";
    }

    //编辑用户信息
    @RequestMapping(value = "/toEditUserInfo")
    public String toEditUserInfo(@RequestParam String email,HttpServletRequest request,HttpSession session){
        User user=adminService.findUserInfo(email);
        request.setAttribute("user",user);
        session.setAttribute("update",user);
        return "jsp/admin/editUser.jsp";
    }

    //管理员更新用户信息
    @RequestMapping(value = "/updateHeadImg")
    public void uploadHeadImg(HttpServletRequest request, MultipartFile file, HttpSession session){
        newName= "/res/images/"+ UploadImg.uploadImg(file,request,this.newName);
    }

    @RequestMapping(value = "/updateUser")
    public String updateUserInfo(HttpServletRequest request,@RequestParam String name,@RequestParam String phone,@RequestParam String sex,@RequestParam Integer age,@RequestParam String province,@RequestParam String city,@RequestParam String county,@RequestParam String introduce,HttpSession session){
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        User user=(User)session.getAttribute("update");
        //防止简介,头像无
        try {
            if (introduce.equals("")){
                introduce=user.getIntroduce();
            }
            if(newName.equals("")){
                newName=user.getHead();
            }
            int isUpdate=adminService.updateUserInfo(user.getEmail(),newName,name,phone,sex,age,province,city,county,introduce);
            if (isUpdate==1){
                request.setAttribute("msg","更新成功");
            }
            newName = "";
            return "toUserManage.do";
        } catch (Exception e) {
            request.setAttribute("msg", "更新失败，请重试");
            return "toEditUserInfo.do?email="+((User) request.getAttribute("user")).getEmail();
        }
    }
}
