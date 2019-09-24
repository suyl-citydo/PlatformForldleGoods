<%--
  Created by IntelliJ IDEA.
  User: su2017
  Date: 2018/10/21
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员登陆</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css"/>
    <style type="text/css">
        #content{
            width:40%;
            margin: 6% 30% 0 30%;
            height: 33%;
        }
    </style>
</head>
<body>
<div>
    <input type="hidden" value="${requestScope.msg}" id="msgId">
    <img style="width: 100%;height: 240px" src="${pageContext.request.contextPath}/res/images/color.jpeg">
</div>
<div class="container">
    <div id="content" style="border: 2px solid rgba(255,255,255,0.3);width: 550px;height: 400px;">
        <h2 class="text-nowrap" style="color: #393D49;text-align:center;padding-top:10%;font-family: Menlo">二手物品置换平台</h2>
        <br>
        <div style="text-align: center;">
            <br/>
            <label style="font-size:20px;color:white;padding-right:5%;">
                <h3 style="text-decoration: none;color:#009688;margin-left: 20px">管理员登录</h3>
            </label>
        </div>
        <hr style="color: #484848;text-align:center;"/>
        <!-- 登录的表单 -->
        <form action="${pageContext.request.contextPath}/adminLogin.do" id="loginform" method="post" class="layui-form" style="text-align: center;margin-right:12%;margin-top:10%;">
            <div>
                <div class="layui-form-item layui-inline" style="width:120%">
                    <label class="layui-form-label" style="margin-left:18.5%;">
                        <i class="layui-icon layui-icon-username"></i></label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" lay-verify="required" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Username"/>
                    </div>
                </div>
                <br/>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label" style="margin-left: 17px">
                        <i class="layui-icon layui-icon-password"></i>
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" lay-verify="required" name="password" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Password"/>
                    </div>
                </div>
                <br/>
                <br/>
                <div style="text-align:center;color: #009688;background-color: #01AAED;width:48%;margin-left:148px;">
                    <button id="loginId" class="layui-btn layui-btn-lg" style="background: none;" onclick="login()">Sing in</button>
                </div>
            </div>
        </form>
        <br><br><br><br><br>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/res/layui/layui.all.js" type="text/javascript"></script>
<script type="text/javascript">
    layui.use(['layer','element'], function(){
        var layer = layui.layer;
        var element = layui.element;
        if($("#msgId").val()=="账号或密码错误"){
            layer.msg("<span style='font-size: 17px'>"+"账号或密码错误!"+"</span>",{
                icon: 2,
                area: '210px',
                anim: 6,
                time:1500,
                offset: '300px',
            });
        }
    });

    function login() {
        debugger;
        var form = document.getElementById('loginform');
        form.submit();
        var ii = layer.load();
        setTimeout(function () {
            layer.close(ii);
        }, 5000);
    }
</script>
</html>
