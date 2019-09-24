package controller;

import domain.Commodity;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.AddCommodityService;
import utils.CastTypeJson;
import utils.UploadImg;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

@Controller
public class AddCommodityController {

    @Resource
    private AddCommodityService addCommodityService;

    /*由于一个按钮触发两个controller,并且addCommodity使用了uploadImg的参数
    * 所以把newName作为类变量，并且addCommodity休眠2秒等到uploadImg完成
    * 在addCommodity里再判断newName是否为空串，不为空正常增加商品并且newName
    * 置空串，以此判断下次增加商品时参数是否获得新的值。
    */
    private String newName="";

    //ajax获取商品小类
    @RequestMapping(value = "/getSmallType")
    public void getSmallType(@RequestParam String bigType, HttpServletResponse response) throws IOException {
        ArrayList<String> smallTypeList = new ArrayList<String>();
        switch (bigType) {
            case "居家生活": {
                smallTypeList.clear();
                smallTypeList.add("家纺床品");
                smallTypeList.add("收纳日用");
                smallTypeList.add("厨房用品");
                response.setContentType("text/html; charset=utf-8");
                JSONArray jsonArray = CastTypeJson.getSmallTypeJson(smallTypeList);
                response.getWriter().print(jsonArray);
                break;
            }
            case "鞋包服饰": {
                smallTypeList.clear();
                smallTypeList.add("男装");
                smallTypeList.add("女装");
                smallTypeList.add("鞋靴");
                smallTypeList.add("箱包");
                smallTypeList.add("首饰配件");
                response.setContentType("text/html; charset=utf-8");
                JSONArray jsonArray = CastTypeJson.getSmallTypeJson(smallTypeList);
                response.getWriter().print(jsonArray);
                break;
            }
            case "个护清洁": {
                smallTypeList.clear();
                smallTypeList.add("彩妆香氛");
                smallTypeList.add("日常护理");
                smallTypeList.add("家清卫浴");
                response.setContentType("text/html; charset=utf-8");
                JSONArray jsonArray = CastTypeJson.getSmallTypeJson(smallTypeList);
                response.getWriter().print(jsonArray);
                break;
            }
            case "数码家电": {
                smallTypeList.clear();
                smallTypeList.add("生活电器");
                smallTypeList.add("厨房电器");
                smallTypeList.add("影音娱乐");
                response.setContentType("text/html; charset=utf-8");
                JSONArray jsonArray = CastTypeJson.getSmallTypeJson(smallTypeList);
                response.getWriter().print(jsonArray);
                break;
            }
            case "运动旅行": {
                smallTypeList.clear();
                smallTypeList.add("运动服饰");
                smallTypeList.add("运动鞋");
                smallTypeList.add("户外出行");
                smallTypeList.add("运动健身");
                response.setContentType("text/html; charset=utf-8");
                JSONArray jsonArray = CastTypeJson.getSmallTypeJson(smallTypeList);
                response.getWriter().print(jsonArray);
                break;
            }
            case "美食酒水": {
                smallTypeList.clear();
                smallTypeList.add("坚果蜜饯");
                smallTypeList.add("休闲零食");
                smallTypeList.add("酒水饮料");
                smallTypeList.add("生鲜特色");
                response.setContentType("text/html; charset=utf-8");
                JSONArray jsonArray = CastTypeJson.getSmallTypeJson(smallTypeList);
                response.getWriter().print(jsonArray);
                break;
            }
            default:
                throw new IllegalStateException("Unexpected value: " + bigType);
        }
    }

    //上传商品图片
    @RequestMapping(value = "/uploadImg")
    public void uploadImg(HttpServletRequest request, MultipartFile file) throws IOException {
        newName = UploadImg.uploadImg(file, request, this.newName);
    }

    //添加商品
    @RequestMapping(value = "/addCommodity")
    public String addCommodity(Commodity commodity, HttpServletRequest request){
        //等待图片上传成功
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        if(!newName.equals("")){
            Date date=new Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String id=UUID.randomUUID().toString().replace("-","");
            commodity.setId(id);
            commodity.setUrl("/res/images/"+newName);
            commodity.setTime(sdf.format(date.getTime()));
            int isSuccess = addCommodityService.addCommodity(commodity);
            newName = "";
            if(isSuccess==1) {
                request.setAttribute("msg", "添加成功");
            } else {
                request.setAttribute("msg","添加失败，请重试");
            }
            return "information.do";
        } else {
            request.setAttribute("msg", "添加失败，请重试");
            return "/jsp/user/information.jsp";
        }
    }
}
