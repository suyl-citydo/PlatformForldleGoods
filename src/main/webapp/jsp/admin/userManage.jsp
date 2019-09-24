<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/04/21
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="width: 90%;">
    <br/>
    <br/>
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>用户信息列表</strong></legend>
        </fieldset>
        <br/>
        <h5 style="margin-top: -20px;">
            <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
            <span style="color: #299A74;"><strong>输入查询信息</strong></span>
        </h5>
        <hr style="margin-top: 0;"/>
        <div class="form table">
            <div>
                <form class="layui-form form-inline" action="${pageContext.request.contextPath}/findUserByCon.do" role="form" method="post">
                    <input id="msg" value="${requestScope.msg}" type="hidden">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="margin-left: -10px;padding-left:0;"><strong>搜索用户</strong></label>
                        <div class="layui-input-inline">
                            <input name="name" placeholder="请输入用户姓名查询" value="${requestScope.name}" class="layui-input" type="text">
                        </div>
                        <div class="layui-input-inline" style="float: right">
                            <button class="layui-btn" type="submit">查询</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <h5>
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>查询结果展示</strong></span>
    </h5>
    <hr style="margin-top: 0;"/>
    <br/>
    <br/>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align: left">账号</th>
                <th style="text-align: left">姓名</th>
                <th style="text-align: left">电话</th>
                <th style="text-align: left">年龄</th>
                <th style="text-align: left">性别</th>
                <th style="text-align: left">余额</th>
                <th style="text-align: left;">住址</th>
                <th style="text-align: left;">操作</th>
            </tr>
            </thead>
            <tbody style="text-align: left">
            <c:forEach items="${requestScope.page.beanList}" var="user">
                <tr>
                    <td style="vertical-align: middle;">${user.email}</td>
                    <td style="vertical-align: middle;">${user.name}</td>
                    <td style="vertical-align: middle;">${user.phone}</td>
                    <td style="vertical-align: middle;">${user.age}</td>
                    <td style="vertical-align: middle;">${user.sex}</td>
                    <td style="vertical-align: middle;">${user.balance}</td>
                    <td style="vertical-align: middle;">${user.province}-${user.city}-${user.county}</td>
                    <td style="vertical-align: middle;">
                        <a class="layui-btn layui-btn-sm layui-btn-primary" href="${pageContext.request.contextPath}/toEditUserInfo.do?email=${user.email}">编辑</a>
                        <button type="button" onclick="return clean('${user.id}');" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <c:if test="${requestScope.name==null||requestScope.name==''}">
        <center>
            <form class="listForm" name="listForm" method="post" action="${pageContext.request.contextPath}/toUserManage.do">
                <div class="row">
                    <div class="form-inline" style="margin-left: 15px;">
                        <label style="font-size:14px;margin-top:22px;">
                            <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                            &nbsp;
                            &nbsp;
                            <strong>每页显示</strong>
                            <select class="form-control" name="pageSize">
                                <option value="5"
                                        <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                                </option>
                                <option value="10"
                                        <c:if test="${requestScope.page.pageSize == 10}">selected</c:if> >10
                                </option>
                                <option value="15"
                                        <c:if test="${requestScope.page.pageSize == 15}">selected</c:if> >15
                                </option>
                                <option value="20"
                                        <c:if test="${requestScope.page.pageSize == 20}">selected</c:if> >20
                                </option>
                            </select>
                            <strong>条</strong>
                            &nbsp;&nbsp;
                            <c:if test="${requestScope.page.pageCode>=2}">
                                <a href="${pageContext.request.contextPath}/toUserManage.do?pageCode=${requestScope.page.pageCode - 1}"><i class="layui-icon layui-icon-prev"></i></a>
                            </c:if>
                            <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                            class="form-control input-sm"
                                                            style="width:11%"/>&nbsp;<strong>页</strong>
                            &nbsp;
                            <c:if test="${requestScope.page.pageCode<requestScope.page.totalPage}">
                                <a href="${pageContext.request.contextPath}/toUserManage.do?pageCode=${requestScope.page.pageCode + 1}"><i class="layui-icon layui-icon-next"></i></a>
                            </c:if>
                            <button type="submit" class="btn btn-sm btn-info">GO!</button>
                        </label>
                    </div>
                </div>
            </form>
        </center>
    </c:if>
    <c:if test="${requestScope.name!=null&&requestScope.name!=''}">
        <center>
            <form class="listForm" name="listForm" method="post" action="${pageContext.request.contextPath}/findUserByCon.do">
                <div class="row">
                    <div class="form-inline" style="margin-left: 15px;">
                        <label style="font-size:14px;margin-top:22px;">
                            <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                            &nbsp;
                            &nbsp;
                            <strong>每页显示</strong>
                            <select class="form-control" name="pageSize">
                                <option value="5"
                                        <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                                </option>
                                <option value="10"
                                        <c:if test="${requestScope.page.pageSize == 10}">selected</c:if> >10
                                </option>
                                <option value="15"
                                        <c:if test="${requestScope.page.pageSize == 15}">selected</c:if> >15
                                </option>
                                <option value="20"
                                        <c:if test="${requestScope.page.pageSize == 20}">selected</c:if> >20
                                </option>
                            </select>
                            <strong>条</strong>
                            &nbsp;&nbsp;
                            <c:if test="${requestScope.page.pageCode>=2}">
                                <a href="${pageContext.request.contextPath}/findUserByCon.do?pageCode=${requestScope.page.pageCode - 1}"><i class="layui-icon layui-icon-prev"></i></a>
                            </c:if>
                            <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                            class="form-control input-sm"
                                                            style="width:11%"/>&nbsp;<strong>页</strong>
                            &nbsp;
                            <c:if test="${requestScope.page.pageCode<requestScope.page.totalPage}">
                                <a href="${pageContext.request.contextPath}/findUserByCon.do?pageCode=${requestScope.page.pageCode + 1}"><i class="layui-icon layui-icon-next"></i></a>
                            </c:if>
                            <button type="submit" class="btn btn-sm btn-info">GO!</button>
                        </label>
                    </div>
                </div>
            </form>
        </center>
    </c:if>
</div>
</body>
<script src="${pageContext.request.contextPath}/res/layui/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/res/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/res/layui/bootstrap.min.js"></script>
<script type="text/javascript">
    layui.use(['form','jquery'],function(){
        var $ = layui.jquery;
        var layer=layui.layer;
        if($("#msg").val()=="更新成功"){
            layer.msg("<span style='font-size: 17px'>"+"更新成功!"+"</span>",{
                icon: 1,
                anim: 4,
                time:1500,
                offset: '300px',
            });
        }
        if($("#msg").val()=="更新失败，请重试"){
            layer.msg("<span style='font-size: 17px'>"+"更新失败，请重试!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        }
    });
</script>
<script type="text/javascript">
    //删除
    function clean(id){
        layer.open({
            title: '警告信息',
            content: '你确定要删除？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                $.ajax({
                    url: '${pageContext.request.contextPath}/delUser.do',
                    type: 'POST',
                    data: {id: id},
                    success: function(data){
                        layer.open({
                            title: '提示信息',
                            content: '删除成功',
                            time: 2000,
                        });
                        $("body").html(data);
                    },
                    error: function(){
                        layer.open({
                            title: '提示信息',
                    content: '连接失败'
                });
            }
        });
        layer.close(index);
    }
    });
    }
</script>
</html>