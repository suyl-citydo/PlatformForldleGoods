package controller;

import domain.Commodity;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.UserService;
import utils.SendEmailPnum;
import utils.UploadImg;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

@Controller
public class UserController {

    @Resource
    private UserService userService;
    private String getpnum;
    private String newName="";
    //登陆，首先验证用户是否存在，如果不存在发送验证码并将邮箱写入数据库，如果存在只发送验证码
    @RequestMapping(value = "/login")
    public String login(@RequestParam String email, @RequestParam String pnum,@RequestParam String id, HttpSession session,HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("utf-8");
        User user=userService.findUser(email);
        String head="/res/static/img/default.jpg";//默认头像地址
        if(user!=null){
            if(pnum.equals(getpnum)&&!pnum.equals("")){
                session.setAttribute("user",user);
                int shopCartNum=userService.findShopCartNum(email);
                //修改商品是否是新品
                List<Commodity> commodityList=userService.findCommodity();
                String[] ids=new String[commodityList.size()];
                for(Commodity commodity:commodityList){
                    int i=0;
                    SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Calendar calendar=Calendar.getInstance();
                    try {
                        calendar.setTime(df.parse(commodity.getTime()));
                        long time=calendar.getTimeInMillis();
                        long nowTime=System.currentTimeMillis();
                        //如果商品上架大于三天，改为非新品
                        if(nowTime-time>259200000){
                            ids[i]=commodity.getId();
                            i += 1;
                        }
                        userService.modifyIsNew(ids);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                session.setAttribute("shopCartNum",shopCartNum);
                return "index.do";
            }else {
                request.setAttribute("msg","验证码错误");
                return "/jsp/user/login.jsp";
            }
        }else {
            if(pnum.equals(getpnum)&&!pnum.equals("")){
                userService.register(id,email,head);
                int shopCartNum=userService.findShopCartNum(email);
                session.setAttribute("shopCartNum",shopCartNum);
                session.setAttribute("user",userService.findUser(email));
                return "index.do";
            } else {
                request.setAttribute("msg","验证码错误");
                return "/jsp/user/login.jsp";
            }

        }
    }

    //获取验证码
    @RequestMapping(value = "/getPnum")
    public void getPnum(@RequestParam String email, HttpServletResponse response) throws MessagingException, IOException {
        //发送验证码
        getpnum = SendEmailPnum.sendEmail(email);
        //设置验证码失效时间,120s后验证码失效
        Timer timer=new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                getpnum="";
            }
        },120000);
        response.setCharacterEncoding("utf-8");
        if(getpnum.equals("")){
            response.getWriter().print("发送失败");
        }else {
            response.getWriter().print("发送成功");
        }
    }

    //退出登录
    @RequestMapping(value = "/outLogin")
    public String outLogin(@RequestParam String flag, HttpSession session){
        session.invalidate();
        if (flag.equals("0")){
            return "/jsp/user/login.jsp";
        }else
            return "/jsp/admin/adminLogin.jsp";
    }

    //定位到个人信息页面
    @RequestMapping(value = "/findUserInfo")
    public String findUserInfo(HttpSession session,HttpServletRequest request){
        User user=(User)session.getAttribute("user");
        if(user==null){
            request.setAttribute("msg", "请先登录！");
            return "/jsp/user/login.jsp";
        }else {
            return "/jsp/user/userinfo.jsp";
        }
    }

    //上传头像照片
    @RequestMapping(value = "/uploadHeadImg")
    public void uploadHeadImg(HttpServletRequest request, MultipartFile file,HttpSession session){
        newName= "/res/images/"+UploadImg.uploadImg(file,request,this.newName);
    }

    //更新个人信息
    @RequestMapping(value = "/updateUserInfo")
    public String updateUserInfo(HttpServletRequest request,@RequestParam String name,@RequestParam String phone,@RequestParam String sex,@RequestParam Integer age,@RequestParam String province,@RequestParam String city,@RequestParam String county,@RequestParam String introduce,HttpSession session){
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        User user=(User)session.getAttribute("user");
        //防止简介,头像无
        try {
            if (introduce.equals("")){
                introduce=user.getIntroduce();
            }
            if(newName.equals("")){
                newName=user.getHead();
            }
            int isUpdate=userService.updateUserInfo(user.getEmail(),newName,name,phone,sex,age,province,city,county,introduce);
            if (isUpdate==1){
                request.setAttribute("msg","更新成功");
                session.setAttribute("user",userService.findUser(user.getEmail()));
            }
            newName = "";
            return "/jsp/user/userinfo.jsp";
        } catch (Exception e) {
            request.setAttribute("msg", "更新失败，请重试");
            return "/jsp/userinfo.jsp";
        }
    }

    //活动页面
    @RequestMapping(value="/discount")
    public String hotsort(HttpSession session,HttpServletRequest request){
        User user=(User)session.getAttribute("user");
        if (user!=null){
            //今日活动，取活动价格比原先价格低的商品
            List<Commodity> commodityList=userService.findDiscount();
            //综合考虑收藏和价格的商品排行前三
            List<Commodity> threeTopList=userService.findThreeTop();
            request.setAttribute("commodityList",commodityList);
            request.setAttribute("threeTopList",threeTopList);
            return "/jsp/user/discount.jsp";
        }else {
            request.setAttribute("msg","请先登录！");
            return "/jsp/user/login.jsp";
        }
    }

    //首页
    @RequestMapping(value = "/index.do")
    public String index(HttpServletRequest request,HttpSession session){
        User user=(User)session.getAttribute("user");
        if(user==null){
            request.setAttribute("msg","请先登录！");
            return "/jsp/user/login.jsp";
        }
        //首页轮播，取降价百分比最高的八个商品
        List<Commodity> indexList= userService.findIndex();
        //查询一楼商品，取最近时间5条
        List<Commodity> firstFloor=userService.findFirstFloor();
        //查询二楼商品，取最近时间5条
        List<Commodity> secondFloor=userService.findSecondFloor();
        //查询三楼商品，取最近时间5条
        List<Commodity> threeFloor=userService.findThreeFloor();
        //更多推荐
        List<Commodity> moreList=userService.findMore();
        request.setAttribute("indexList",indexList);
        request.setAttribute("moreList",moreList);
        request.setAttribute("firstFloor",firstFloor);
        request.setAttribute("secondFloor",secondFloor);
        request.setAttribute("threeFloor",threeFloor);
        return "/jsp/user/index.jsp";
    }
}
