<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/27
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>优惠活动</title>
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
            <div><a href="${pageContext.request.contextPath}/findUserInfo.do"><img class="img-circle" title="${sessionScope.user.email}" alt="20x20" src="${pageContext.request.contextPath}${sessionScope.user.head}" style="width:22px;heigh:22px;border-radius: 50%;margin-top:-2px"/></a>
                &nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/shopcart.do?email=${sessionScope.user.email}">购物车</a>&nbsp;<span style="color: #ee0000">${sessionScope.shopCartNum}</span> &nbsp;&nbsp;<span>余额:${sessionScope.user.balance}</span>&nbsp;&nbsp;</div>
            <div><a href="${pageContext.request.contextPath}/outLogin.do?flag=0" style="text-decoration: none;;"><strong>退出登录</strong></a></div>
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


<div class="content content-nav-base buytoday-content">
    <div id="list-cont">
        <div class="main-nav">
            <div class="inner-cont0">
                <div class="inner-cont1 w1200">
                    <div class="inner-cont2" style="margin-left: 320px;position: absolute">
                        <a href="${pageContext.request.contextPath}/index.do">首页</a>
                        <a href="${pageContext.request.contextPath}/commodity.do">所有商品</a>
                        <a href="${pageContext.request.contextPath}/discount.do" class="active">优惠活动</a>
                        <a href="${pageContext.request.contextPath}/information.do?email=${sessionScope.user.email}">我的商品</a>
                        <a href="${pageContext.request.contextPath}/jsp/user/about.jsp">关于我们</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner-box">
            <div class="banner" style="width: 100%"></div>
        </div>
        <div class="product-list-box">
            <div class="product-list w1200">
                <div class="tab-title">
                    <a href="javascript:;" class="active tuang" data-content="tuangou" style="margin-left: 100px">今日活动</a>
                </div>
                <div class="list-cont" cont = 'tuangou'>
                    <div class="item-box layui-clear">
                        <c:if test="${requestScope.commodityList!=null}">
                            <c:forEach items="${requestScope.commodityList}" var="c">
                                <div class="item">
                                    <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}" alt="" style="width: 290px;height: 330px"></a>
                                    <div class="text-box">
                                        <p class="title">${c.cname}</p>
                                        <p class="plic">
                                            <span class="Ori-pic"><del>￥${c.cprice}</del></span>
                                            <span class="ciur-pic" style="color: red">￥${c.remarks}</span>
                                            <span class="discount"> <fmt:formatNumber value="${c.remarks/c.cprice}" pattern="#.##"/>折</span>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.commodityList==null}">
                            <br><br><br>
                            <span style="font-size: 60px; color: #888888;margin-left: -60px">暂无活动</span>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-wrap">
            <div class="footer w1200">
                <div class="title">
                    <h3>综合排行榜</h3>
                </div>
                <div class="list-box layui-clear" id="footerList">
                    <c:forEach var="c" items="${requestScope.threeTopList}" varStatus="st">
                        <div class="item">
                            <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}" alt="图片"style="width: 320px;height: 400px"></a>
                            <div class="text">
                                <div class="right-title-number">${st.index+1}</div>
                                <div class="commod">
                                    <p>${c.cname}</p>
                                    <span>￥${c.remarks}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','laypage','jquery'],function(){
        var laypage = layui.laypage,$ = layui.$;
        mm = layui.mm;
        laypage.render({
            elem: 'demo6'
            ,count: 100 //数据总数
        });


        $('body').on('click','*[data-content]',function(){
            $(this).addClass('active').siblings().removeClass('active')
            var dataConte = $(this).attr('data-content');
            $('*[cont]').each(function(i,item){
                var itemCont = $(item).attr('cont');
                console.log(item)
                if(dataConte === itemCont){
                    $(item).removeClass('layui-hide');
                }else{
                    $(item).addClass('layui-hide');
                }
            })
        })
    });
</script>


</body>
</html>
