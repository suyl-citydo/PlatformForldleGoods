package controller;


import domain.Commodity;
import domain.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.SearCommodityService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class SearCommodityController {
    @Resource
    private SearCommodityService searCommodityService;

    //树状小类商品查找
    @RequestMapping(value = "/findSmallCommodity")
    public String findSmallCommodity(@RequestParam String smallType,@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                                     @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,
                                     HttpServletRequest request) {
        Map<String, Object> conMap = new HashMap<String, Object>();
        PageBean<Commodity> pageBean = searCommodityService.findSmallCommodity(pageCode, pageSize, conMap,smallType);
        request.setAttribute("page", pageBean);
        //request.setAttribute("Num", pageBean.getBeanList().size());
        request.setAttribute("Type", smallType);
        request.setAttribute("flag","small");
        return "/jsp/user/commodity.jsp";
    }

    //树状大类商品查找
    @RequestMapping(value = "/findBigCommodity")
    public String findBigCommodity(@RequestParam String bigType,@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                                     @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,
                                     HttpServletRequest request) {
        Map<String, Object> conMap = new HashMap<String, Object>();
        PageBean<Commodity> pageBean = searCommodityService.findBigCommodity(pageCode, pageSize, conMap,bigType);
        request.setAttribute("page", pageBean);
        //request.setAttribute("Num", pageBean.getBeanList().size());
        request.setAttribute("Type", bigType);
        request.setAttribute("flag","big");
        return "/jsp/user/commodity.jsp";
    }

    //多条件筛选商品查找
    @RequestMapping(value = "/findByConPage")
    public String findByConPage (@RequestParam Integer cprice,@RequestParam Integer isCollection,@RequestParam String type,@RequestParam String time,HttpServletRequest request) {
        String startTime = "";
        String endTime = "";
        if (!time.equals("")) {
            startTime = time.substring(0, 10);
            endTime = time.substring(13);
        } else {
            Date date = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            startTime = "2019-01-01 00:00:00";
            endTime = df.format(date.getTime());
        }
        //查出所有符合筛选条件的商品，此时没有区分小类。
        List<Commodity> conPageCommodity = searCommodityService.findByConPage(cprice, isCollection, startTime, endTime);
        /*区分小类：
         *在点击筛选时，把type传入后台，如果type传进数据库查找，过于麻烦，还有考虑大类和小类
         *在返回结果中遍历筛选类型更为简单，以此来保证在小类中条件筛选时返回结果都是该小类的
         */
        PageBean<Commodity> pageBean=new PageBean<Commodity>();
        if(type.equals("")){
            pageBean.setBeanList(conPageCommodity);
            request.setAttribute("page",pageBean);
            request.setAttribute("Num",pageBean.getBeanList().size());
        }
        else {
            List<Commodity> conTypeCommodity= new ArrayList<>();
            for(Commodity commodity:conPageCommodity){
                if(commodity.getBigType().equals(type)||commodity.getSmallType().equals(type)){
                    conTypeCommodity.add(commodity);
                }
            }
            pageBean.setBeanList(conPageCommodity);
            request.setAttribute("page",pageBean);
            request.setAttribute("Num",pageBean.getBeanList().size());
            request.setAttribute("Type",type);
        }
        //回显 条件筛选,在前端利用el表达式判断，比js增加selected属性更方便
        request.setAttribute("cStatus", cprice);
        request.setAttribute("iStatus",isCollection);
        request.setAttribute("time",time);
        return "/jsp/user/commodity.jsp";
    }

    //多页页面共用此方法，搜索框模糊搜索商品，利用标志参数来确定哪个页面请求，并返回到那个页面
    @RequestMapping(value = "/searchCommodity")
    public String searchCommodity(@RequestParam String title,@RequestParam Integer flag, HttpServletRequest request) {
        List<Commodity> searchCommodity = searCommodityService.searchCommodity(title);
        //request.setAttribute("Commodity", searchCommodity);
        PageBean pageBean=new PageBean();
        pageBean.setBeanList(searchCommodity);
        pageBean.setTotalCount(searchCommodity.size());
        request.setAttribute("title",title);
        request.setAttribute("page",pageBean);
        //request.setAttribute("Num",searchCommodity.size());
        switch (flag){
            case 0:{
                return "/jsp/user/commodity.jsp";
            }
            case 1:{
                return "/jsp/user/information.jsp";
            }
            default:{
                return null;
            }
        }
    }
}
