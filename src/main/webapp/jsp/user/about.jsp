<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/27
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>关于我们</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
</head>
<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="${pageContext.request.contextPath}/index.do">首页</a>
        </p>
        <div class="sn-quick-menu">
            <c:if test="${empty sessionScope.user}">
            <div class="login"><a href="${pageContext.request.contextPath}/jsp/user/login.jsp">登录</a></div>
            <a href="${pageContext.request.contextPath}/shopcart.do?email=${sessionScope.user.email}">购物车</a>&nbsp;<span style="color: #ee0000"></span> &nbsp;&nbsp;&nbsp;</div>
        </c:if>
        <c:if test="${not empty sessionScope.user}">
            <div><a href="${pageContext.request.contextPath}/findUserInfo.do"><img class="img-circle" title="${sessionScope.user.email}" alt="20x20" src="${pageContext.request.contextPath}${sessionScope.user.head}" style="width:22px;heigh:22px;border-radius: 50%;margin-top:-2px"/></a>
                &nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/shopcart.do?email=${sessionScope.user.email}">购物车</a>&nbsp;<span style="color: #ee0000">${sessionScope.shopCartNum}</span> &nbsp;&nbsp;<span>余额:${sessionScope.user.balance}</span>&nbsp;&nbsp;</div>
            <div><a href="${pageContext.request.contextPath}/outLogin.do?flag=0" style="text-decoration: none;;"><strong>退出登录</strong></a></div>
        </c:if>
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
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base about-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2" style="margin-left: 320px;position: absolute">
                    <a href="${pageContext.request.contextPath}/index.do">首页</a>
                    <a href="${pageContext.request.contextPath}/commodity.do">所有商品</a>
                    <a href="${pageContext.request.contextPath}/discount.do">优惠活动</a>
                    <a href="${pageContext.request.contextPath}/information.do?email=${sessionScope.user.email}">我的商品</a>
                    <a href="${pageContext.request.contextPath}/jsp/user/about.jsp" class="active">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="brief-content layui-clear w1200">
        <div class="img-box">
            <img src="${pageContext.request.contextPath}/res/static/img/us_img1.jpg">
            <img class="top" src="${pageContext.request.contextPath}/res/static/img/us_img2.jpg">
        </div>
        <div class="text">
            <p>我们坚持“绿色，可持续！”的理念，搭建便捷、放心的一站式二手物品置换平台，减少线下环节，深受每位客户的好评。相信细节决定成败，服务创造价值。平台通过不懈的努力诚信经营，以优质的服务与产品价格优势，赢得更多企业的信赖。</p>
        </div>
    </div>
    <div class="banner-text" style="width: 100%">
        <div class="w1200" style="margin-top: 0px">
            <p style="margin-top: -150px;margin-left:-100px;position: absolute">我们坚持“绿色，可持续！”的理念，搭建便捷、放心的一站式二手物品置换平台，减少线下环节，深受每位客户的好评。相信细节决定成败，服务创造价值。平台通过不懈的努力诚信经营，以优质的服务与产品价格优势，赢得更多企业的信赖。</p>
        </div>
    </div>
    <div class="after-sale w1200">
        <h4>配送售后</h4>
        <div class="item-box">
            <div class="item item1">
                <div class="img-box">
                    <img style="margin-top: 50px" src="${pageContext.request.contextPath}/res/static/img/us_icon1.png">
                </div>
                <p>7天无理由退换货</p>
            </div>
            <div class="item item2">
                <div class="img-box">
                    <img style="margin-top: 50px" src="${pageContext.request.contextPath}/res/static/img/us_icon2.png">
                </div>
                <p>全场满199元顺丰包邮</p>
            </div>
            <div class="item item3">
                <div class="img-box">
                    <img style="margin-top: 50px" src="${pageContext.request.contextPath}/res/static/img/us_icon3.png">
                </div>
                <p>优质客服服务</p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script type="text/javascript">

    layui.config({
        base: '${pageContext.request.contextPath}/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm'],function(){
        var
            mm = layui.mm;
    });
</script>
</body>
</html>