<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/1
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
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


<div class="content content-nav-base shopcart-content">
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
</div>
<div>
    <form method="post" action="${pageContext.request.contextPath}/updateUserInfo.do" class="layui-form" enctype="multipart/form-data" style="width:500px;position: absolute;margin-left: 450px;margin-top: 50px">
        <input id="msg" value="${requestScope.msg}" type="hidden">
        <div class="layui-form-item">
            <label class="layui-form-label">头&nbsp;&nbsp;&nbsp;&nbsp;像</label>
            <div class="layui-input-block">
                <img src="${pageContext.request.contextPath}${sessionScope.user.head}" alt="头像" style="height:120px;width: 120px;border-radius: 20%">
            </div>
            <div class="layui-upload">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;
                <button type="button" class="layui-btn layui-btn-primary" id="upload" style="margin-top:15px">
                    <i class="layui-icon">&#xe608;</i>修改头像
                </button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
            <div class="layui-input-block">
                <input type="text" name="email" disabled="disabled" value="${sessionScope.user.email}" placeholder="${sessionScope.user.email}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码框</label>
            <div class="layui-input-inline">
                <input type="password" name="password" value="" disabled="disabled" placeholder="无需密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">余&nbsp;&nbsp;&nbsp;&nbsp;额</label>
            <div class="layui-input-block">
                <input type="text" name="balance" value="${sessionScope.user.balance}" placeholder="${sessionScope.user.balance}" disabled="disabled" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;名</label>
           <div class="layui-input-inline">
               <input type="text" name="name" required lay-verify="required" value="${sessionScope.user.name}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电&nbsp;&nbsp;&nbsp;&nbsp;话</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" id="phone" required lay-verify="required" value="${sessionScope.user.phone}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性&nbsp;&nbsp;&nbsp;&nbsp;别</label>
            <div class="layui-input-block">
                <c:if test="${sessionScope.user.sex=='男'}">
                    <input type="radio" name="sex" value="男" title="男" checked>
                    <input type="radio" name="sex" value="女" title="女">
                </c:if>
                <c:if test="${sessionScope.user.sex=='女'}">
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="女" title="女" checked>
                </c:if>
                <c:if test="${sessionScope.user.sex==null}">
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="女" title="女">
                </c:if>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年&nbsp;&nbsp;&nbsp;&nbsp;龄</label>
            <div class="layui-input-inline">
                <input type="text" name="age" id="age" value="${sessionScope.user.age}" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">住&nbsp;&nbsp;&nbsp;&nbsp;址</label>
            <div class="layui-input-inline" style="width: 120px;position:relative;left:0px">
                <select name="province" id="Province" lay-filter="Province">
                    <option value="" selected=""></option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 120px;position:relative;left:5px">
                <select name="city" id="City" lay-filter="City">
                    <option value=""></option>
                </select>
            </div>
            <div class="layui-input-inline" style="width: 120px;position:relative;left:10px">
                <select name="county" id="County">
                    <option value=""></option>
                </select>
            </div>
            <div class="layui-input-inline" style="color:lightgrey;margin-top:20px;left:510px;position: absolute">
                <span>${sessionScope.user.province}-${sessionScope.user.city}-${sessionScope.user.county}</span>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">简&nbsp;&nbsp;&nbsp;&nbsp;介</label>
            <div class="layui-input-block">
                <textarea name="introduce" placeholder="${sessionScope.user.introduce}" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit id="sub">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/static/js/util/city.js">
</script>
<script>
    layui.use(['form','jquery','form','jquery', 'element','upload'],function(){
        var $ = layui.jquery;
        var upload=layui.upload;
        var layer=layui.layer;
        var form=layui.form;
        var areaData=Area;

        //提示更新信息状态
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

        //验证输入是否为数字
        $("#age").blur(function () {
            var age=$("#age").val();
            var re = /^[0-9]*$/;
            if (!re.test(age)) {
                layer.msg("<span style='font-size: 17px'>"+"请输入数字!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
                $("#age").val("");
            }
        });

        //验证手机号码格式是否正确
        $("#phone").blur(function () {
            var phone=$("#phone").val();
            if(!(/^1[34578]\d{9}$/.test(phone))){
                layer.msg("<span style='font-size: 17px'>"+"请输入正确的手机号!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
                $("#phone").val("");
            }
        });

        //默认先加载省份
        var obj = $("#Province");
        obj.html("");
        for (var i = 0; i < areaData.length; i++) {
            obj.append("<option name='' value=" + areaData[i].name + ">" + areaData[i].name + "</option>");
        }
        form.render('select');
        //联动加载市
        form.on('select(Province)',function () {
            var obj = $("#City");
            obj.html("");
            for (var i = 0; i < areaData.length; i++) {
                if($("#Province").val()==areaData[i].name){
                    for(var j=0;j<areaData[i].city.length;j++){
                        obj.append("<option name='' value=" + areaData[i].city[j].name + ">" + areaData[i].city[j].name + "</option>");
                    }
                }
            }
            form.render('select');
        });
        //联动加载县区
        form.on('select(City)',function () {
            var obj = $("#County");
            obj.html("");
            for (var i = 0; i < areaData.length; i++) {
                if($("#Province").val()==areaData[i].name){
                    for(var j=0;j<areaData[i].city.length;j++){
                        if($("#City").val()==areaData[i].city[j].name){
                            for(var m=0;m<areaData[i].city[j].districtAndCounty.length;m++){
                                obj.append("<option name='' value=" + areaData[i].city[j].districtAndCounty[m] + ">" + areaData[i].city[j].districtAndCounty[m] + "</option>");
                            }
                        }
                    }
                }
            }
            form.render('select');
        });

        //图片上传
        var uploadInst = upload.render({
            elem: '#upload',
            url: '${pageContext.request.contextPath}/uploadHeadImg.do',
            multiple: true,
            auto: false,
            //上传的单个图片大小
            size: 10240,
            //最多上传的数量
            number: 20,
            //MultipartFile file 对应，layui默认就是file,要改动则相应改动
            field: 'file',
            bindAction: '#sub',
            before: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#imgid').attr('src', result); //图片链接（base64）
                });
            },
            done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            },
            error: function () {
            }
        });

        //错误信息提示

    });
</script>
</html>
