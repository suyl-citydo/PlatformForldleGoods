<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: su2017
  Date: 2019/2/19
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
</head>
<div id="list-cont">
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
                <a href="#" title="二手交易">
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


<div class="content content-nav-base information-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2" style="margin-left: 322px;position: absolute">
                    <a href="${pageContext.request.contextPath}/index.do" class="active">首页</a>
                    <a href="${pageContext.request.contextPath}/commodity.do">所有商品</a>
                    <a href="${pageContext.request.contextPath}/discount.do">优惠活动</a>
                    <a href="${pageContext.request.contextPath}/information.do?email=${sessionScope.user.email}">我的商品</a>
                    <a href="${pageContext.request.contextPath}/jsp/user/about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="category-con">
        <div class="category-inner-con w1200">
        </div>
        <div class="category-banner">
            <div class="w1200" style="width:100%;height: 400px;background-image: url('${pageContext.request.contextPath}/res/static/img/banner1.jpg')">
                <h3 style="padding-top: 70px;padding-left: 50px;font-size: 40px;color:seagreen">用闲置，换欢乐！</h3>
                <p style="padding-top: 70px;padding-left: 50px;font-size: 30px;color:seagreen;font-style: italic">让闲置的资源，换出崭新的感觉</p>
            </div>
        </div>
    </div>
    <div class="floors">
        <div class="sk">
            <div class="sk_inner w1200">
                <div class="sk_hd">
                    <a href="javascript:;">
                        <img src="${pageContext.request.contextPath}/res/static/img/s_img1.jpg">
                    </a>
                </div>
                <div class="sk_bd">
                    <div class="layui-carousel" id="test1" lay-filter="test1">
                        <div carousel-item="">
                            <div style="background-color:white">
                                <c:forEach items="${requestScope.indexList}" var="c" begin="0" end="3">
                                    <div class="item">
                                        <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}" alt=""></a>
                                        <div class="title">${c.cname}</div>
                                        <div class="price">
                                            <del style="margin-left: -44px">￥${c.cprice}&nbsp;&nbsp;</del>
                                            <span>￥${c.remarks}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div style="background-color: white">
                                <c:forEach items="${requestScope.indexList}" var="c" begin="4" end="7">
                                    <div class="item">
                                        <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}" alt=""></a>
                                        <div class="title">${c.cname}</div>
                                        <div class="price">
                                            <del style="margin-left: -44px">￥${c.cprice}&nbsp;&nbsp;</del>
                                            <span>￥${c.remarks}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
    </div>

   <div class="product-cont w1200" id="product-cont">
       <div class="product-item product-item1 layui-clear">
           <div class="left-title">
               <h4><i>1F</i></h4>
               <img src="${pageContext.request.contextPath}/res/static/img/icon_gou.png">
               <h5>服饰鞋包</h5>
           </div>
           <div class="right-cont">
               <a href="javascript:;" class="top-img"><img style="width:1000px;height: 200px" src="${pageContext.request.contextPath}/res/static/img/img1.jpg" alt=""></a>
               <div class="img-box">
                   <c:forEach items="${requestScope.firstFloor}" var="c">
                       <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}"></a>
                   </c:forEach>
               </div>
           </div>
       </div>
       <div class="product-item product-item2 layui-clear">
           <div class="left-title">
               <h4><i>2F</i></h4>
               <img src="${pageContext.request.contextPath}/res/static/img/icon_gou.png">
               <h5>数码家电</h5>
           </div>
           <div class="right-cont">
               <a href="javascript:;" class="top-img"><img style="width:1000px;height: 200px" src="${pageContext.request.contextPath}/res/static/img/img2.jpg" alt=""></a>
               <div class="img-box">
                   <c:forEach items="${requestScope.secondFloor}" var="c">
                       <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}"></a>
                   </c:forEach>
               </div>
           </div>
       </div>
       <div class="product-item product-item3 layui-clear">
           <div class="left-title">
               <h4><i>3F</i></h4>
               <img src="${pageContext.request.contextPath}/res/static/img/icon_gou.png">
               <h5>运动旅行</h5>
           </div>
           <div class="right-cont">
               <a href="javascript:;" class="top-img"><img style="width:1000px;height: 200px" src="${pageContext.request.contextPath}/res/static/img/img3.jpg" alt=""></a>
               <div class="img-box">
                   <c:forEach items="${requestScope.threeFloor}" var="c">
                       <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}"></a>
                   </c:forEach>
               </div>
           </div>
       </div>
   </div>

   <div class="product-list-box" id="product-list-box">
       <div class="product-list-cont w1200">
           <h4>更多推荐</h4>
           <div class="product-item-box layui-clear">
               <c:forEach items="${requestScope.moreList}" var="c">
                   <div class="list-item" style="width: 230px;height: 355px;border-radius: 2%">
                       <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}" style="width: 220px;height: 265px;margin-top: -20px"></a>
                       <p>${c.describes}</p>
                       <span>￥${c.remarks}</span>
                   </div>
               </c:forEach>
           </div>
       </div>
   </div>
</div>

<div class="footer">
   <div class="ng-promise-box" style="margin-left: 160px">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script type="text/javascript">
   layui.use('carousel',function(){
       var carousel = layui.carousel;
       carousel.render({
           elem: '#test1'
           ,width: '100%' //设置容器宽度
           ,arrow: 'hover'
           ,height:'298'
           ,anim:'fade'
           ,interval:'2500'
           ,indicator:'none'
       });
   });
</script>
</body>
</html>