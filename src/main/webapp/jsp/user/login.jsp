<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.UUID" %>
<%--
  Created by IntelliJ IDEA.
  User: su2017
  Date: 2019/2/19
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
</head>
<%
    String id= UUID.randomUUID().toString().replace("-","");
    pageContext.setAttribute("id",id);
%>
<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="${pageContext.request.contextPath}/index.do">首页</a>
        </p>
        <div class="sn-quick-menu">
            <div class="login active"><a href="${pageContext.request.contextPath}/jsp/user/login.jsp">登录</a></div>
            <div class="sp-cart"><a href="${pageContext.request.contextPath}/shopcart.do?email=${sessionScope.user.email}">购物车</a><span></span></div>
        </div>
    </div>
</div>



<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo" style="margin-left: -53px">
                <a href="#" title="二手商城">
                    <img src="${pageContext.request.contextPath}/res/static/img/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="#" class="layui-form" novalidate>
                    <input type="text" name="title" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo" id="search">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base  login-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2" style="margin-left: 320px;position: absolute">
                    <a href="${pageContext.request.contextPath}/index.do">首页</a>
                    <a href="${pageContext.request.contextPath}/commodity.do">所有商品</a>
                    <a href="${pageContext.request.contextPath}/discount.do">优惠活动</a>
                    <a href="${pageContext.request.contextPath}/information.do?email=${sessionScope.user.email}">我的商品</a>
                    <a href="${pageContext.request.contextPath}/jsp/user/about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="login-bg">
        <div class="login-cont w1200">
            <div class="form-box">
                <form class="layui-form" action="${pageContext.request.contextPath}/login.do" method="post">
                    <legend>邮箱登录</legend>
                    <div class="layui-form-item">
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-user iphone-icon"></i>
                                <input type="tel" name="email" id="email" lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                                <input type="hidden" name="id" value="${pageScope.id}">
                            </div>
                        </div>
                        <div class="layui-inline veri-code">
                            <div class="layui-input-inline">
                                <input id="pnum" type="password" name="pnum" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                                <input type="button" class="layui-btn" id="find"  value="验证码" />
                                <input type="hidden" name="" id="msgid" value="${requestScope.msg}">
                        </div>
                        </div>
                    </div>
                    <div class="layui-form-item login-btn">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1" >登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="ng-promise-box">
        <div class="ng-promise w1200">
            <p class="text">
                <a class="icon1" href="javascript:;">用户认证</a>
                <a class="icon2" href="javascript:;">199包邮</a>
                <a class="icon3" style="margin-right: 0" href="javascript:;">平台仲裁</a>
            </p>
        </div>
    </div>
    <div class="mod_help w1200">
        <p>
            <a href="javascript:;">关于我们</a>
            <span>|</span>
            <a href="javascript:;">帮助中心</a>
            <span>|</span>
            <a href="javascript:;">投诉反馈</a>
            <span>|</span>
            <a href="javascript:;">客服中心</a>
            <span>|</span>
            <a href="javascript:;">官方微博</a>
        </p>
        <p class="coty">二手物品交易平台版权所有 &copy; 2018-2020</p>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['layer','element','form','jquery'], function() {
        var $ = layui.$,form = layui.form;
        var layer = layui.layer;
        var element = layui.element;

        //提示错误信息
        if($("#msgid").val()=="验证码错误"){
            layer.msg("验证码错误!",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
            return false;
        }
        if($("#msgid").val()=="请先登录！"){
            layer.msg("请先登录!",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            })
        }

        //搜索框提示登陆
        $("#search").click(function () {
            layer.msg("<span style='font-size: 17px'>"+"请先登录!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        });
        //验证邮箱
        $("#find").click(function() {
            if(!/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test($("#email").val())){
                layer.msg("<span style='font-size: 17px'>"+"请输入正确邮箱!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
                return false;
            }
            var obj=this;
            $("#find").addClass("layui-btn-disabled");
            $('#find').attr('disabled',"true");
            settime(obj);
            var email=$("#email").val();
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/getPnum.do?email="+email,
                contentType:"application/text;charset=utf-8",
                dataType:"text",
                success:function(data) {
                    if(data=="发送成功"){
                        layer.msg("<span style='font-size: 17px'>"+"邮件发送成功!"+"</span>",{
                            icon: 1,
                            anim: 4,
                            time:1500,
                            offset: '300px',
                        });
                    }else{
                        layer.msg("<span style='font-size: 17px'>"+"邮件发送失败!"+"</span>",{
                            icon: 2,
                            anim: 6,
                            time:1500,
                            offset: '300px',
                        });
                    }
                },
                error:function(msg) {
                    layer.msg("<span style='font-size: 17px'>"+"无法连接服务器!"+"</span>",{
                        icon: 2,
                        anim: 6,
                        time:1500,
                        offset: '300px',
                    });
                }
            });
        });
        var countdown=60;
        function settime(obj) {
            if (countdown == 0) {
                obj.removeAttribute("disabled");
                obj.classList.remove("layui-btn-disabled");
                obj.value="获取验证码";
                countdown = 60;
                return;
            } else {
                obj.value="重新发送(" + countdown + ")";
                countdown--;
            }
            setTimeout(function() {
                    settime(obj);
                }
                ,1000)
        }
    })
</script>
</html>