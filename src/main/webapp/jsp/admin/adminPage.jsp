<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: su2017
  Date: 2019/3/21
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>管理主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 17px;"><strong>二手物品后台管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/admin/adminPage.jsp" style="text-decoration: none;"><strong>首页</strong></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">管理员：${sessionScope.admin.username}</li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/outLogin.do?flag=1" style="text-decoration: none;;"><strong>退出</strong></a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="javascript:;" onclick="javascript: toUserManage();" style="text-decoration: none;"><strong><span class="layui-icon layui-icon-user"></span>&nbsp;&nbsp;&nbsp;用户管理</strong></a></li>
                <li class="layui-nav-item"> <a href="javascript:;" onclick="javascript: toCommodityManage();" style="text-decoration: none;"><strong><span class="layui-icon layui-icon-cart-simple"></span>&nbsp;&nbsp;&nbsp;商品管理</strong></a></li>
                <li class="layui-nav-item"><a href="javascript:;" onclick="javascript: toOrderManage();" style="text-decoration: none;"><strong><span class="layui-icon layui-icon-release"></span>&nbsp;&nbsp;&nbsp;订单管理</strong></a></li>
                <li class="layui-nav-item"><a href="#" style="text-decoration: none;"><strong><span class="layui-icon layui-icon-tips"></span>&nbsp;&nbsp;&nbsp;关于我们</strong></a></li>
                <li class="layui-nav-item"><a href="#" style="text-decoration: none;"><strong><span class="layui-icon layui-icon-chat"></span>&nbsp;&nbsp;&nbsp;联系我们</strong></a></li>
            </ul>
        </div>
    </div>
    <!-- 以上都是共享内容 -->
    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div id="content">
            <div style="margin-top: 10px;" class="text-center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<iframe  style="padding-top: 20px;padding-left: 20px" scrolling="no" height="54" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=10&icon=1&num=3"></iframe>
            </div>
            <div style="font-size: 45px;color: #1D9D73;margin-top: 280px;" class="text-center"><strong>${sessionScope.name}您好,欢迎登录!</strong></div>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <strong>© 二手物品后台管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;Create by syl</strong>
        <strong class="layui-layout-right">系统时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/res/layui/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/res/layui/bootstrap.min.js"></script>
<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function toUserManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"${pageContext.request.contextPath}/toUserManage.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toCommodityManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"${pageContext.request.contextPath}/toCommodityManage.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toOrderManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"${pageContext.request.contextPath}/toOrderManage.do\" width=\"100%\" height=\"100%\"></object>";
    }
</script>
</html>